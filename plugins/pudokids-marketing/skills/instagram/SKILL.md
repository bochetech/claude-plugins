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
| Historia animada de la familia Pudux | Reel ilustrado | Fichas de personaje y bloques de `references/reel-ilustrado.md` |

Detalles de cada tipo de lámina y cómo armar el carrusel: `references/carrusel.md` (y la guía
completa con medidas exactas en `GUIA-CARRUSELES.md`, en la raíz del repo de piezas).
Reels de la app (grabar, guion, render): `references/reel.md`. Reels ilustrados (personajes, estilo,
prompts y voces): `references/reel-ilustrado.md`. Voz y reglas de contenido: `references/voz.md`.

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
   Entrega las rutas de los PNG o del MP4 y una propuesta de texto para el post (ver «El texto del
   post» en `references/voz.md`): **sin URL** y terminado en «Enlace en la biografía».
9. **Registra en Drive** (carpeta PudoKids › Redes Sociales). Lee antes «00 Índice — Redes Sociales
   Pudokids»: sus decisiones mandan.
   - Cada pieza tiene **una carpeta** en 02 Producción de contenido › En edición, con sus archivos y su
     ficha de publicación (texto del post, texto alternativo, enlace y estado). Lo publicado se mueve
     (no se copia) a 03 Publicado › AAAA-MM con el ID del Registro delante («IG-011 …»), y ese mismo
     día se agrega su fila en el «Registro de publicaciones — Instagram». El documento «Piezas de
     Instagram — textos y archivos» está archivado: no se usa.
   - Sube las imágenes o el video con rclone (remoto `gdrive`) a la carpeta de la pieza. Si está en
     otra carpeta, muévela; no la dupliques.
     ```bash
     cd ~/Developer/pudokids-marketing/instagram
     rclone copy <pieza>/laminas "gdrive:<pieza>" --drive-root-folder-id 18T4o7lzVAl1TrJcDylJ9zjXskQXsPnSW   # En edición
     rclone lsf -R "gdrive:<pieza>" --drive-root-folder-id 18T4o7lzVAl1TrJcDylJ9zjXskQXsPnSW                  # verificar
     ```
     En un reel, sube `salida/` en vez de `laminas/`. Para lo publicado, busca el id de la carpeta del mes
     (`AAAA-MM`) dentro de 03 Publicado (id `1EukjstOm3H2yWJSB0760fa4NIFkQrmGj`) con
     `rclone lsf --dirs-only gdrive: --drive-root-folder-id 1EukjstOm3H2yWJSB0760fa4NIFkQrmGj`, o créala
     con `rclone mkdir`.
   - Si rclone falla porque falta el remoto o el token venció, pídele al dueño que corra
     `rclone config reconnect gdrive:` (o `rclone config create gdrive drive scope=drive` si nunca lo
     configuró) y reintenta. Nunca muestres ni copies el contenido de `rclone.conf`: tiene el token.

## Listón de calidad

Una pieza que no cumple **todos** los puntos no se entrega. Primero te revisas con esta lista; después
la pieza pasa por el agente `revisor` y se corrige todo lo que marque. Lo que no se pudo cumplir se dice
claramente.

**Consistencia con lo publicado**
- Carruseles, láminas e historias salen de las plantillas y fuentes del repo. No se inventa otro diseño,
  tipografía, paleta, logo ni márgenes. Reel de PudoPlay: el proyecto `reel-minijuegos`, con su
  estructura, ritmo, tipografía y cierre.
- Reels ilustrados: personajes idénticos a sus fichas y al estilo de `references/reel-ilustrado.md`,
  sin mezclar estilos ni ilustraciones fuera del set.
- Antes de producir, compara lado a lado con al menos una pieza anterior del mismo tipo.

**Técnica**
- Medidas exactas: feed 1080×1350; reel e historia 1080×1920. Reels de ~15 s, 30 fps o más, H.264.
- Nada deformado, pixelado ni estirado. Al recortar de 16:9 a 9:16, el personaje queda completo y centrado.
- Zona segura de reels e historias: nada importante en los 250 px de arriba, en los 340 px de abajo ni
  pegado a la derecha, donde van los botones. En el reel de PudoPlay, el texto va en el tercio superior.
- Texto legible en el celular: buen contraste, mínimo ~48 px en reels e historias, y cada texto en
  pantalla el tiempo suficiente para leerlo dos veces.
- Se revisa cada lámina y al menos 5 fotogramas de cada video (inicio, gancho, medio, cierre y final).
- Se regenera igual: nada al azar ni posiciones calculadas por sorteo.

**Láminas**
- Se lee en el celular sin ampliar: títulos de 2 a 8 palabras y nada de párrafos.
- Ningún texto se corta, se sale de la lámina ni queda tapado por el celular o la mascota.
- Un solo resaltado amarillo por lámina, en las palabras que importan. Nada amarillo sobre fondo claro.
- La portada engancha con un problema real de los papás. La lámina de cierre lleva a pudokids.com.
- Las capturas muestran datos ficticios creíbles (nombres, tareas y premios en español de Chile), sin
  avisos de desarrollo ni datos a medio cargar, y con el botón principal visible.

**Contenido**
- Gancho en los primeros 2 segundos y una sola idea por pieza.
- Las reglas de voz, ética y el texto del post están en `references/voz.md`.

## Restricciones

- Colores, fuentes y mascota son los de la plantilla (copiados de la app). No los cambies por pieza.
- No inventes funciones de la app: si la pieza muestra algo, debe existir en la app. Ante la duda, revisa
  `kids-challenge/messages/es/parent.json` → `help`.
- No subas piezas a `kids-challenge`.
