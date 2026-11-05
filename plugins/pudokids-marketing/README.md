# Plugin `pudokids-marketing`

Hace piezas de Instagram de Pudokids con la marca de la app: carruseles, imágenes sueltas y reels. Parte de las plantillas que ya dieron buenos resultados y las deja guardadas, con su código, en el repo privado `bochetech/pudokids-marketing`.

Forma parte del marketplace personal [`boche`](../../README.md). Instalación:

```
/plugin marketplace add bochetech/claude-plugins
/plugin install pudokids-marketing@boche
```

| Comando | Qué hace | Modifica algo |
|---|---|---|
| `/pudokids-marketing:instagram [idea o tema]` | Propone el texto de la pieza, la arma con la plantilla y exporta las imágenes o el video | Sí, una carpeta nueva en `pudokids-marketing/instagram/` |

## Qué necesita

- El repo `bochetech/pudokids-marketing` en `~/Developer/pudokids-marketing`. El skill lo clona si falta.
- `rclone` con un remoto `gdrive` hacia el Google Drive del dueño, para subir las piezas.
- Node y Playwright. Para las capturas y los reels, además, la app `kids-challenge` corriendo en local con la base de pruebas.
