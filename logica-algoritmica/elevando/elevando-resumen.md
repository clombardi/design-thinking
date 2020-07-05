# Un pequeño resumen del camino transitado

Hagamos una pequeña reseña de los pasos dados, a partir de que abordamos la resolución del [problema](../desafio-enunciado.md) planteado.


## Etapa 1 - llegar a un primer programa
Comenzamos armando un primer programa que resuelve el problema, a partir de las siguientes ideas:
- separación entre tareas técnicas y algorítmicas.
- resolución de las tareas técnicas estudiando las herramientas provistas por los lenguajes de programación definidos.
- resolución de las tareas algorítmicas en tres etapas: primero planteamos una [estrategia](../resolvamos/estrategia.md) de resolución, a partir de la estrategia diseñamos un [algoritmo](../resolvamos/algoritmo.md), y finalmente, transformamos el algoritmo en código, escrito en cada uno de los tres lenguajes abordados.
- reuniendo la resolución de los dos tipos de tareas, construimos nuestro [primer programa](../resolvamos/primer-programa.md).


## Etapa 2 - elevar la calidad
A partir de esta versión inicial, realizamos varias acciones para mejorar la calidad de nuestro producto. 

Por un lado, trabajamos en la [validación de datos de entrada](./validacion-datos-entrada.md).  
También analizamos a nuestro programa desde el punto de vista de la [modularidad](../resolvamos/modularidad-primeras-ideas.md).  
Finalmente, _partiendo de la versión inicial_, realizamos un [análisis de casos límite](./casos-limite.md) que nos llevó a comprender mejor los requerimientos del programa que estamos construyendo, y a realizar mejoras a partir de las conclusiones obtenidas. En este sentido, aplicamos a nuestro pequeño proyecto, ideas del ámbito general del desarrollo de software que estudiamos en la [unidad 1](../../programacion-a-desarrollo/programacion-a-desarrollo.index.md).

Como resultado de esta segunda etapa, logramos
- un programa _más robusto_, que maneja correctamente los errores en los datos de entrada, y que no falla en ningún caso conocido.
- una _mejor comprensión_ del comportamiento esperado del programa.
- a partir de lo anterior, un programa que se _ajusta mejor_ a las necesidades que motivaron su construcción.
- el comienzo de la construcción de una _librería propia_ con funciones de validación de datos de entrada.

Para lograr estas mejoras, fue crucial adoptar una _visión amplia_, que incluye a las distintas partes del programa, a las condiciones en que se utiliza, y al aporte que puede hacer para la construcción de otros programas.


## Etapa 3 - el foco vuelve al algoritmo
En la última parte de esta unidad, vamos a volver a poner el foco en el algoritmo. Vamos a trabajar sobre la función que resuelve si los tamaños de los archivos analizados son crecientes.  
Tomando esta función como ejemplo, vamos a presentar algunas ideas más avanzadas de programación, con el objetivo de llegar a formas del código que resulten, a la vez, más compactas y más claras.

Vamos a proceder en dos partes.
1. Primero vamos a estudiar técnicas más generales de programación, utilizando Python como lenguaje.
1. Luego, vamos a trabajar con lenguajes de scripting, ejemplificando con PowerShell. Veremos cómo transladar algunos conceptos vistos en la parte anterior, y los combinaremos con técnicas más específicas de este tipo de lenguajes.




