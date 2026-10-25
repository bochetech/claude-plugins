---
name: mejorar
description: Reescribe un encargo o prompt del usuario en cuatro cajas (tarea, método, listón de calidad, restricciones), detecta lo que le falta y se lo muestra sin ejecutar nada. Se usa cuando el usuario lo invoca para revisar o preparar un pedido antes de lanzarlo.
argument-hint: <encargo o prompt a mejorar>
disable-model-invocation: true
---
# Mejorar un encargo

Encargo recibido: $ARGUMENTS

Si el encargo llegó vacío (pasa al elegir el comando en el menú, que lo
ejecuta sin texto), no respondas que no hay encargo: si en la conversación
hay un pedido reciente que encaje, propón mejorar ese y muéstralo en una
línea para que lo confirme; si no, pregunta cuál quiere mejorar. No
continúes con los pasos hasta tenerlo.

Este skill prepara el encargo; no lo ejecuta. El usuario quiere ver su
pedido completo antes de decidir si lo lanza, lo guarda o lo ajusta.

## Pasos
1. Lee los archivos del skill ejecutar de este mismo plugin:
   ../ejecutar/references/cuatro-cajas.md,
   ../ejecutar/references/liston-de-calidad.md y
   ../ejecutar/assets/plantilla-encargo.md.
2. Identifica lo que falta para que el encargo se pueda ejecutar sin
   improvisar.
3. Reescribe el encargo con la plantilla, completo, aunque falten datos.
   Donde una decisión cambiaría el entregable y no puedes deducirla del
   contexto, elige el valor más razonable y márcalo `[supuesto]` en el
   mismo texto. Un borrador con supuestos visibles le ahorra al usuario
   una vuelta: solo corrige lo que no le sirve, en vez de responder
   preguntas sin ver todavía el resultado.
4. Si el repositorio tiene un estándar del equipo, toma de ahí el listón
   y las restricciones y cita los archivos de origen.
5. Entrega usando la estructura de abajo y detente.

## Respetar la intención
Conserva lo que el usuario pidió. No agregues alcance: si ves algo
importante que no pidió, ponlo en "Sugerencias fuera de alcance" para que
decida. Un encargo mejorado es más preciso, no más grande.

La tentación habitual es convertir el pedido en un proyecto: variantes
A/B, plan de medición, grupos de control, checklists de QA, piezas extra.
Si el usuario pidió dos emails, las piezas son dos emails y su
configuración; lo demás va a sugerencias. Los requisitos legales o del
estándar del equipo que el entregable debe cumplir sí van en el listón o
en las restricciones, porque no son alcance nuevo sino condiciones para
que lo pedido sea aceptable.

## Entrega
Usa siempre esta estructura:

```
<el encargo en cuatro cajas, con los [supuesto] marcados en su lugar>

Qué cambió respecto del original
- <hueco detectado> → <cómo quedó resuelto>

Preguntas (solo las que cambian el entregable, hasta 5)
1. <pregunta> — supuesto actual: <lo que quedó en el encargo>

Sugerencias fuera de alcance
- <mejora no pedida> — <por qué podría valer la pena>
```

Omite "Preguntas" si no quedó ningún supuesto relevante y "Sugerencias"
si no hay. Cada pregunta remite a un `[supuesto]` del encargo, para que
responderla sea cambiar un valor y no reescribir.

Termina indicando que puede responder las preguntas o lanzarlo tal cual
con /prompt:ejecutar. No construyas nada, aunque el encargo parezca listo.
