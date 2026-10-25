# Cómo escribir el listón de calidad

El listón es lo que el crítico usa para aprobar o rechazar. Si es vago,
el crítico aprueba cualquier cosa razonable y el bucle no agrega valor.

## Si existe un estándar del equipo
Toma los criterios de ahí (por ejemplo, de un skill de estándares del
repositorio) y cita el archivo de origen. No los reformules: el crítico
debe juzgar contra la regla del equipo, no contra tu versión de ella.

## Criterios verificables
Cada criterio debe permitir a un revisor decir si se cumple, con
evidencia. Convierte lo vago en observable:

| Vago | Verificable |
|---|---|
| Buen manejo de errores | Todo error externo se reintenta con backoff y, al agotarse, se registra con correlationId y genera alerta |
| Código limpio | Ninguna función supera una responsabilidad; la lógica de negocio no depende del framework HTTP |
| Documento claro | Cada sección responde una pregunta del lector indicada en la caja 1; no hay términos sin definir |

Usa entre 4 y 8 criterios. Con menos, el crítico no tiene con qué
rechazar; con más, la revisión se dispersa y los criterios importantes
pierden peso.

## Escala de puntaje
El crítico puntúa cada criterio así:

- **5**: se cumple, con evidencia concreta y sin observaciones.
- **4**: se cumple; hay observaciones menores que no bloquean.
- **3**: se cumple en parte; falta algo que el usuario notaría.
- **2**: hay un intento, pero no cumple.
- **1**: ausente.

La pieza se aprueba con todos los criterios en 4 o más y ninguna
restricción fallida.

## Lo que no va en el listón
- Restricciones binarias: van en la caja 4.
- Preferencias puntuales de esta tarea que no son de calidad (por ejemplo,
  un nombre concreto para una variable): van en la caja 1.
- Buenas prácticas que cualquier resultado razonable ya cumple: no ayudan
  al crítico a distinguir y solo ocupan espacio.
