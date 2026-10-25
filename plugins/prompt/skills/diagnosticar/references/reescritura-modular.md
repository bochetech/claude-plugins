# Reescritura modular

Cada fallo tienta a agregar una regla al final. Tras varias rondas, el
skill acumula reglas superpuestas o contradictorias, crece, y las
importantes se diluyen. La corrección se hace sustituyendo, no apilando.

## Reglas
1. **Ubica la sección** donde debería vivir la regla según el tema, no
   donde sea más fácil agregarla.
2. **Sustituye.** Reescribe la sección completa con la regla corregida
   integrada. Si una regla nueva reemplaza a otra, la anterior se elimina.
3. **Busca duplicados.** Si la misma regla aparece en otro archivo,
   déjala en uno solo y haz que los demás remitan a él.
4. **Explica el porqué** en una frase. Una regla con su razón se aplica
   mejor en casos que no previó.
5. **Muestra un ejemplo** correcto y uno incorrecto cuando el fallo fue
   de interpretación.
6. **Lenguaje normal.** Evita mayúsculas sostenidas y prohibiciones
   enfáticas: endurecen al modelo y empeoran cómo sigue el resto del
   texto.
7. **Sin cambios colaterales.** No aproveches para reordenar o reescribir
   secciones que no fallaron; un diff pequeño se revisa bien en el MR.
8. **Tamaño.** Si el SKILL.md se acerca a 500 líneas, mueve detalle a un
   archivo de referencia en vez de seguir agregando.

## Ejemplo

Antes:

```
## Uso del logger
Usa el Logger de NestJS.
```

Después:

```
## Uso del logger
En código de producción (src/, excepto src/**/*.spec.ts) todo log usa el
Logger de NestJS con contexto. Cualquier console.* es un hallazgo, porque
escribe sin formato estructurado y Cloud Logging no puede filtrarlo ni
correlacionarlo.

Correcto:   this.logger.warn('Bókun sin respuesta', { correlationId });
Incorrecto: console.log('Bókun sin respuesta');
```

La regla anterior desaparece: la nueva la contiene y precisa su alcance.
