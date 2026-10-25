# Conexión con la herramienta de documentación

La estrategia detallada vive en una herramienta de documentación:
- **Notion** a través de su servidor MCP oficial (recomendado si el equipo
  va a leer o comentar).
- **Archivos Markdown locales** con la misma estructura
  (ver assets/estructura-documento.md).

El skill nunca pide, guarda ni escribe tokens o contraseñas. Notion se
autoriza por OAuth en el navegador.

**Regla de oro: siempre se busca el documento (paso 1) antes de crear
nada, y nunca se sobrescribe un documento existente.**

**Nombre corto de la organización** (`<org>`): se escribe en minúsculas,
sin tildes, con guiones en lugar de espacios y sin puntuación. Por
ejemplo, "Acme S.A." pasa a `acme-sa`. El nombre exacto queda en la 00.

## 1. Ubicar el documento (siempre primero)
Busca en las dos ubicaciones:
- **Local**: la carpeta `estrategia-<org>/` en el directorio de trabajo.
  Fíjate si tiene `00-estado.md` o archivos `respaldo-*.md`.
- **Notion**, solo si en la sesión hay herramientas de un MCP de Notion
  (nombres con `notion`): busca "Estrategia — <Organización>" y quédate
  con las páginas cuyo título coincida exactamente. Descarta los
  resultados de otras fuentes conectadas.

Según lo que encuentres:
- **Documento local** (hay `00-estado.md` y su línea "Herramienta:" dice
  Markdown local): agrega a su bitácora la entrada de inicio de sesión,
  léela de vuelta para verificar la escritura y empieza a trabajar.
- **Documento en Notion con MCP** (hay página raíz): ve al paso 4.
- **Señales de un documento en Notion, pero sin MCP**: hay respaldos
  `respaldo-*.md`, cuya primera línea apunta a una página de Notion, o el
  usuario dice que el documento está en Notion. Ve al paso 3 para conectar.
  **No crees nada.**
- **Los dos, varios resultados o solo títulos parecidos**: muéstralos y
  pregunta cuál está vigente antes de hacer nada.
- **Ninguno**: pregunta si existe en otra carpeta u otra página. Si el
  usuario indica que está en Notion, sigue la rama anterior. Si confirma
  que no existe, ve al paso 2.

## 2. Elegir herramienta (solo para un documento nuevo)
- Si hay MCP de Notion, propón Notion y ve al paso 4.
- Si no lo hay, pregunta qué prefiere: conectar Notion (paso 3) o
  Markdown local (paso 6).

## 3. Conectar Notion (guiado)
Dale al usuario todas estas instrucciones juntas. Avísale que en esta
sesión todavía no se ha escrito nada y que se seguirá en la sesión nueva.

Si `notion` ya aparece en `/mcp` (o en `claude mcp list`) pendiente de
autorización, no lo agregues de nuevo: basta con el punto 3.

1. Abrir una terminal **en la carpeta del proyecto** (la misma donde corre
   esta sesión) y ejecutar:
   ```
   claude mcp add --transport http notion https://mcp.notion.com/mcp
   ```
   Así el servidor queda solo para el usuario y solo en esa carpeta. Con
   `--scope user` queda disponible en todos sus proyectos, y no importa
   en qué carpeta se ejecute.
2. Cerrar esta sesión y abrir una nueva en la misma carpeta.
3. Ejecutar `/mcp`, elegir `notion`, autorizar en el navegador y elegir el
   espacio de trabajo. `notion` debe aparecer como conectado.
4. Invocar de nuevo `/estrategia-agil:estrategia <organización>`. La nueva
   sesión empieza otra vez por el paso 1.

Si la autorización falla, comprueba que el usuario sea miembro del
espacio de trabajo (los invitados no pueden conectar) y reintenta. Si
sigue fallando, ofrece Markdown local (paso 6).

## 4. Verificar Notion (lectura y escritura)
1. **Estructura**: lee la página raíz y lista sus subpáginas.
   - Si falta la 00 o alguna de las 00 a 07 (una creación que quedó a
     medias), crea **solo las que faltan**, sin tocar las existentes.
   - La 00 se crea rellenada como en el paso 6.
   - Si hay un respaldo de creación (`respaldo-<fecha>-creacion.md`),
     úsalo como guía y después renómbralo a `sincronizado-…`.
2. **Lectura**: lee la página 00. En un documento nuevo, basta con que la
   búsqueda del paso 1 haya respondido sin error.
3. **Escritura**:
   - Si el documento existe, agrega a la bitácora de la 00 la entrada de
     inicio de sesión (fecha, etapa y objetivo de la sesión) y léela de
     vuelta.
   - Si es nuevo, la escritura se verifica al crearlo (paso 6).
   - Si todo funciona, ve al paso 5.
