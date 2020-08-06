---
layout: default
---

# Generadores - ahora sí, hablemos de eficiencia

Al [aplicar la función `all`](./all.md), llegamos a una versión notablemente compacta de la función que estamos estudiando.

``` python
def los_tamanios_son_crecientes(files):
    tamanios = [archivo.stat().st_size for archivo in files]
    pares_de_tamanios = list(zip(tamanios, tamanios[1:]))

    return all([tamanio_anterior <= tamanio 
                for tamanio_anterior, tamanio in pares_de_tamanios])
```

Aunque parecería que ya no queda lugar para seguir optimizando, hay un paso más que podemos dar, que va a afectar en particular a la eficiencia.  
Como indicamos al [definir el algoritmo](../resolvamos/algoritmo.md), entendemos que a menos que se trate con una gran cantidad de archivos, el tiempo de ejecución no será un factor de preocupación. 
Por lo tanto, no consideramos como un problema que se realicen todas las comparaciones, aunque probablemente pudiera obtenerse el resultado haciendo sólo algunas, y en algunos casos (si el segundo archivo es más pequeño que el primero) sólo una.  
Como veremos a continuación, en el formato actual del programa, es muy sencillo realizar esta mejora.


## Generadores vs. listas
Al introducir [la operación `zip`](./zip.md), indicamos que siempre se "encerraran" los usos de `zip` dentro de un `list(...)`.  
Veamos el efecto de obviar este paso.

``` python
>>> pares = zip([3,8,5,22],[98,32,21,44])
>>> pares
<zip object at 0x036B8AA8>
>>> pares[0]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: 'zip' object is not subscriptable
```

El resultado del `zip` es un "zip object", que no se comporta como una lista. ¿Qué se puede hacer con un "zip object". Se pueden obtener sus elementos _de a uno_
``` python
>>> pares.__next__()
(3, 98)
>>> pares.__next__()
(8, 32)
>>> pares.__next__()
(5, 21)
>>> pares.__next__()
(22, 44)
>>> pares.__next__()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```
la operación `__next__()` (estamos de acuerdo en que el nombre no es muy cómodo) permite acceder a cada elemento del `zip`, o sea a cada par, sucesivamente. 

En términos técnicos, el resultado del `zip` es un [generador](https://wiki.python.org/moin/Generators) de los sucesivos valores.  
El uso de generadores implica una gran ventaja en términos de uso de recursos: como nunca se genera la lista (en este caso de pares), se evita el uso de memoria, y también la generación de todos los pares en un mismo momento.  
Se puede lograr un efecto similar transformando una _list comprehension_ en _generator expression_, cuya sintaxis es casi idéntica, reemplazando los corchetes exteriores por paréntesis.

``` python
>>> tamanios = [3,8,5,22]
>>> pares = zip(tamanios, tamanios[1:])
>>> pares
<zip object at 0x036B8CA8>
>>> resultado_comparaciones = (tamanio_anterior <= tamanio for tamanio_anterior, tamanio in pares)
>>> resultado_comparaciones
<generator object <genexpr> at 0x036B9258>
>>> resultado_comparaciones.__next__()
True
>>> resultado_comparaciones.__next__()
False
>>> resultado_comparaciones.__next__()
True
>>> resultado_comparaciones.__next__()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

Notemos que no se genera ninguna lista de pares ni de booleanos, y que _todas_ las evaluaciones, la generación de cada par y la comparación, se realizan sólo cuando se necesitan. En el ejemplo, hasta que no se evalúa el segundo `__next__()`, no se genera el par (8,5) ni se hace la comparación.


## Eficiencia de la función `all` 
Y aquí la **buena noticia** (respecto de la eficiencia): la función `all` puede trabajar con una lista, o con un generador, de valores booleanos. En el segundo caso, al encontrarse con un `False` ya devuelve `False` como resultado del `all`, _sin generar el resto de los valores_.  
Por lo tanto, el mismo efecto que en la versión descripta al elaborar el [algoritmo](./algoritmo.md) se logra agregando un `break`, se puede lograr reemplazando las listas por generadores. El código es casi idéntico.

``` python
def los_tamanios_son_crecientes(files):
    tamanios = [archivo.stat().st_size for archivo in files]
    pares_de_tamanios = zip(tamanios, tamanios[1:])

    return all(tamanio_anterior <= tamanio 
               for tamanio_anterior, tamanio in pares_de_tamanios)
```
sólo se eliminó el `list` exterior al `zip`, y se obviaron los corchetes en el parámetro del `all`.  
Se logra la misma ganancia de eficiencia, sin afectar a la claridad del código.

Esto es un reflejo de una tendencia en lenguajes y técnicas de programación modernos: utilizar herramientas que permiten ganancias de eficiencia, sin que sea necesario contemplarla explícitamente en el código (como sería el caso de agregar un `break`), simplemente trabajando con las herramientas y estructuras adecuadas (en el ejemplo, utilizando generadores y la función `all`).


## Los límites de los generadores - acceso secuencial vs. aleatorio
En la última versión de la función, se sigue creando una lista: la de los tamaños. Cabe preguntarse si esto es necesario, si no podríamos incrementar la ganancia de eficiencia reemplazando la primer línea de código por 
``` python
    tamanios = (archivo.stat().st_size for archivo in files)
```
La respuesta está en la línea siguiente: al realizar la operación `tamanios[1:]`, se requiere que `tamanios` sea una lista, no un generador. 

En general, los generadores permiten sólo un acceso _secuencial_, o sea con el modelo de una cinta: para acceder a un dato, primero hay que "pasar" por todos los anteriores, y una vez que se accedió es difícil "rebobinar" para volver a obtener el mismo dato.  
Los arrays/listas permiten acceso _aleatorio_: en cualquier momento, se puede acceder a cualquier elemento (o sección) mediante el índice, y puede accederse a los elementos tantas veces como se quiera.

Es decir, la ventaja de eficiencia de utilizar generadores tiene un costo, el de la restricción al acceso secuencial.

Por la misma razón, no se puede quitar el "envoltorio `list(...)`" en el cuerpo del programa
``` python
files = list(Path(argv[1]).iterdir())
``` 
Además del acceso a la sección que se hace en la función `los_tamanios_son_crecientes`, se accede a la longitud y al último elemento en las funciones que evalúan las otras dos condiciones que inciden en el comportamiento.

En caso de ser necesario (en el ejemplo, si fuera necesario contemplar carpetas con miles, o decenas de miles, de archivos) podría producirse una versión que utilizara únicamente generadores. Esto involucra técnicas que exceden a este material, en el que sólo mencionamos la posibilidad de extender el uso de generadores en caso de ser necesario.



