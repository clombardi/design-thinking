---
layout: default
---

# all - condición que cumplen todos los elementos

Comencemos este último paso de transformación, transcribiendo el código de la función luego de aplicar las sintaxis de [list comprehension y destructuring](./solo-tamanios)

``` python
def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True
    tamanios = [archivo.stat().st_size for archivo in files]
    pares_de_tamanios = list(zip(tamanios, tamanios[1:]))
    
    for tamanio_anterior, tamanio in pares_de_tamanios:
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False

    return cada_tamanio_es_mas_grande_que_el_anterior
```
Mediante las transformaciones anteriores, se ha "limpiado" al máximo el `for`, que ahora trabaja sobre la estructura más simple posible: una lista de pares de números.  
En esta versión simplificada, resulta sencillo apreciar la condición que se está calculando: que _para ningún_ par de tamaños, se cumpla `tamanio_anterior > tamanio`.  
Esto es equivalente a decir que, _para todo_ par de tamaños, debe cumplirse `tamanio_anterior <= tamanio`.

Al pensarlo de esta forma, se puede relacionar este código con una funcionalidad presente en varios lenguajes: una forma de expresar fácilmente que _todos los elementos de una lista cumplen una condición_.  
Esta característica aparece, con distintos nombres, en diversos lenguajes de propósito general: se conoce como `every` en [JavaScript](https://developer.mozilla.org/es/docs/Web/JavaScript/Referencia/Objetos_globales/Array/every), `allMatch` en [Java 8](https://docs.oracle.com/javase/8/docs/api/java/util/stream/Stream.html#allMatch-java.util.function.Predicate-), `all?` en [Ruby](https://apidock.com/ruby/Enumerable/all%3F).  
Python incluye la función `all`, que evalúa si todos los elementos de una lista son `true`. O sea, estos elementos deben ser booleanos, o sea, los _resultados_ de la comparación.  
A su vez, ya conocemos una sintaxis sencilla de obtener la lista de resultados: list comprehension. 

Probemos estas ideas en la consola interactiva de Python
``` python
>>> tamanios = [3,8,5,22]
>>> [tamanio < 100 for tamanio in tamanios]
[True, True, True, True]
>>> all([tamanio < 100 for tamanio in tamanios])
True
>>> [tamanio < 10 for tamanio in tamanios]
[True, True, True, False]
>>> all([tamanio < 10 for tamanio in tamanios])
False
``` 
utilizando list comprehension obtenemos la lista de booleanos con el resultado para cada elemento. A su vez, al aplicar `all` sobre esta lista, obtenemos el resultado deseado: saber si todos los elementos cumplen, o no, la condición que nos interesa evaluar.

En nuestro caso, tenemos una lista de pares y queremos evaluar si en cada par, el primer elemento es menor o igual al segundo. Antes de pasar al código, podemos hacer otra prueba en la consola.
``` python
>>> tamanios = [3,8,5,22]
>>> pares = list(zip(tamanios, tamanios[1:]))
>>> pares
[(3, 8), (8, 5), (5, 22)]
>>> [ anterior <= actual for anterior, actual in pares ]
[True, False, True]
>>> all([ anterior <= actual for anterior, actual in pares ])
False

>>> tamanios_ordenados = [3,5,8,22]
>>> pares_ordenados = list(zip(tamanios_ordenados, tamanios_ordenados[1:]))
>>> [ anterior <= actual for anterior, actual in pares_ordenados ]
[True, True, True]
>>> all([ anterior <= actual for anterior, actual in pares_ordenados ])
True
``` 
Mostramos dos ejemplos de cómo pasar, sucesivamente, de la lista de tamaños, a la lista de pares, luego a la lista de los resultados de las comparaciones, y finalmente utilizando `all`, al resultado deseado: si en todas las comparaciones, se cumple `anterior <= actual`.

Ahora sí, apliquemos esta idea para llegar a la forma más compacta de nuestra función.
``` python
def los_tamanios_son_crecientes(files):
    tamanios = [archivo.stat().st_size for archivo in files]
    pares_de_tamanios = list(zip(tamanios, tamanios[1:]))

    return all([tamanio_anterior <= tamanio 
                for tamanio_anterior, tamanio in pares_de_tamanios])
```
En nuestra opinión, además de ser más compacta, esta versión es la que expresa más claramente la condición: que para todos los pares de tamaños, el anterior sea menor-o-igual al actual.


## Evolución del código
Cerramos (o casi) esta descripción de técnicas de programación, con un comentario sobre cómo fue evolucionando el código.  
Al leer este material, puede dar la impresión de que la secuencia de pasos que llegó a la forma final del código fue armada en forma artificial, al único efecto de ir describiendo las distintas técnicas que se comentaron.  
En realidad, la generación de las versiones intermedias se dio _naturalmente_ durante la concepción de estos textos. Resultó necesario ir pasando por las distintas versiones para reconstruir la condición que se está evaluando en la forma "para todos los pares ...", y recién a partir de esa nueva intuición se generó la versión final usando `all`.  
Lo que acabamos de describir es un reflejo de la _evolución_ que va sufriendo un programa, a medida que sus autoras van aumentando su comprensión.


