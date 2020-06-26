# Programación: algoritmos comunes y particulares

## Un caso ultra-común: seleccionar-y-extraer
En la [página anterior](./algoritmo-filosofia.md) relacionamos la palabra "algoritmo" con el procesamiento de datos.

Hay algunos esquemas de procesamiento que son extremadamente comunes en programación.  
Uno típico es: a partir de una lista o secuencia, _seleccionar_ los elementos que cumplen una condición, y de esos, _extraer_ cierto dato particular. Este esquema se asocia a las ideas de `filter` (selección) y `map` (extracción).

Esto es lo que hicimos en el [ejemplo de la unidad 1](../programacion-a-desarrollo/programar-y-desarrollar-ejemplo-apendice.md): de todas las definiciones de servicio, _seleccionamos_ la que exponen un host port determinado, y de esos, _extraemos_ el nombre del servicio. 

La forma final del código Python expresa claramente (OK, tal vez lo de "claramente" es una vez que una se acostumbra a la sintaxis) esta idea
``` python
servicesForPort = [serviceName 
    for (serviceName, serviceSpec) in parsedContents['services'].items()
    if serviceIncludesHostPort(serviceSpec, portNumber)
]
```
La estructura general es
``` python
[<que_quiero_extraer>
    for <elemento> in <secuencia_o_lista>
    if <condicion>
]
```
Python ofrece una sintaxis simplificada _debido a_ que este es un esquema muy usado.

En otro ámbito, la _sintaxis básica de SQL_ responde a la misma idea, donde la "secuencia o lista" es una tabla, o el resultado de vincular distintas tablas.
``` sql
SELECT <que_quiero_extraer>
FROM <tabla_o_tablas_vinculadas>
WHERE <condicion>
```

Cuando nos toque resolver un problema que se puede traducir a un esquema standard de procesamiento, para abordarlo se puede proceder como sigue.
1. antes que nada, _reconocer_ que podemos utilizar un esquema conocido
1. _conocer_ (o aprender) las herramientas que nos da el lenguaje (o librerías agregadas) que nos ayuda a resolver el esquema detectado
1. _aplicar_ las herramientas encontradas.


## También hay casos más específicos
x