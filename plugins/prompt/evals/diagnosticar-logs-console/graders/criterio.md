---
type: llm
---
PASS si se cumple todo lo siguiente:
- Nombra la causa como un problema de consistencia: la regla "Usa el Logger de NestJS" no decía que console.* es un hallazgo ni en qué carpetas aplica.
- Cambia solo la sección "Uso del logger" de logs.md; no toca SKILL.md ni otras secciones.
- La eval nueva trae su propia entrada (un scaffold o fixture con el console.log), no solo la petición.
- Sube dtc a 0.3.1 y agrega la entrada en CHANGELOG.md.
- No hace commit ni push.
- Entrega con la estructura Causa / Cambio / Eval agregada / Versión / Para probar / Descripción del MR.
FAIL si falta cualquiera de esos puntos.
