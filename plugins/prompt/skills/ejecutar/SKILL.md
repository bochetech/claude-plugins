---
name: ejecutar
description: Ejecuta un encargo con el método de cuatro cajas (tarea, método, listón de calidad, restricciones) y un bucle constructor–crítico, en el que un crítico independiente revisa el trabajo contra el listón antes de entregarlo. Úsalo cuando el usuario pida construir o producir algo con un entregable concreto y varias piezas o una exigencia de calidad alta, como un servicio, una funcionalidad completa, una especificación, un documento formal, el procesamiento de un lote de documentos o un skill, aunque no mencione el método. Úsalo también siempre que otro skill te invoque para ejecutar con rigor. No lo uses para preguntas, explicaciones, conversación, lluvias de ideas ni cambios pequeños que se resuelven en una respuesta corta.
argument-hint: <encargo>
---
# Ejecutar con bucle constructor–crítico

Encargo recibido: $ARGUMENTS

Si el encargo llegó vacío, usa el encargo aprobado más reciente de la
conversación (por ejemplo, uno preparado con /prompt:mejorar) y dilo en
una línea antes de empezar; si no hay ninguno, pregunta qué quiere
ejecutar.

## Antes de empezar: ¿vale la pena el bucle?
Si la tarea se resuelve bien en una sola pasada (un cambio acotado, sin
varias piezas ni exigencia especial), dilo en una línea y resuélvela
directo. El bucle multiplica el tiempo y el costo, y en tareas pequeñas no
mejora el resultado.

## Paso 1. El encargo en cuatro cajas
Usa el primer caso que aplique:

1. **Te invocó otro skill** con listón y restricciones: úsalos tal cual y
   pasa al paso 2. Ver "Cuando te invoca otro skill".
2. **El usuario ya aprobó un encargo en cuatro cajas** en esta
   conversación (por ejemplo, con /prompt:mejorar): úsalo y pasa al paso 2.
3. **En cualquier otro caso**, arma el encargo con
   references/cuatro-cajas.md y assets/plantilla-encargo.md, y escribe la
   caja 3 con references/liston-de-calidad.md. Muéstralo con sus
   `[supuesto]` y hasta 5 preguntas en el mismo mensaje, y espera
   aprobación antes de construir, porque corregir el encargo cuesta un
   mensaje y corregir lo construido cuesta el bucle completo.

## Paso 2. Bucle
Sigue references/bucle-adversarial.md. En resumen: divide el entregable
en piezas, construye cada una, haz que un subagente crítico sin contexto
de la construcción la revise con assets/plantilla-critico.md, corrige y
repite hasta aprobar o completar 3 rondas por pieza.

## Paso 3. Entrega
Usa siempre esta estructura:

```
Hecho: <piezas entregadas>
Rondas: <por pieza, por ejemplo "job: 2 de 3, pruebas: 1 de 3">
Decisiones tomadas sin consultar: <cada una con su razón en una frase>
Hallazgos descartados: <hallazgos del crítico que no se aplicaron y por qué>
Defectos abiertos: <lo que no pasó el listón tras 3 rondas, o "ninguno">
```

No hagas commit ni publiques nada salvo que el encargo lo pida
explícitamente: la entrega queda para revisión humana.

## Cuando te invoca otro skill
- El listón y las restricciones que recibes representan el estándar de un
  equipo: no los reemplaces ni los suavices.
- No pidas aprobación del encargo; quien te invocó ya lo definió.
- Si un criterio recibido no es verificable (no permite decir sí o no),
  aplícalo con tu mejor interpretación y señálalo en la entrega como
  criterio a precisar, en vez de reescribir el estándar por tu cuenta.

## Archivos
- references/cuatro-cajas.md: al armar o completar un encargo.
- references/liston-de-calidad.md: al escribir la caja 3.
- references/bucle-adversarial.md: al ejecutar el paso 2.
- assets/plantilla-encargo.md: estructura del encargo.
- assets/plantilla-critico.md: instrucciones que recibe el crítico.
