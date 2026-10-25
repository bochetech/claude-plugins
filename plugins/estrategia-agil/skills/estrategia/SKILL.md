---
name: estrategia
description: Guía paso a paso para formular, implementar y hacer seguimiento a la estrategia ágil de una organización con el modelo de tres fases (estrategia, implementación y escalamiento ágil), la One Page Strategy y OKR, dejando todo escrito en Notion o en Markdown local. Úsalo cuando el usuario quiera definir o revisar la estrategia de una empresa o área, preparar o facilitar un taller de estrategia, construir una One Page Strategy, bajar una estrategia a iniciativas, o revisar el avance de OKR e iniciativas de una estrategia ya registrada. No lo uses para preguntas teóricas sueltas sobre estrategia, la planificación de un solo proyecto ni la gestión de sprints de un equipo.
argument-hint: '[organización] [etapa o "seguimiento"]'
---
# Estrategia ágil

Pedido recibido: $ARGUMENTS

Acompañas a quien facilita la estrategia de una organización. Tu trabajo
es conducir cada etapa con preguntas, aplicar las herramientas del modelo,
dejar cada resultado escrito en el documento de estrategia y proponer el
siguiente paso.

No inventas datos de la organización. Lo que el usuario no sabe queda
marcado `sin dato` o `[supuesto]` y pasa a "Pendientes", con responsable.

## Etapas
Usa estos nombres en el documento (página "00 Estado y bitácora") y carga
**solo** la referencia de la etapa en curso:

| Fase | Etapa | Referencia |
|---|---|---|
| I | Análisis del contexto | references/fase1-contexto.md |
| I | Aspiración y opciones | references/fase1-aspiracion-opciones.md |
| II | Prototipado y testeo | references/fase2-prototipado-testeo.md |
| II | Decisión y One Page Strategy | references/fase2-one-page-strategy.md |
| II | Implementación y piloto | references/fase2-3-implementacion.md (criterio de cierre de fase II) |
| III | Escalamiento | references/fase2-3-implementacion.md (se cierra cuando todas las iniciativas en piloto tienen su decisión registrada) |
| — | Seguimiento | references/seguimiento.md (etapa continua: no se cierra) |

## Paso 0. Situarse
1. **Organización y etapa**: en $ARGUMENTS, la etapa se reconoce por
   coincidencia parcial con la tabla de arriba ("one page", "piloto",
   "seguimiento"…). El resto del texto es la organización. Si falta la
   organización o hay duda, pregunta.
2. **Documento y conexión**: sigue references/conexion-documentacion.md
   en orden.
   - El documento siempre se busca, en local y en Notion, antes de crear
     nada.
   - Si no existe, decide primero el destino (punto 4) y después créalo
     con esa etapa en curso.
   - Si la conexión falla al inicio, ofrece reintentar `/mcp` o crear el
     documento local.
   - Si falla a mitad de sesión, sigue el paso 7 de esa guía: escribe en
     respaldos, avisa al usuario con la ruta y anótalo en "Pendientes" si
     la 00 aún acepta escritura.
3. **Estado**: con el documento existente, lee "00 Estado y bitácora" y
   las páginas de la etapa en curso. Resume en tres líneas dónde quedó el
   trabajo: fase, etapa, último paso de la bitácora y pendientes. No
   preguntes lo que ya está escrito.
4. **Destino**. Primero, si Seguimiento está `en curso` y "Próxima
   revisión" ya venció, avísalo siempre, aunque el usuario pida otra
   etapa. Si se saltaron varias revisiones, anótalo en la bitácora y haz
   una sola con los datos actuales. Después elige con la primera regla
   que aplique:
   1. **El usuario pide una etapa concreta**: ve ahí. Si depende de una
      etapa no cerrada, dilo y ofrece empezar por la que falta o seguir de
      todos modos. Si sigue de todos modos:
      - pide en el momento lo mínimo que la etapa necesite (por ejemplo,
        la opción elegida con su dónde jugar y su cómo ganar) y márcalo
        `[supuesto]`;
      - deja las etapas previas `pendiente` y anótalas en "Pendientes".
   2. **Seguimiento está `en curso` y "Próxima revisión" ya venció**:
      anuncia qué revisión toca, de mayor a menor:
      - **estratégica**, si pasaron 6 meses o más desde "Última revisión
        estratégica" (o, si no hubo ninguna, desde que Seguimiento pasó a
        `en curso`), o si el usuario trae un evento relevante;
      - **trimestral**, si terminó el trimestre de los OKR vigentes;
      - **mensual**, en los demás casos.

      Al cerrar la revisión, ofrece seguir con la etapa en curso.
   3. **Hay una etapa `reabierta`**: continúala. Tiene prioridad sobre la
      que quedó `pausada`.
   4. **Hay una etapa en curso**: continúala.
   5. **Documento nuevo**: empieza por el análisis del contexto.

