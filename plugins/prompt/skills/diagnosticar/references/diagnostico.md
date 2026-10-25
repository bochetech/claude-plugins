# Diagnóstico de un fallo de skill

Antes de corregir, nombra la causa. Corregir sin diagnóstico suele
agregar una regla más que no ataca el problema.

## 1. Activación
¿Se usó el skill que correspondía, cuando correspondía?

Síntomas:
- El skill no se cargó y Claude respondió con su criterio general.
- Se cargó el skill, pero no el archivo de referencia que tenía la regla.
- Se cargó un skill en una tarea donde no correspondía.

Cómo verificarlo: revisa qué skills y archivos se leyeron en la sesión
del fallo. Si el usuario no tiene ese registro, repite la petición y
observa.

Corrección típica:
- No se activó: la description no menciona el contexto en que falló;
  agrégalo con las palabras que usó el usuario.
- Se activó de más: la description no dice cuándo no usarlo; agrega la
  exclusión concreta.
- Archivo equivocado: el router del skill no conecta esa tarea con ese
  archivo; corrige el router.

## 2. Consistencia
¿El skill produce lo mismo ante lo mismo?

Síntomas: resultados distintos en ejecuciones parecidas, o una regla que
se aplica a veces sí y a veces no.

Causas habituales:
- La regla es ambigua o no define su alcance (en qué carpetas, en qué
  casos).
- La regla dice qué hacer pero no qué es un defecto, así que el revisor
  decide cada vez.
- Dos reglas se contradicen o se solapan.
- Falta la regla: Claude improvisa una solución razonable, pero distinta
  cada vez.

Corrección típica: precisar el alcance, agregar un ejemplo correcto y uno
incorrecto, o resolver la contradicción eliminando la regla que sobra.
Si existe una ejecución que salió bien, extrae de ella el criterio que se
aplicó y fíjalo como regla.

## 3. Extralimitación
¿El skill hizo más de lo que se le pidió?

Síntomas: cambió texto o código que no debía, agregó piezas o alcance no
pedido, o aplicó su criterio donde había una instrucción.

Corrección típica: declarar el alcance de la tarea con su razón ("este
skill revisa, no corrige: el autor decide qué cambiar") y ofrecer una
salida para lo que considere importante, como proponerlo aparte.

## 4. No es un defecto del skill
- **Preferencia puntual**: lo pedido aplica solo a una tarea. Se corrige
  en el chat.
- **La regla está bien, pero el equipo cambió de criterio**: es un cambio
  del estándar, no un error. Requiere decisión del equipo (por ejemplo,
  un ADR) antes de tocar el skill.
- **No se reproduce**: si al repetir la petición el skill funciona, anota
  el caso y observa. Corrige si vuelve a ocurrir.
