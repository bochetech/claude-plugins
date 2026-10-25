# Eval de regresión

La eval es la prueba de que el arreglo funciona y de que el fallo no
vuelve. Tiene que poder correr sola, en el CI o en la máquina de otra
persona, sin la sesión donde ocurrió el fallo: cada ejecución parte de
una carpeta vacía, así que la eval debe crear la entrada que reproduce el
fallo.

## Ubicación y formato
Va en `<plugin>/evals/<nombre-del-caso>/`, con el formato de
`claude plugin eval`. Si en esa carpeta ya hay casos, imita su estilo;
si les falta la entrada que reproduce el fallo, no copies ese defecto.

```
<plugin>/evals/<caso>/
  case.yaml          nombre y scaffold
  fixture.sh         crea los archivos de entrada en la carpeta de trabajo
  prompt.md          la petición, tal como la escribió el usuario
  graders/
    detecta.md       verificación determinista (regex), si es posible
    criterio.md      juicio con LLM para lo que no se reduce a un patrón
```

`case.yaml`:

```yaml
schema_version: "1.1"
name: revisar-logs-console
description: revisar logs debe marcar console.* aunque el archivo use el Logger
tags: [regresion]
context:
  scaffold_script: fixture.sh
```

`fixture.sh` recrea la evidencia mínima, no el repositorio entero: solo
los archivos y líneas necesarios para que el fallo aparezca. Conserva la
forma del caso real (por ejemplo, un archivo que usa el Logger en varias
líneas y tiene un solo console.log), porque esa forma suele ser la causa
del fallo.

```bash
#!/usr/bin/env bash
set -euo pipefail
mkdir -p src/booking
cat > src/booking/booking.service.ts <<'EOF'
...contenido mínimo que reproduce el fallo...
EOF
```

`prompt.md`:

```markdown
---
max_turns: 15
allowed_tools: [Read, Glob, Grep, Skill]
---

/dtc:revisar logs src/booking/booking.service.ts
```

`graders/detecta.md`, cuando el resultado esperado tiene una forma fija:

```markdown
---
type: regex
pattern: "booking\\.service\\.ts:\\d+"
match: contains
target: last_message
---
```

`graders/criterio.md`, para el juicio:

```markdown
---
type: llm
---
PASS si la respuesta marca como hallazgo el console.log de
booking.service.ts, cita la regla de uso del logger y propone usar el
Logger de NestJS. FAIL si responde "Sin hallazgos", si marca como
hallazgo líneas que ya usan this.logger o si edita el archivo.
```

Otros tipos de grader: `tool_used` (se usó o no una herramienta),
`file_exists` (se creó un archivo) y `tool_order`.

## Buenas evals de regresión
- **Falla con el skill anterior.** Si la eval pasaría también sin el
  arreglo, no protege nada. Piensa qué respuesta dio el skill cuando
  falló y asegúrate de que los graders la rechazan.
- **Evita el falso positivo.** Incluye en el criterio lo que no debe
  pasar (marcar líneas correctas, editar archivos), para que un arreglo
  que se pase al otro extremo también falle.
- **Una eval por fallo.** No agregues casos de otros temas en la misma
  corrección.

## Cómo se corre
```
claude plugin eval <plugin> --case <caso> --scaffold --runs 1
```

`--scaffold` es necesario para que se ejecute `fixture.sh`. La corrida
consume API; quien la lanza es el usuario o el job `evaluar` del CI.
