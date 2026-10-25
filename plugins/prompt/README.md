# Plugin `prompt`

Implementa el **método Goulet** de prompts rigurosos: un método de trabajo para que Claude no entregue el primer borrador. Separa dos roles: un **constructor** que hace el trabajo y un **crítico** que lo revisa sin haber participado en la construcción, contra un listón de calidad definido antes de empezar.

Forma parte del marketplace personal [`boche`](../../README.md). Instalación:

```
/plugin marketplace add bochetech/claude-plugins
/plugin install prompt@boche
```

Los ejemplos mencionan `dtc`, un plugin de estándares de ingeniería de equipo; ilustran cómo `prompt` toma el listón de un estándar del equipo cuando existe.

| Comando | Qué hace | Modifica algo |
|---|---|---|
| `/prompt:mejorar` | Reescribe tu encargo en cuatro cajas y te lo muestra | No |
| `/prompt:ejecutar` | Cuatro cajas + bucle constructor–crítico hasta pasar el listón | Sí |
| `/prompt:diagnosticar` | Corrige un skill que falló de forma repetida | Sí, el skill |

## Las cuatro cajas

Todo encargo se estructura así antes de ejecutarse:

1. **Tarea**: qué se quiere, para quién y qué piezas componen el entregable.
2. **Método**: cómo se trabaja y cuándo se detiene el bucle.
3. **Listón de calidad**: criterios verificables que usa el crítico para aprobar o rechazar.
4. **Restricciones**: condiciones binarias; se cumplen o no.

## Cuándo usarlo y cuándo no

Úsalo en tareas con un entregable concreto y varias piezas o una exigencia de calidad alta: un servicio nuevo, una especificación, un lote de documentos, un skill.

No lo uses para preguntas, conversación, lluvias de ideas ni cambios pequeños. El bucle cuesta tiempo y tokens, y en esas tareas no aporta. Si lo invocas en una tarea pequeña, Claude te lo dirá y la resolverá directo.

---

## Escenario 1 — `/prompt:mejorar`

**Situación.** Quieres que el ingestor de Bókun, que hoy solo recibe reservas por webhook, también descargue los tours programados. Antes de lanzar el trabajo quieres ver si tu pedido está completo.

**Comando**

```
/prompt:mejorar agrega al ingestor de Bókun un proceso que descargue los tours programados
```

**Qué hace Claude**

1. Detecta lo que falta para que el encargo sea ejecutable sin improvisar.
2. Reescribe el encargo completo en las cuatro cajas, sin esperar respuestas. Donde falta una decisión, pone el valor más razonable marcado `[supuesto]`:

```markdown
## Tarea
Agregar al ingestor de Bókun un job que descargue cada 15 minutos [supuesto] los tours
programados de los próximos 60 días [supuesto] y los publique como eventos de dominio.
Piezas: job, cliente Bókun, mapeo a evento, pruebas, runbook.

## Método
Bucle constructor–crítico, máximo 3 rondas. El listón sale del estándar del equipo (dtc).

## Listón de calidad
- Idempotente: descargar dos veces lo mismo no genera eventos duplicados.
- Un tour que desaparece de Bókun se publica como cancelado, no se borra [supuesto].
- Reintentos con backoff; tras agotarlos, alerta en Cloud Monitoring.
- Cumple tipos-de-sistema/jobs-batch.md y desarrollo/logs.md.

## Restricciones
- Sin credenciales en el código; la API key viene de Secret Manager.
- Pruebas de integración con Bókun simulado; cobertura según pruebas/estrategia.md.
- Nombres de recursos según dsc-[servicio]-[recurso].

## Preguntas
1. ¿Con qué frecuencia y para qué horizonte? — supuesto: cada 15 min, 60 días.
2. ¿Un tour que desaparece se borra o se marca cancelado? — supuesto: cancelado.
```

3. Se detiene. No escribe código. Lo que no pediste pero podría valer la pena, como un dashboard de la descarga, aparece aparte en "Sugerencias fuera de alcance", no dentro de las cajas.

**Resultado.** Un encargo completo. Respondes solo las preguntas cuyo supuesto no te sirve, lo guardas como historia o lo pasas a `/prompt:ejecutar`.

---

## Escenario 2 — `/prompt:ejecutar`

**Situación.** Aprobaste el encargo del escenario anterior y quieres que se construya.

**Comando**

```
/prompt:ejecutar
```

Si lo lanzas sin pasar antes por `mejorar`, Claude hace primero ese paso y te pide aprobación antes de construir.

**Qué hace Claude**

1. **Ronda 1.** Construye el job, el cliente y las pruebas. Un subagente crítico, que no vio la construcción, lo revisa contra el listón y rechaza:
   - Un tour descargado dos veces genera dos eventos: no es idempotente.
   - El log de error incluye la URL completa de la llamada a Bókun, con la API key.
   - No hay alerta cuando se agotan los reintentos.
2. **Ronda 2.** El constructor corrige reescribiendo las secciones afectadas. Un crítico nuevo revisa y encuentra un último problema: los tours cancelados no tienen prueba.
3. **Ronda 3.** Se agrega la prueba. El crítico aprueba: ninguna restricción fallida y todos los criterios con 4 o más.