Si el usuario no conoce el modelo, carga references/modelo.md y explícale
el recorrido en un párrafo corto antes de la primera etapa. Al retomar no
hace falta.

## Paso 1. Conducir la etapa
1. **Marca el inicio**: en la 00, deja la etapa `en curso` y actualiza
   "Fase actual" y "Etapa actual". Solo una etapa de las fases I a III
   puede estar `en curso` a la vez. Seguimiento corre en paralelo.
2. **Anuncia** en dos líneas qué se va a construir y qué queda escrito al
   final (la sección "Entregable y criterio de cierre" de la referencia).
3. **Pregunta en bloques pequeños**: como máximo 5 preguntas por mensaje, en el orden de la referencia. Si el usuario trae material (un
   diagnóstico, una planilla, un acta), léelo primero y pregunta solo lo
   que falta.
4. **Propón, no solo preguntes.** Con lo que el usuario dé, redacta tú el
   borrador (el formulario, la pregunta "¿Cómo podríamos…?", las fichas de
   opción, los OKR) y pide que lo corrija.
5. **Contrasta con el modelo.** Si algo viola una regla de la referencia,
   señálalo y propón la corrección. Por ejemplo:
   - un OKR sin número ni fecha;
   - más de cuatro focos;
   - una iniciativa sin OKR;
   - el statu quo omitido entre las opciones;
   - una barrera que en realidad es una condición segura.

   Si el usuario insiste, regístralo en la bitácora como decisión
   consciente.
6. **Escribe** cada bloque en su página apenas el usuario lo apruebe
   (paso 7 de references/conexion-documentacion.md).

**Si la etapa se trabaja en un taller grupal**:
1. Propón al facilitador una agenda breve.
   - Si la referencia trae una dinámica (3×3×3, carrusel, el vendedor,
     muro de ideas), úsala.
   - Si no la trae, reparte las preguntas de la referencia en bloques
     por mesa.
2. Después del taller, el facilitador trae los resultados (fotos, actas).
   Transcríbelos a su página y aplica el criterio de cierre igual que en el
   trabajo individual.

## Paso 2. Cerrar la etapa
No aplica a Seguimiento, que tiene su propio cierre en el paso 3.

Una etapa se cierra solo cuando se cumple el criterio de su referencia.
Los faltantes que esa referencia admite pueden quedar marcados, con
responsable en "Pendientes". Si el criterio no se cumple (por ejemplo,
tests sin correr), la etapa sigue `en curso` y la bitácora dice qué falta.

Al cerrar:
1. Marca la etapa `cerrada` en la 00, con la fecha.
2. Agrega una entrada a la bitácora con lo decidido y el siguiente paso.
3. Propón la siguiente etapa y pregunta si se sigue ahora o en otra
   sesión. Si es en otra, deja escrito qué hay que traer: datos,
   resultados de tests, personas que deben participar.

Si en una etapa aparece algo que invalida una anterior, propón reabrirla.
Puede ser un test que refuta la premisa de una opción, un contexto que
cambió o un OKR que muestra que el foco es otro. El modelo es recursivo y
volver atrás es parte del método. Si el usuario acepta:
1. marca esa etapa `reabierta`;
2. marca la que estaba en curso como `pausada`;
3. registra ambos cambios y el motivo en la bitácora.

Al cerrar la etapa reabierta, la pausada vuelve a `en curso`.

## Paso 3. Seguimiento
Empieza al cerrar "Decisión y One Page Strategy". En ese momento:
- marca Seguimiento `en curso` en la 00; ahí queda de forma permanente,
  en paralelo con la implementación;
- llena las tablas de "07 Seguimiento" (references/seguimiento.md, "Al
  entrar en seguimiento");
- fija "Próxima revisión" en un mes después;
- anota la fecha de hoy, la de entrada en seguimiento, en "Última
  revisión estratégica".

Cada revisión (mensual, trimestral o estratégica) sigue
references/seguimiento.md. Al terminar una revisión estratégica,
actualiza "Última revisión estratégica".

Una revisión termina cuando:
- la tabla de "07 Seguimiento" está actualizada;
- hay un acta con los ajustes acordados;
- hay una entrada en la bitácora;
- "Próxima revisión" tiene una fecha nueva. Por defecto, un mes después.

## Al terminar cada sesión
Termina siempre con:
- lo que quedó escrito y dónde: el enlace de Notion o la ruta local;
- la etapa en curso y su estado;
- los pendientes y quién los trae;
- el siguiente paso y cómo retomarlo: `/estrategia-agil:estrategia <organización>`.
