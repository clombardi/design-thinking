---
layout: default
---

# Una forma de arrancar
Después de haber refrescado algunas ideas básicas sobre programación, es hora de usarlas para armar un programa que resuelva el [desafío propuesto](../desafio-enunciado) antes.

Recordemos que distinguimos entre una tarea _técnica_, la de obtener el tamaño de cada archivo en la carpeta, y otra _algorítmica_, la de determinar si cada tamaño es mayor al anterior.  
Relacionemos rápidamente estas dos tareas con algunos conceptos básicos de programación.
- Como resultado de la _tarea técnica_, la información sobre los archivos va a tener que estar disponible en alguna lista, o más genéricamente, una estructura que se pueda recorrer. Ver lo que se habló sobre el objetivo de las [estructuras de repetición](../basicos/repeticion).
- para resolver la _tarea algorítmica_, seguramente nos va a servir utilizar alguna de las formas de recorrido que repasamos.


## Estrategia y resultado
Antes de pensar qué recorrido, y cómo lo organizamos, nos conviene realizar un paso previo, que es el de pensar una **estrategia**.  
Tenemos una lista con el tamaño de cada archivo, ¿cómo hacemos para saber si cada tamaño es mayor al anterior?   
Una observación: el **resultado** que estamos buscando es un "sí-o-no", o cada tamaño es mayor al anterior, o no. 
A los valores "sí-o-no", o `true`/`false`, se los llama _booleanos_. O sea, el resultado de nuestro algoritmo va a ser un booleano. En otros casos, podría ser un número, el nombre de algún recurso (un archivo, un usuario, un proceso), etc..  
Digamos que el resultado va a ser `true` o `false`.

Tal vez la forma más intuitiva es comparar cada tamaño con el anterior: el primero contra el segundo, el segundo contra el tercero, y así hasta los últimos dos.  
Si en alguna de las comparaciones el "anterior" es más grande que el "siguiente", ya podemos decir que el resultado es `false`. Si después de hacer todas las comparaciones no se encontró ninguna así, entonces es `true`.

Vamos con ejemplos.

**Ejemplo 1**: los tamaños son 3 - 8 - 5 - 22.
- primera comparación: 3 contra 8. 3 es menor a 8, tengo que seguir comparando.
- segunda comparación: 8 contra 5. 8 es mayor a 5, listo, el resultado es `false`.

**Ejemplo 2**: los tamaños son 3 - 8 - 15 - 22.
- primera comparación: 3 contra 8. 3 es menor a 8, tengo que seguir comparando.
- segunda comparación: 8 contra 15. 8 es menor a 15, tengo que seguir comparando.
- tercera comparación: 15 contra 22. 15 es menor a 22, tengo que seguir comparando.
- listo, llegué al final, y no encontré ningún par "malo". Entonces el resultado es `true`.

Demos un paso más: digamos que una comparación "es buena" si el "anterior" es más chico que el "siguiente". Si las comparaciones son todas "buenas", entonces el resultado tiene que ser `true`. Si alguna comparación es "mala", entonces es `false`.

Hagamos otra pequeña observación: en los ejemplos tenemos 4 archivos, pero hacemos _tres_ comparaciones. O sea, la cantidad de comparaciones necesarias es uno menos que la cantidad de archivos. A veces, para ubicarnos en cómo encarar un problema, sirve pensar en la relación entre la cantidad de operaciones (en este caso comparaciones) y la cantidad de elementos (en este caso archivos).


## Una pequeña conclusión
Cuando tengamos que resolver una tarea algorítmica, hay tres elementos que muy probablemente aparezcan, y nos conviene tener claros.
1. Los _datos_ que tenemos que analizar, en este caso los tamaños de los archivos.
1. El _resultado_ que queremos obtener, si va a ser un booleano, un número, o qué.
1. La _estrategia_, difícil pensar en un algoritmo o programa si no sabemos qué queremos hacer.

En esta página definimos las tres cosas para el problema que se nos planteó. El próximo paso es definir un [algoritmo](./algoritmo).


