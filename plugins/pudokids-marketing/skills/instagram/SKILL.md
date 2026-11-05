---
name: instagram
description: Crea piezas de Instagram de Pudokids (carruseles, imágenes sueltas con una frase y reels de 15 s con juegos de PudoPlay o pantallas de la app) con las plantillas de marca del repo pudokids-marketing, y exporta los PNG de 1080×1350 o el MP4 de 1080×1920 listos para publicar. Úsalo siempre que el dueño de Pudokids pida un post, carrusel, lámina, imagen, frase, reel o video para Instagram o redes, quiera repetir o adaptar una pieza que ya existe (Qué es Pudokids, Tareas según la edad, Premios sin pantallas, Rutina de mañana, Frase hábitos, Reel minijuegos) o pida ideas de contenido para la cuenta, aunque no diga «skill» ni «plantilla». No lo uses para textos de la app ni para la tienda Shopify.
argument-hint: '[idea, tema o pieza a repetir]'
---
# Piezas de Instagram de Pudokids

Pedido: $ARGUMENTS

Haces piezas de Instagram de Pudokids que se ven como la app. No diseñas desde cero: copias una
plantilla que ya funcionó, cambias el contenido y exportas. Así cada pieza sale con la misma marca
y se puede regenerar igual.

## Dónde vive todo

- Repo de piezas: `~/Developer/pudokids-marketing` (privado, `bochetech/pudokids-marketing`).
  Si no está, clónalo con `gh repo clone bochetech/pudokids-marketing ~/Developer/pudokids-marketing`
  y corre `npm install` en la raíz. Lee su `README.md` antes de empezar.
- Cada pieza es una carpeta `instagram/<pieza>/` con su código y su resultado (`laminas/` o `salida/`).
- La app (`~/Developer/kids-challenge`) solo se usa para capturas y grabaciones, nunca para guardar piezas.

## Elige el formato

| Pedido | Formato | Parte de |
|---|---|---|
| Consejos, pasos, listas, ideas de premios | Carrusel de 5 a 7 láminas | `_plantilla-carrusel` |
| Mostrar cómo se usa la app | Carrusel con capturas | `que-es-pudokids` (trae `capturar.mjs`) |
| Una frase para guardar o compartir | Imagen suelta (`frase`) | `frase-habitos` |
| Video con juegos o la app en movimiento | Reel de 15 s | `reel-minijuegos` |

Detalles de cada tipo de lámina y cómo armar el carrusel: `references/carrusel.md`.
Reels (grabar, guion, render): `references/reel.md`. Voz y reglas de contenido: `references/voz.md`.

## Pasos

1. **Propón el texto antes de armar nada.** Muestra al dueño, lámina por lámina, el tipo y el texto
   (o el guion toma por toma, si es reel), y espera su visto bueno. Las mejoras se conversan una por una.
2. **Copia la plantilla** a `instagram/<pieza>/`, con un nombre corto en minúsculas y con guiones. Para
   repetir una pieza, copia esa pieza; para una nueva, `_plantilla-carrusel`.
3. **Escribe `contenido.js`** (o `src/guion.ts` en un reel). En lo posible, no toques `plantilla.html`.
   Si una pieza necesita un tipo de lámina nuevo, agrégalo en la plantilla de la pieza y, si sirve para
   otras, también en `_plantilla-carrusel`, con su línea en el comentario de tipos.
4. **Íconos**: `node instagram/generar-iconos.mjs instagram/<pieza> <icono> …` con la lista completa.
   Usa los nombres de lucide.dev; para tareas y premios, prefiere los del catálogo de la app
   (`kids-challenge/prisma/seed-data/`).
5. **Capturas o grabaciones**, si las lleva: siempre con la app local, la base de pruebas y una familia
   ficticia creada por el script. Nunca uses datos de familias reales ni la app de producción.
6. **Exporta**: `node instagram/<pieza>/exportar.mjs` (PNG en `laminas/`) o `npm run render` (reel).
7. **Revisa cada imagen** con Read antes de entregarla, contra el listón de abajo. Si algo falla,
   corrige y vuelve a exportar.
8. **Guarda**: commit en `pudokids-marketing` con la carpeta de la pieza (rutas explícitas) y push.
   Entrega las rutas de los PNG o del MP4 y una propuesta de texto para el post (2 a 4 líneas, cierra
   con pudokids.com).
9. **Registra en Drive** (carpeta PudoKids › Redes Sociales): agrega la pieza, con sus textos lámina por
   lámina, su estado y el enlace a su carpeta en GitHub, al documento «Piezas de Instagram — textos y
   archivos» (02 Producción de contenido › Guiones y briefs). Lee antes «00 Índice — Redes Sociales
   Pudokids»: sus decisiones mandan. Las imágenes y videos no se pueden subir con el conector; abre la
   carpeta en Finder (`open`) para que el dueño las arrastre (en edición: 02 › En edición; publicadas:
   03 Publicado › AAAA-MM).

## Listón de calidad

- Se lee en el celular sin ampliar: títulos de 2 a 8 palabras y nada de párrafos.
- Ningún texto se corta, se sale de la lámina ni queda tapado por el celular o la mascota.
- Un solo resaltado amarillo por lámina, en las palabras que importan.
- La portada engancha con un problema real de los papás. El cierre lleva a pudokids.com.
- Las capturas muestran datos ficticios creíbles (nombres, tareas y premios en español de Chile), sin
  avisos de desarrollo ni datos a medio cargar.
- En el reel, el texto va en el tercio superior y no hay nada en los 250 px de abajo.
- Se regenera igual: nada al azar ni posiciones calculadas por sorteo.

## Restricciones

- Colores, fuentes y mascota son los de la plantilla (copiados de la app). No los cambies por pieza.
- No inventes funciones de la app: si la pieza muestra algo, debe existir en la app. Ante la duda, revisa
  `kids-challenge/messages/es/parent.json` → `help`.
- No subas piezas a `kids-challenge`.
