# Cómo escribir un encargo en cuatro cajas

Un encargo está completo cuando un constructor puede ejecutarlo sin
improvisar y un crítico puede juzgarlo sin preguntar qué se quería.

## Caja 1 — Tarea
Responde tres preguntas:
- **Qué**: el resultado, en una o dos frases.
- **Para quién**: quién usará el entregable y qué espera de él. Cambia el
  tono, la profundidad y lo que se considera terminado.
- **Piezas**: la lista de lo que se entrega (código, pruebas, documento,
  runbook…). Cada pieza se revisa por separado en el bucle, así que una
  lista clara hace el bucle manejable.

Falla típica: describir la actividad ("trabajar en el ingestor") en vez
del resultado ("el ingestor descarga los tours programados cada 15
minutos y publica un evento por cambio").

## Caja 2 — Método
- Cómo se trabaja: bucle constructor–crítico, máximo de rondas.
- De dónde sale el listón: un estándar del equipo, si existe, o la caja 3.
- Qué se hace con lo no resuelto: se registra y se informa, no se inventa.

En la mayoría de los encargos esta caja es casi igual; solo cambia si la
tarea pide algo distinto, como una pausa para revisión a mitad de camino.

## Caja 3 — Listón de calidad
Criterios opinables pero verificables que el crítico puntúa de 1 a 5.
Ver references/liston-de-calidad.md.

## Caja 4 — Restricciones
Condiciones binarias: se cumplen o no, sin matices. Una restricción
fallida bloquea la entrega aunque el resto sea excelente. Ejemplos: "sin
credenciales en el código", "las pruebas pasan", "procesa el 100 % de
los documentos de entrada".

Si dudas entre caja 3 y caja 4: si admite grados, va en la 3; si es sí o
no, va en la 4.

## Supuestos y preguntas
Pregunta solo lo que cambiaría el entregable y no puedes deducir del
contexto, el código o los documentos disponibles: hasta 5 preguntas, en
una sola ronda. Preguntar por todo frena el trabajo y no preguntar nada
lleva a inventar requisitos.

No esperes las respuestas para escribir el encargo. Escríbelo completo
con el valor más razonable en cada hueco, marcado `[supuesto]`, y pon las
preguntas debajo, cada una remitiendo a su supuesto. Así el usuario ve el
resultado y corrige solo lo que no le sirve. Lo que no amerita pregunta
decídelo con criterio y anótalo en "Decisiones tomadas sin consultar".

Buenas preguntas cambian el diseño: "¿un tour que desaparece de Bókun se
borra o se marca como cancelado?". Malas preguntas tienen una respuesta
razonable por defecto: "¿quieres que el código tenga comentarios?".

## Respetar la intención
No agregues alcance que el usuario no pidió. Si ves una mejora que
consideras importante, propónla aparte como sugerencia, fuera de las
cajas, para que el usuario decida.

## Ejemplo breve

Pedido original: "agrega al ingestor de Bókun un proceso que descargue
los tours programados".

```
Tarea: job en el ingestor de Bókun que descarga cada 15 minutos los tours
programados de los próximos 60 días y publica un evento por alta, cambio
o cancelación. Para: el servicio de agenda, que consume esos eventos.
Piezas: job, cliente Bókun, mapeo a evento, pruebas, runbook.

Método: bucle constructor–crítico, máximo 3 rondas por pieza; listón del
estándar del equipo.

Listón: idempotente ante descargas repetidas; un tour que desaparece se
publica como cancelado; reintentos con backoff y alerta al agotarlos.

Restricciones: sin credenciales en el código; pruebas de integración con
Bókun simulado pasan.
```
