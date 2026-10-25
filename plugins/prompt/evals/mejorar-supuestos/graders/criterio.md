---
type: llm
---
PASS si la respuesta cumple todo lo siguiente:
- Contiene el encargo completo en cuatro cajas: Tarea, Método, Listón de calidad y Restricciones.
- No se limita a hacer preguntas: el encargo está escrito aunque falten datos, con los huecos marcados [supuesto].
- El listón tiene entre 4 y 8 criterios verificables; las restricciones son condiciones de sí o no.
- Considera la regulación chilena de publicidad de alcohol o el consentimiento de marketing como listón o restricción.
- Las piezas del encargo son los dos emails y su configuración; lo no pedido (variantes A/B, grupo de control, plan de medición, más emails o canales) aparece solo en "Sugerencias fuera de alcance", si aparece.
- No redacta los emails finales ni dice haber construido el flujo.
- Termina indicando que puede lanzarlo con /prompt:ejecutar.
FAIL si falta cualquiera de esos puntos.
