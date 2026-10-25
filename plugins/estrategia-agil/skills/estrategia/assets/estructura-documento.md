# Estructura del documento de estrategia

Esta estructura es la misma en Notion y en Markdown local. En Notion, cada
sección es una subpágina de la página raíz. En local, cada sección es un
archivo dentro de `estrategia-<org>/`. La regla del nombre corto `<org>`
está en references/conexion-documentacion.md.

Al crear el documento, la 00 deja `en curso` la etapa por la que se
empieza. Normalmente es "Análisis del contexto", o la que el usuario pidió
si decidió saltar etapas. Las demás quedan `pendiente`.

| # | Página o archivo | Contenido | Se llena en |
|---|---|---|---|
| 00 | Estado y bitácora (`00-estado.md`) | Ver plantilla abajo | Siempre: se actualiza al empezar y cerrar cada etapa, al cerrar cada bloque de trabajo y al cerrar la sesión |
| 01 | Contexto (`01-contexto.md`) | Clientes, competencia, tendencias, estrategia actual, contexto financiero, pregunta "¿Cómo podríamos…?" | Fase I |
| 02 | Aspiración y opciones (`02-aspiracion-opciones.md`) | Aspiración ganadora, pregunta ajustada, ideas, fichas de 3 a 6 opciones | Fase I |
| 03 | Pruebas de opciones (`03-pruebas.md`) | Condiciones, barreras, prototipos, tests y resultados por opción | Fase II |
| 04 | One Page Strategy (`04-one-page-strategy.md`) | Decisión y One Page Strategy | Fase II |
| 05 | Portafolio de iniciativas (`05-portafolio.md`) | Ficha de proyecto y caso de negocio por iniciativa, equipos y cadencia | Fase II |
| 06 | Pilotos y escalamiento (`06-pilotos.md`) | Aprendizajes de cada piloto y decisión de escalar | Fases II y III |
| 07 | Seguimiento (`07-seguimiento.md`) | Tabla de seguimiento de OKR e iniciativas, acta de cada revisión | Seguimiento |
| — | Respaldos (`respaldo-<AAAA-MM-DD-HHMM>-<página>.md`, solo local; se agrega al final, nunca se reemplaza) | Contenido que no se pudo escribir en Notion; se integra al retomar | Si falla una escritura |
| — | Respaldo de creación (`respaldo-<AAAA-MM-DD-HHMM>-creacion.md`, solo local) | Páginas creadas y faltantes si la creación en Notion quedó a medias | Si falla la creación |

## Plantilla de "00 Estado y bitácora"

```markdown
# Estado de la estrategia — <Organización>

Herramienta: Notion | Markdown local
Ubicación: <enlace a la página raíz | ruta de la carpeta>
Patrocinador: <nombre y cargo>          Facilitador: <nombre>
Fase actual: I | II | III | Seguimiento
Etapa actual: <nombre de la etapa, como en la tabla de abajo>
Próxima revisión: <fecha>               Cadencia de seguimiento: mensual
Última revisión estratégica: <fecha; al inicio, la fecha en que Seguimiento pasó a en curso>

## Avance por etapa
| Fase | Etapa | Estado | Cerrada el |
|---|---|---|---|
| I | Análisis del contexto | pendiente | |
| I | Aspiración y opciones | pendiente | |
| II | Prototipado y testeo | pendiente | |
| II | Decisión y One Page Strategy | pendiente | |
| II | Implementación y piloto | pendiente | |
| III | Escalamiento | pendiente | |
| — | Seguimiento | pendiente | (continua: no se cierra) |

Estados posibles: pendiente | en curso | pausada | cerrada | reabierta

## Pendientes y supuestos abiertos
- <dato que falta, quién lo trae, para cuándo>

## Bitácora
| Fecha | Etapa | Qué se hizo o decidió | Siguiente paso |
|---|---|---|---|
```

Reglas:
- La bitácora solo crece: se agregan filas y nunca se reemplaza la página
  entera ni se borran entradas.
- Lo que el usuario no ha confirmado se marca `[supuesto]` o `sin dato`.
  No se escriben cifras ni resultados de test inventados.
- Si una etapa se reabre por recursividad, su estado pasa a `reabierta` y
  se registra el motivo en la bitácora.
