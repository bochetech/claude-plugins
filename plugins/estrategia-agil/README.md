# Plugin `estrategia-agil`

Acompaña a quien facilita la estrategia de una organización: la formula, la baja a iniciativas y le hace seguimiento. Guía cada etapa con preguntas, redacta los borradores y deja todo escrito en un documento de estrategia en Notion o en Markdown local, para retomar en cualquier sesión.

Se basa en el modelo del curso *Estrategia Corporativa Ágil* (Clase Ejecutiva UC, prof. Antonio Kovacevic), que a su vez se apoya en *Playing to Win* (Lafley y Martin), design thinking, OKR y gestión ágil de portafolio. Las referencias del skill son una síntesis propia, no el material del curso.

Forma parte del marketplace personal [`boche`](../../README.md). Instalación:

```
/plugin marketplace add bochetech/claude-plugins
/plugin install estrategia-agil@boche
```

| Comando | Qué hace | Modifica algo |
|---|---|---|
| `/estrategia-agil:estrategia [organización] [etapa o "seguimiento"]` | Retoma o inicia la estrategia de la organización y conduce la etapa que toca | Sí, el documento de estrategia |

## El recorrido

| Fase | Etapas | Queda escrito |
|---|---|---|
| I. Estrategia ágil | Análisis del contexto → aspiración ganadora → opciones | Pregunta "¿Cómo podríamos…?", aspiración, 3 a 6 opciones con dónde jugar y cómo ganar |
| II. Implementación ágil | Prototipado y testeo (condiciones y barreras) → decisión y One Page Strategy → implementación y piloto (fichas, presupuesto ágil) | Tabla de barreras y tests, One Page Strategy con focos, OKR e iniciativas, ficha y caso de negocio por iniciativa |
| III. Escalamiento ágil | Escalamiento: aprendizajes del piloto → plan de escalamiento | Decisión de escalar y aprendizajes |
| Seguimiento | Revisión mensual, trimestral y estratégica (semestral o ante un evento) | Tabla de OKR e iniciativas, actas y ajustes |

El proceso es recursivo: si una etapa posterior invalida una anterior, el skill propone reabrirla.

## Dónde queda la estrategia

- **Notion** (recomendado): el skill guía la conexión al MCP oficial de Notion: en una terminal, `claude mcp add --transport http notion https://mcp.notion.com/mcp`; luego reiniciar Claude Code y autorizar con OAuth desde `/mcp`. Verifica que puede leer y escribir y crea la página "Estrategia — <Organización>" con sus subpáginas.
- **Markdown local**: si prefieres no conectar Notion, o la conexión no se verifica, propone la carpeta `estrategia-<organizacion>/` con la misma estructura y la confirma contigo.

La página "00 Estado y bitácora" (en local, el archivo `00-estado.md`) guarda la fase y la etapa en curso, los pendientes y cada decisión. Con ella, el skill retoma el trabajo en una sesión nueva sin repetir preguntas.

## Ejemplos

```
/estrategia-agil:estrategia Panadería Los Robles
/estrategia-agil:estrategia Panadería Los Robles one page strategy
/estrategia-agil:estrategia Panadería Los Robles seguimiento
```

## Límites

- No inventa datos de la organización: lo que falta queda como `sin dato` o `[supuesto]` y pasa a pendientes.
- No reemplaza el taller con el equipo: para las etapas grupales propone la dinámica y la agenda al facilitador.
- El semáforo del seguimiento (avance frente a lo esperado a la fecha: ≥70 % en curso, 40–70 % en riesgo, <40 % atrasado) es un criterio del skill, no del curso.
