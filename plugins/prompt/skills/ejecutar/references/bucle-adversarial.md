# Bucle constructor–crítico

## Por qué dos roles
Un modelo que revisa lo que acaba de escribir tiende a aprobarlo: conoce
sus intenciones y lee lo que quiso hacer, no lo que hizo. Un crítico que
no participó en la construcción solo ve el resultado y el listón.

## Piezas
Divide el entregable según las piezas de la caja 1 y recorre el bucle por
pieza. Revisar todo junto dispersa al crítico y hace que los defectos de
una pieza grande oculten los de las demás. Si una pieza depende de otra,
construye primero la base.

## El ciclo, por pieza
1. **Construir** la pieza según el encargo.
2. **Verificar las restricciones que puedas comprobar tú mismo** antes
   de llamar al crítico (por ejemplo, que las pruebas pasan o que el
   código compila), porque gastar una ronda de crítica en algo que una
   ejecución detecta es desperdicio.
3. **Revisar** con un subagente crítico nuevo:
   - Recibe solo: la pieza (rutas o contenido), el listón, las
     restricciones y assets/plantilla-critico.md.
   - No recibe tu razonamiento, tus borradores ni los veredictos de
     rondas anteriores, para que su juicio no se ancle a ellos.
4. **Corregir** cada hallazgo:
   - Reescribe la sección afectada; no agregues parches al final.
   - Si crees que un hallazgo es incorrecto, puedes descartarlo, pero
     anota la razón para la entrega: el crítico también se equivoca.
   - Lleva tú la lista de hallazgos de la ronda anterior y verifica que
     cada uno quedó resuelto antes de la siguiente revisión.
5. **Repetir** desde el paso 2.

## Detención
- **Aprobada**: ninguna restricción fallida y todos los criterios con 4 o
  más.
- **Límite**: 3 rondas por pieza. Si no se aprueba, pasa a la siguiente
  pieza y registra los defectos abiertos. Seguir iterando suele consumir
  el contexto sin converger.
- **Pieza aprobada que vuelves a tocar**: es habitual que la revisión de
  una pieza posterior (las pruebas, por ejemplo) destape defectos en una
  ya aprobada. Si la corriges, la aprobación anterior ya no vale: pásala
  de nuevo por un crítico si le quedan rondas, y si no, indícalo en la
  entrega como "corregida tras aprobar, sin nueva revisión".

## Sin subagentes
Si el entorno no permite subagentes (por ejemplo, claude.ai), haz la
revisión como una pasada separada: relee solo la pieza, el listón y la
plantilla del crítico, como si no la hubieras escrito. Avisa en la
entrega que la revisión fue menos independiente.

## Tareas largas
Si el encargo tiene muchas piezas, mantén un archivo PROGRESO.md con las
piezas terminadas, las rondas usadas y lo pendiente, para poder retomar
en una sesión nueva si el contexto se agota.
