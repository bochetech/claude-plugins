# Voz y reglas de contenido

## A quién le habla

A papás y mamás sin tiempo, en Chile. Tutea («tu hijo», «tú eliges»). Usa español de Chile cotidiano:
«pieza», «colación», «mochila».

- Frases cortas, de una idea. Nada técnico ni de la app por dentro («base de datos», «configurar el módulo»).
- La portada nombra un problema real de la casa («ordena tu pieza» 20 veces, mañanas con gritos,
  pantallas como premio) o promete algo concreto («5 pasos», «según su edad»).
- El cierre invita sin presionar: «Gratis en pudokids.com», «Arma su plan semanal».
- Eslogan: «Si un pudú puede, tú también puedes.» Mascota: Pudux (no «Pudo»).
- Español de Chile con ortografía impecable: tildes, signos de apertura y comillas «».
- Cada afirmación (gratis, sin publicidad, privacidad, el niño no ve precios) necesita respaldo en
  `contexto/` del repo de agentes o en la ayuda de la app. Si no lo tiene, no va.

## Lo que la marca defiende

Viene de la base teórica de la app (crianza positiva, economía de fichas, autodeterminación):

- Solo refuerzo positivo: celebrar y sumar, nunca castigos ni quitar puntos.
- Tareas posibles para la edad y concretas: que se vea cómo queda la tarea terminada.
- Nada de comparar ni hacer competir a los hermanos.
- Premios: mejor experiencias y privilegios (elegir la cena, una salida a solas con mamá o papá) que
  cosas, dulces o pantallas.
- Seguridad: nada de cuchillos, fuego ni productos químicos para menores de 11.
- Los juegos de PudoPlay complementan las tareas de casa; no las reemplazan.

Las reglas éticas mandan desde `contexto/marca.md` del repo de agentes (`bochetech/pudokids-agentes`);
esta lista las resume para producir y no las redefine.

## El texto del post

- **Nunca lleva URL**: en Instagram los enlaces del texto no se pueden pulsar. Termina con
  «Enlace en la biografía». Las reglas del día de publicar están en
  `docs/lanzamiento/contenido/COMO-PUBLICAR.md` del repo de agentes.
- Primera línea con gancho, un beneficio concreto para el papá o la mamá, el llamado a la acción y
  3 a 6 hashtags pertinentes. De 2 a 4 líneas.
- Cada pieza lleva además su texto alternativo.

## Decisiones vigentes de la cuenta

- Una sola cuenta, @pudokids. TikTok y YouTube Shorts están postergados (Rutina de contenido, nov 2026).
- Nunca se muestran caras, nombres ni colegio de niños reales.
- La app solo se muestra con capturas o grabaciones reales, nunca generada con IA.
- Emojis: uno por párrafo como máximo, solo del set fijo de la marca que define el índice (uno para
  tareas 🎯, premios, puntos ⭐, familia, link en bio y pregunta). Léelo en el índice antes de usarlos.

## Datos

- Siempre familias, niños y correos ficticios (`@ejemplo.local`), creados por los scripts en la base de pruebas.
- No afirmes funciones, precios ni cifras que la app no tiene. Ante la duda, revisa la ayuda
  (`kids-challenge/messages/es/parent.json` → `help`).
