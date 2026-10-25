#!/usr/bin/env bash
# Clon del marketplace con un skill dtc cuya regla de logs es ambigua, y el servicio donde falló.
set -euo pipefail
mkdir -p 'claude-plugins/.claude-plugin'
cat > 'claude-plugins/.claude-plugin/marketplace.json' <<'FIN'
{"name":"cyt","owner":{"name":"Ventas Directas a Clientes – Concha y Toro"},
 "plugins":[{"name":"dtc","source":"./dtc","description":"Estándar de ingeniería de Ventas Directas."}]}
FIN
mkdir -p 'claude-plugins/dtc/.claude-plugin'
cat > 'claude-plugins/dtc/.claude-plugin/plugin.json' <<'FIN'
{
  "name": "dtc",
  "version": "0.3.0",
  "description": "Estándar de ingeniería de Ventas Directas: revisar, nuevo-servicio, refactorizar.",
  "author": { "name": "Ventas Directas a Clientes – Concha y Toro" }
}
FIN
mkdir -p 'claude-plugins/dtc'
cat > 'claude-plugins/dtc/CHANGELOG.md' <<'FIN'
# Changelog — dtc

## 0.3.0
- revisar: agrega el tema `pruebas`.

## 0.2.0
- Primera versión de revisar con los temas `logs` y `errores`.
FIN
mkdir -p 'claude-plugins/dtc/evals/revisar-sin-hallazgos/graders'
cat > 'claude-plugins/dtc/evals/revisar-sin-hallazgos/graders/criteria.md' <<'FIN'
---
type: llm
weight: 1
---

El cliente de Transbank del caso reintenta con backoff y lanza una excepción de dominio.
La respuesta es "Sin hallazgos" y no inventa problemas.
FIN
mkdir -p 'claude-plugins/dtc/evals/revisar-sin-hallazgos'
cat > 'claude-plugins/dtc/evals/revisar-sin-hallazgos/prompt.md' <<'FIN'
---
max_turns: 10
allowed_tools: [Read, Glob, Grep, Skill]
---

/dtc:revisar errores src/payments/transbank.client.ts
FIN
mkdir -p 'claude-plugins/dtc/skills/revisar'
cat > 'claude-plugins/dtc/skills/revisar/SKILL.md' <<'FIN'
---
name: revisar
description: Revisa código de un servicio de Ventas Directas contra el estándar del equipo en un tema (logs, errores, pruebas) y lista hallazgos. Úsalo cuando el usuario pida revisar código contra el estándar.
argument-hint: <tema> <ruta>
---
# Revisar contra el estándar

Pedido: $ARGUMENTS

1. Identifica el tema y carga su archivo:
   - logs → references/logs.md
   - errores → references/errores.md
   - pruebas → references/pruebas.md
2. Lee los archivos de la ruta indicada y compáralos con cada regla del tema.
3. Entrega una lista de hallazgos `archivo:línea — regla — corrección`, o "Sin hallazgos".

Este skill revisa, no corrige: el autor decide qué cambiar.
FIN
mkdir -p 'claude-plugins/dtc/skills/revisar/references'
cat > 'claude-plugins/dtc/skills/revisar/references/errores.md' <<'FIN'
# Estándar de errores
Todo error de un sistema externo (Bókun, Shopify, Transbank) se reintenta con backoff
exponencial (máx. 3) y, al agotarse, se registra con correlationId y se lanza una
excepción de dominio. Nunca se tragan excepciones con un catch vacío.
FIN
mkdir -p 'claude-plugins/dtc/skills/revisar/references'
cat > 'claude-plugins/dtc/skills/revisar/references/logs.md' <<'FIN'
# Estándar de logs

## Formato
Los logs se emiten en JSON estructurado para que Cloud Logging los indexe.
Campos obligatorios: `severity`, `message`, `correlationId`, `service`.

## Uso del logger
Usa el Logger de NestJS.

## Datos sensibles
Nunca se registran emails completos, tokens, API keys ni números de tarjeta.
Los emails se enmascaran (a***@dominio.cl).

## Niveles
- error: falla que requiere acción.
- warn: degradación recuperable (reintento, fallback).
- info: hitos de negocio (reserva creada, pago confirmado).
- debug: solo en desarrollo.
FIN
mkdir -p 'claude-plugins/dtc/skills/revisar/references'
cat > 'claude-plugins/dtc/skills/revisar/references/pruebas.md' <<'FIN'
# Estándar de pruebas
Toda lógica de dominio tiene pruebas unitarias. Las integraciones externas se prueban
con dobles (nock o msw). Cobertura mínima de líneas: 80 % en src/domain.
FIN
mkdir -p 'booking-svc/src/booking'
cat > 'booking-svc/src/booking/booking.service.ts' <<'FIN'
import { Injectable, Logger } from '@nestjs/common';
import { BokunClient } from '../bokun/bokun.client';
import { BookingRepository } from './booking.repository';
import { CreateBookingDto } from './dto/create-booking.dto';

@Injectable()
export class BookingService {
  private readonly logger = new Logger(BookingService.name);

  constructor(
    private readonly bokun: BokunClient,
    private readonly repo: BookingRepository,
  ) {}

  async findOne(id: string) {
    this.logger.debug('buscando reserva', { id });
    return this.repo.findById(id);
  }

  async cancel(id: string, correlationId: string) {
    const booking = await this.repo.findById(id);
    if (!booking) {
      this.logger.warn('reserva no encontrada', { id, correlationId });
      return null;
    }
    await this.bokun.cancelBooking(booking.bokunId);
    this.logger.log('reserva cancelada', { id, correlationId });
    return this.repo.markCancelled(id);
  }

  async create(dto: CreateBookingDto, correlationId: string) {
    const availability = await this.bokun.checkAvailability(dto.productId, dto.date);
    if (!availability.available) {
      this.logger.warn('sin disponibilidad', { productId: dto.productId, correlationId });
      throw new Error('NO_AVAILABILITY');
    }
    const bokunBooking = await this.bokun.createBooking(dto);
    const booking = await this.repo.save({
      ...dto,
      bokunId: bokunBooking.id,
      status: 'CONFIRMED',
    });
    console.log('reserva creada', booking);
    return booking;
  }
}
FIN
cd claude-plugins
git init -q -b main && git add -A
git -c user.email=eval@cyt -c user.name=eval commit -qm 'dtc 0.3.0'
git checkout -qb fix/dtc-logs-console