**Entrega**

```markdown
Hecho: job de descarga, cliente Bókun, mapeo a evento, 14 pruebas, runbook.
Rondas: 3 de 3.
Decisiones tomadas sin consultar: clave de idempotencia = id del tour + fecha de inicio.
Hallazgos descartados: "usar una cola en vez de cron" — fuera del encargo.
Defectos abiertos: ninguno.
Sin commit; listo para revisión en un MR.
```

**Desde otro skill.** Las acciones pesadas de `dtc` (`/dtc:nuevo-servicio`, `/dtc:refactorizar`, `/dtc:plan-deuda`) delegan en `prompt:ejecutar`. En ese caso el listón y las restricciones vienen del estándar del equipo y no se te pide aprobar el encargo, porque la acción ya lo definió.

---

## Escenario 3 — `/prompt:diagnosticar`

**Situación.** Por segunda vez, `/dtc:revisar logs` deja pasar un `console.log` en código de producción. Según la regla de oro del equipo, ya no se corrige en el chat: se corrige el skill.

**Comando**

```
/prompt:diagnosticar /dtc:revisar logs no detectó console.log en src/booking/booking.service.ts, segunda vez que pasa
```

**Qué hace Claude**

0. **Verifica dónde va a corregir.** Confirma que tiene acceso a un clon del repo `ingenieria/claude-plugins` en una rama distinta de `main`. Si solo encuentra la caché de plugins de Claude Code, se detiene y pide abrir la sesión con `--add-dir` (ver [Procedimiento de corrección](#procedimiento-de-corrección)).
1. **Diagnostica la causa** con las tres preguntas:
   - *Activación*: ¿se cargó el skill y el archivo correcto? Sí, se cargó `logs.md`.
   - *Consistencia*: ¿la regla es clara y se aplica igual cada vez? No. `logs.md` dice "usa el Logger de NestJS", pero no dice que `console.*` es un defecto ni en qué carpetas aplica. El revisor lo interpreta distinto en cada ejecución.
   - *Extralimitación*: no aplica.
2. **Reescribe solo la sección afectada** de `logs.md`, sustituyendo el texto anterior:

```markdown
## Uso del logger
En código de producción (src/, excepto src/**/*.spec.ts) todo log usa el Logger
de NestJS con contexto. Cualquier console.* es un hallazgo, porque escribe sin
formato estructurado y Cloud Logging no puede filtrarlo ni correlacionarlo.
```

3. **Agrega una eval** autocontenida que reproduce el fallo: crea un `booking.service.ts` mínimo con el `console.log` y exige que `/dtc:revisar logs` lo marque, sin marcar las líneas que ya usan el Logger.
4. **Sube la versión** del plugin `dtc` (por ejemplo, de 0.3.0 a 0.3.1) y registra el cambio en `CHANGELOG.md`.

**Resultado.** Los cambios quedan en la rama del clon, junto con el comando para probarlos con el marketplace local y el texto de la descripción del MR (causa, cambio y eval agregada). El arreglo llega al equipo siguiendo el procedimiento de corrección.

---

## Mantenimiento

- **Regla de oro**: si un skill falla dos veces en lo mismo, se usa `/prompt:diagnosticar`; no se corrige en el chat.
- **Corrección puntual**: si el cambio responde a una preferencia de una sola tarea, se pide en el chat y el skill no se toca.
- Todo cambio a un skill sube la versión del plugin y se registra en `CHANGELOG.md`.

### Procedimiento de corrección

El plugin que tiene instalado cada persona es una copia en caché descargada desde el repo del marketplace. Si se edita esa copia, el arreglo se pierde en la próxima actualización. Por eso toda corrección se hace sobre un clon del repo del marketplace donde vive el skill y entra por su flujo de cambios (PR o MR).

1. **Abrir la sesión con acceso a ambos repos.** Desde el repo del servicio donde ocurrió el fallo, para conservar la evidencia, agregando el clon del marketplace:

   ```
   cd ~/repos/booking-svc
   claude --add-dir ~/repos/claude-plugins
   ```

2. **Crear una rama** en el clon del marketplace, por ejemplo `fix/dtc-logs-console`.

3. **Ejecutar el diagnóstico** con la evidencia concreta:

   ```
   /prompt:diagnosticar /dtc:revisar logs no detectó console.log en src/booking/booking.service.ts, segunda vez
   ```

   Claude edita en el clon la sección afectada del skill, agrega la eval, sube la versión en `plugin.json` y registra el cambio en `CHANGELOG.md`.

4. **Probar antes del MR.** Registrar el clon como marketplace local, instalar el plugin desde ahí y repetir la acción que falló:

   ```
   /plugin marketplace add ~/repos/claude-plugins
   /dtc:revisar logs src/booking/booking.service.ts
   ```

   Si ahora el fallo no se repite, el arreglo funciona. Después se vuelve al marketplace oficial.

5. **Commit, push y PR/MR**, usando la descripción que entregó Claude.

6. **Merge.** La corrección llega con la actualización automática o con `/plugin marketplace update`.
