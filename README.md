# Marketplace `boche` — plugins personales de Claude Code

## Instalación

```
/plugin marketplace add bochetech/claude-plugins
/plugin install prompt@boche
```

El repo es público y de solo lectura: cualquiera puede instalarlo, pero solo el dueño publica cambios. Las actualizaciones llegan con `/plugin marketplace update boche`.

## Plugins

| Plugin | Para qué | Comandos |
|---|---|---|
| [`prompt`](plugins/prompt/README.md) | Encargos rigurosos: cuatro cajas y bucle constructor–crítico | `/prompt:mejorar`, `/prompt:ejecutar`, `/prompt:diagnosticar` |

## Estructura

```
.claude-plugin/marketplace.json   catálogo: nombre, origen y descripción de cada plugin
plugins/<plugin>/
  .claude-plugin/plugin.json      nombre y versión (semver)
  skills/<skill>/SKILL.md         un skill por carpeta; se invoca como /<plugin>:<skill>
  evals/<caso>/                   casos de prueba (claude plugin eval)
  CHANGELOG.md
  README.md
scripts/check-version-bump.sh     usado por el CI
```

## Cambios

Por rama y PR. El workflow `validar` revisa los manifiestos y los skills, y falla si un plugin cambió sin subir su versión y registrarla en su `CHANGELOG.md`.

Probar en local:

```
/plugin marketplace add ~/Documents/bochetech/claude-plugins
/plugin install prompt@boche
```

Desde la terminal:

```
claude plugin validate .
claude plugin validate plugins/prompt
claude plugin eval plugins/prompt --scaffold --runs 1      # consume API
```
