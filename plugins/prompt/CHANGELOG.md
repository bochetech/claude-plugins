# Changelog — prompt

## 0.2.2
- Se mueve del marketplace `cyt` (GitLab de Concha y Toro) al marketplace personal `boche` en GitHub. Sin cambios en los skills.

## 0.2.1
- mejorar y ejecutar: manejan el encargo vacío (al elegir el comando en el menú se ejecuta sin texto): proponen el último pedido de la conversación o preguntan cuál.

## 0.2.0
- mejorar: entrega el encargo completo con los huecos marcados `[supuesto]` y las preguntas en el mismo turno, en vez de detenerse solo con preguntas. Refuerza que lo no pedido va a "Sugerencias fuera de alcance".
- ejecutar: muestra el encargo con supuestos y preguntas juntos; recibe `$ARGUMENTS`. Una pieza aprobada que se corrige después vuelve a revisión o se declara en la entrega.
- diagnosticar: la eval de regresión usa el formato de `claude plugin eval` y trae su propia entrada (scaffold); reporta otros defectos vistos sin corregirlos.
- Evals del plugin en `evals/` (mejorar-supuestos, ejecutar-tarea-pequena, diagnosticar-logs-console).
- README: rutas del repositorio `ingenieria/claude-plugins` e instalación.

## 0.1.0
- Primera versión: `mejorar`, `ejecutar` y `diagnosticar`.
