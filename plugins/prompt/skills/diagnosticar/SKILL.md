---
name: diagnosticar
description: Diagnostica por qué un skill falló de forma repetida (activación, consistencia o extralimitación), corrige solo la sección afectada en el repositorio del marketplace, agrega una eval que reproduce el fallo y prepara el cambio para un MR. Se usa cuando el usuario lo invoca tras un fallo recurrente de un skill.
argument-hint: <skill que falló> <qué pasó y dónde>
disable-model-invocation: true
---
# Diagnosticar y corregir un skill

Fallo reportado: $ARGUMENTS

## Antes de corregir
1. **Dónde se edita.** Verifica que los archivos del skill están en un
   clon del repositorio del marketplace (tiene .git y
   .claude-plugin/marketplace.json), no en la caché de plugins de Claude
   Code. Si no tienes acceso a un clon, detente y pide abrir la sesión
   con `claude --add-dir <ruta-del-clon>`, porque una corrección en la
   caché no le llega al equipo y se pierde en la próxima actualización.
2. **Rama.** Verifica que el clon está en una rama distinta de main; si
   no, propón crear una (por ejemplo, fix/<plugin>-<tema>).
3. **¿Corresponde corregir el skill?** Si es la primera vez que ocurre,
   o el pedido responde a una preferencia de una sola tarea, dilo y
   sugiere corregir en el chat: el skill se toca ante fallos recurrentes
   o estructurales. Si el usuario confirma que es recurrente, sigue.

## Pasos
1. **Evidencia.** Reúne lo que falló: la petición, el resultado obtenido
   y el esperado. Si falta, pídelo; sin evidencia concreta el diagnóstico
   es una suposición.
2. **Diagnóstico.** Aplica references/diagnostico.md y nombra la causa
   con la evidencia que la respalda.
3. **Corrección.** Aplica references/reescritura-modular.md: reescribe
   solo la sección afectada.
4. **Eval.** Agrega una eval de regresión según
   references/eval-de-regresion.md. Debe traer su propia entrada (el
   archivo o dato que provoca el fallo), porque cada corrida parte de una
   carpeta vacía: una eval sin entrada no reproduce nada.
5. **Versión.** Sube la versión de parche del plugin.json del plugin
   afectado y registra el cambio en CHANGELOG.md.
6. **Otros defectos.** Si al revisar la evidencia ves otro problema (en
   el código del usuario o en otra regla del skill), no lo corrijas en
   este cambio: anótalo en la entrega para que el usuario decida. Un MR
   con un solo arreglo se revisa y se revierte con facilidad.

## Entrega
Usa siempre esta estructura:

```
Causa: <activación | consistencia | extralimitación | no es defecto del skill> — <evidencia>
Cambio: <archivo y sección> — <qué se sustituyó y por qué>
Eval agregada: <ruta> — <qué entrada crea y qué exige>
Versión: <anterior> → <nueva>
Otros defectos vistos: <cada uno en una línea, o "ninguno">

Para probar antes del MR:
claude plugin eval <ruta-del-plugin> --case <caso> --scaffold --runs 1
/plugin marketplace add <ruta-del-clon>
<la petición que falló, para repetirla>

Descripción del MR:
<causa, cambio y eval en 3 a 5 líneas>
```

No hagas commit ni push: el usuario prueba y abre el MR.
