#!/usr/bin/env bash
# Falla si un MR cambia archivos de un plugin sin subir la versión de su plugin.json.
# Uso: scripts/check-version-bump.sh <rama-destino>   (por defecto: origin/main)
set -euo pipefail

base="${1:-origin/main}"
plugins=$(python3 -c 'import json; [print(p["source"].removeprefix("./")) for p in json.load(open(".claude-plugin/marketplace.json"))["plugins"]]')

status=0
for dir in $plugins; do
  # Solo cuentan los cambios que llegan al plugin; evals/results y el CHANGELOG no exigen versión nueva por sí solos.
  changed=$(git diff --name-only "$base"...HEAD -- "$dir" | grep -v -E "^$dir/(evals/results/|CHANGELOG\.md$)" || true)
  [ -z "$changed" ] && continue

  new=$(python3 -c "import json; print(json.load(open('$dir/.claude-plugin/plugin.json'))['version'])")
  old=$(git show "$base:$dir/.claude-plugin/plugin.json" 2>/dev/null | python3 -c "import json,sys; print(json.load(sys.stdin)['version'])" 2>/dev/null || echo "nuevo")

  if [ "$old" = "nuevo" ]; then
    echo "✔ $dir: plugin nuevo ($new)"
  elif [ "$old" = "$new" ]; then
    echo "✘ $dir: hay cambios pero la versión sigue en $new. Sube la versión en $dir/.claude-plugin/plugin.json y registra el cambio en $dir/CHANGELOG.md."
    status=1
  elif ! grep -q "^## $new" "$dir/CHANGELOG.md" 2>/dev/null; then
    echo "✘ $dir: la versión subió a $new, pero $dir/CHANGELOG.md no tiene la entrada '## $new'."
    status=1
  else
    echo "✔ $dir: $old → $new"
  fi
done
exit $status
