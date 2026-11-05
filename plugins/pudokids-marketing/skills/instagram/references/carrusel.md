# Carruseles e imágenes sueltas

Formato: láminas de 1080×1350 (4:5). `plantilla.html` dibuja todas las láminas de `contenido.js`. Si
la abres sin parámetros, muestra todas reducidas para revisarlas; con `?lamina=N`, solo esa, a tamaño
real. `exportar.mjs` toma una captura de pantalla de cada lámina con Playwright y la guarda como
`laminas/NN-<titulo>.png`, o como `<archivo>.png` si la lámina trae `archivo`.

## Tipos de lámina

| Tipo | Campos | Para qué |
|---|---|---|
| `portada` | `titulo`, `mascota: true` o `burbujas: [...]`, `pie` | Primera lámina, fondo morado. Con `burbujas`, frases sueltas de fondo (por ejemplo, lo que el papá repite) |
| `paso` | `numero`, `icono`, `categoria`, `titulo`, `texto` | Una rutina o un método en pasos numerados |
| `premio` | `icono`, `titulo`, `texto` | Una idea de premio por lámina (ícono grande en amarillo) |
| `lista` | `antetitulo`, `titulo`, `items` (4 filas: `texto`, `icono`, `categoria`) | Listas cortas, por ejemplo tareas por edad |
| `consejo` | `titulo`, `texto`, `icono` | Una idea en una frase grande, casi siempre antes del cierre |
| `frase` | `titulo`, `archivo` | Imagen suelta: fondo morado liso y mascota pequeña, sin cabecera |
| `captura` | `titulo`, `captura`, `paso`, `dispositivo` (`celular` o `tablet`) | Una pantalla real de la app dentro de un celular o una tablet |
| `cierre` | `titulo`, `bajada`, `url` | Última lámina: mascota, llamado y pudokids.com resaltado |

- Resaltado: `*así*` (sin mostrar los asteriscos) o `«así»` (se muestran las comillas).
- `categoria` da el color del ícono, igual que en la app: `home`, `self`, `kitchen`, `pets`,
  `organization`, `kindness`, `outdoor`, `learning` o `responsibility`.
- La cabecera (logo y contador `n/total`) se pone sola, salvo en `frase`.

## Estructura que funcionó

Portada (problema o promesa) → 3 a 5 láminas de contenido del mismo tipo → consejo (opcional) → cierre.

| Pieza | Portada | Contenido | Cierre |
|---|---|---|---|
| Qué es Pudokids | «¿Cansado de repetir «ordena tu pieza» 20 veces?», con burbujas | 4 capturas numeradas: plan del día, tarea marcada, aprobar, canjear | «Gratis en pudokids.com», con el eslogan |
| Tareas según la edad | «¿Qué tareas puede hacer tu hijo según su edad?», con mascota | 3 listas (5–6, 7–9, 10–13 años) y un consejo | «Arma su plan semanal» |
| Premios sin pantallas | «5 premios que *no son pantallas*» | 5 premios con su frase de apoyo | «Tú eliges los premios» |
| Rutina de mañana | «Rutina de mañana *sin gritos* en 5 pasos» | 5 pasos con número e ícono | «En Pudokids, cada paso suma puntos» |
| Frase hábitos | (imagen suelta) | «Los hábitos no se imponen, *se juegan.*» | — |

Cada pieza ya tiene su `contenido.js` en el repo: léelo como ejemplo antes de escribir uno nuevo.

## Capturas de la app

`que-es-pudokids/capturar.mjs` crea una familia ficticia en la app local (registro del papá, un hijo,
premios y una meta), marca tareas desde la tablet del hijo, las aprueba desde el celular del papá y
toma cada captura. Para otras pantallas, copia el script y cambia los pasos y los nombres.

```bash
cd ~/Developer/kids-challenge
docker compose up -d db mail
GA_MEASUREMENT_ID="" npx dotenv -e .env.test -- npx next dev -p 3300
node ../pudokids-marketing/instagram/<pieza>/capturar.mjs
```

- Celular: 390×844 a 3x. Tablet: 820×1180 a 2x. La captura no lleva barra de estado; la dibuja la lámina.
- El script oculta el indicador de Next y apaga las animaciones para que las capturas salgan limpias.
- La lámina muestra la parte de arriba de la pantalla (el aparato sale por abajo): lo importante tiene
  que estar arriba.