4. **Si algo falla** (autenticación, permisos o un error al escribir):
   - explica el error;
   - ofrece repetir `/mcp` o seguir en Markdown local;
   - si sigue en local, todo lo de la sesión va a respaldos (paso 7).

   **No sigas como si estuviera conectado.**

## 5. Recuperar respaldos pendientes (documentos en Notion)
Solo después de verificar la escritura en Notion:
1. Busca `estrategia-<org>/respaldo-*.md` en el directorio de trabajo y
   revisa "Pendientes" en la 00.
   - Si "Pendientes" menciona respaldos que no están en la carpeta,
     pregunta en qué carpeta quedaron.
   - Si no hay respaldos, pero el usuario recuerda fallos de escritura,
     pregunta dónde se guardaron.
2. Por cada respaldo de contenido, en orden cronológico:
   - lee la página de destino (indicada en la primera línea del respaldo);
   - integra solo lo que la página aún no tenga, sin reemplazarla ni
     pisar contenido más nuevo. Antes de agregar una fila o sección,
     comprueba que no exista ya;
   - las filas de bitácora se agregan en orden de fecha;
   - renombra ese respaldo a `sincronizado-<nombre original>` apenas se
     integre, antes de pasar al siguiente.
3. Registra en la bitácora qué se integró.

## 6. Crear el documento (solo si el paso 1 confirmó que no existe)
**Notion:**
1. Pregunta bajo qué página o espacio crearlo. Si no hay preferencia,
   usa el nivel superior del espacio de trabajo.
2. Crea la página raíz "Estrategia — <Organización>" con un párrafo que
   explique cómo está organizada.
3. Crea las subpáginas 00 a 07 de assets/estructura-documento.md.
   - **La 00 lleva la plantilla completa, rellenada**: organización con
     su nombre exacto, herramienta, ubicación (enlace a la página raíz),
     la etapa inicial en curso (ver assets/estructura-documento.md) y una
     primera entrada de bitácora.
   - Las demás llevan su título y una línea que diga qué contendrán.
4. Lee de vuelta la página 00: es la verificación de escritura.
5. Comparte con el usuario el enlace a la página raíz.

Si la creación de la raíz, de una subpágina o la lectura de vuelta falla:
1. Avisa al usuario.
2. **No reintentes crear la raíz.**
3. Escribe en `estrategia-<org>/respaldo-<AAAA-MM-DD-HHMM>-creacion.md`
   el enlace a la raíz, qué páginas se crearon y cuáles faltan.
4. Lo que se trabaje en la sesión va a respaldos de contenido (paso 7).

En la próxima sesión, el paso 1 detecta el documento (por la raíz o por
los respaldos) y el paso 4 completa las páginas que falten.

**Markdown local:**
1. Propón la carpeta `estrategia-<org>/` en el directorio de trabajo y
   confírmala con el usuario.
2. Si la carpeta ya tiene un `00-estado.md`, **no lo sobrescribas**: el
   documento ya existe y se retoma (paso 1). Si la carpeta existe pero
   solo tiene respaldos o archivos sueltos, muéstraselos al usuario. Si
   apuntan a Notion, el documento vive allá (paso 3). Si no, crea solo
   los archivos 00 a 07 que falten, sin tocar los que existen.
3. Crea los archivos 00 a 07. El 00 va rellenado igual que en Notion, con
   la ruta absoluta como ubicación.
4. Avisa al usuario que puede versionar la carpeta con git o importarla a
   Notion más adelante, y que debe retomar desde esta misma carpeta.

## 7. Escribir durante el trabajo
**Cuándo**: al cerrar cada bloque de trabajo y otra vez al cerrar la
sesión. Así un corte no hace perder lo avanzado.

**Cómo**:
- Lee la página antes de modificarla.
- Actualiza solo la sección que cambió.
- En la 00, agrega filas o bloques: nunca reemplaces la página entera,
  porque la bitácora solo crece.

**Si una escritura en Notion falla, o la sesión sigue en local tras un
fallo**:
1. Guarda el contenido en
   `estrategia-<org>/respaldo-<AAAA-MM-DD-HHMM>-<página>.md`.
   - La primera línea dice a qué página de Notion pertenece.
   - Si el archivo ya existe, **agrega al final**; nunca lo reemplaces.
2. Dile al usuario la ruta absoluta del respaldo y que retome desde esa
   carpeta.
3. Si la 00 todavía acepta escritura, anota el respaldo en "Pendientes".
   El paso 5 lo recupera en la próxima sesión.
