# Reels

Formato: 1080×1920, 30 fps, H.264, 15 s, sin música. Se hacen con Remotion a partir de grabaciones
reales de la app. La guía completa está en `instagram/reel-minijuegos/README.md`; léela entera
antes de grabar.

## Partes

- `grabar/`: Playwright. `familia.mjs` crea la familia ficticia (Paula y su hijo Tomás, 13 años);
  `grabar.mjs` juega cada juego con ritmo de persona (`humano.mjs` dibuja el círculo de cada toque) y
  deja `public/grabaciones/<juego>.mp4` y `<juego>.json`, con los segundos de cada momento clave.
- `src/guion.ts`: el guion. Cada toma indica la grabación, el segundo de inicio (`desde`), la
  duración (`dura`), el texto, el estilo (`frase` o `materia`), el acercamiento (`zoom`, `foco`) y si
  lleva estrellas (`celebrar`).
- `src/marca.ts`: colores, fuentes y zonas seguras de Instagram. No se toca por reel.

## Estructura que funcionó (15 s)

| Tramo | Qué se ve | Texto |
|---|---|---|
| 0–4 s | El momento más vistoso, sin cortes | Gancho en dos frases («Mi hijo de 13 prefiere videojuegos…» → «…así que hicimos «videojuegos» 🎮») |
| 4–12 s | Cortes rápidos, dos por juego (~1,3 s cada uno) | Una materia por juego en pastilla amarilla |
| 12–15 s | Pantalla de puntos ganados, con estrellas | «Juegan, aprenden y suman «puntos» ⭐» |

## Pasos para un reel nuevo

1. Copia `reel-minijuegos` a `instagram/<reel>/` y corre `npm install` dentro.
2. Si hacen falta otras grabaciones, cambia `grabar/comun.mjs` (el niño y los juegos) y las partidas
   de `grabar/grabar.mjs`. Los juegos deben estar publicados en la base de pruebas (ver el README).
3. Graba con una familia nueva para cada grabación: un juego ya jugado retoma su nivel.
4. Elige los segundos con el `.json` de cada grabación y escribe `src/guion.ts`. Cambia el nombre de
   salida en `package.json` (`render`).
5. Revisa con `npm run estudio` (o un cuadro con `npm run cuadro`) y renderiza con `npm run render`.

## Cuidado al grabar

- No uses el video de Playwright: sale borroso. `grabador.mjs` toma los cuadros del screencast de
  Chrome a 3x y ffmpeg los arma a 30 fps.
- Chrome necesita la GPU real (`--use-angle=metal`); sin ella, el 3D se graba entrecortado.
- `porSegundo` en el `.json` debería estar entre 30 y 60 durante las animaciones. Si está bajo, cierra
  otras apps y vuelve a grabar.
