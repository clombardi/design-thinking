---
layout: default
---

# Zip - juntando de a pares
En esta página comenzamos con el análisis de técnicas de programación, que aplicaremos a la función que determina si los tamaños de los archivos son crecientes.  
Transcribimos la versión de esta función, incluida en la [última versión](../elevando/casos-limite-correcciones) del programa generada en la etapa anterior.

``` python
def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True
    tamanio_anterior = files[0].stat().st_size

    for file in files[1:]:          # a partir del segundo archivo
        tamanio = file.stat().st_size
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False
        tamanio_anterior = tamanio

    return cada_tamanio_es_mas_grande_que_el_anterior
```

Para desarrollar el tema que vamos a tratar en esta página, partimos de la siguiente observación:
en rigor, lo que se está procesando son los _pares_ de tamaños de archivos consecutivos: primero y segundo, segundo y tercero, etc..  
Por ejemplo, si la lista de tamaños de los archivos es `[3,8,5,22]`, entonces en rigor estamos trabajando con esta lista: `[(3,8),(8,5),(5,22)]`.  
Para "generar" el par al que se aplica cada comparación, debemos agregar la variable `tamanio_anterior`, que tenemos que manejar con cierto cuidado dentro de la función.

Observemos en particular, que al pensar en la lista de pares, coinciden exactamente la cantidad de elementos (o sea, de pares) y la cantidad de comparaciones (que es "uno menos" si tomamos la cantidad de archivos): se realiza, exactamente, una comparación para cada par _en esta nueva lista_.  
En el ejemplo, tenemos _cuatro archivos_, pero _tres pares_, que se corresponden con las _tres comparaciones_ que deben realizarse.  
Veremos más adelante que esta correspondencia va a permitir aplicar, luego, otras técnicas de programación.


## Una técnica conocida en el ámbito de la programación
El trabajo con pares de elementos es un aspecto bien estudiado en programación.   
Una de las ideas asociadas es una operación conocida vulgarmente como _zip_: a partir de dos listas separadas, generar la lista de pares de los elementos en el mismo índice en las dos listas. 

Por ejemplo, si consideramos las listas `[3,8,5,22]` y `[98,32,21,77]`, el _zip_ de estas dos listas será `[(3,98), (8,32), (5,21), (22,77)]`, una lista de pares donde el primer elemento "junta" a los primeros elementos de las dos listas originales, y así siguiendo.

Esta operación es bien conocida en el ámbito de la programación, como se puede verificar buscando en Internet "zip arrays \<su-lenguaje-preferido\>".  
Notamos que p.ej. en [Scala](http://allaboutscala.com/tutorials/chapter-8-beginner-tutorial-using-scala-collection-functions/scala-zip-example/) aparece en las librerías incluidas con el lenguaje, en [JavaScript](https://www.geeksforgeeks.org/underscore-js-_-zip-with-examples/) está incluido en la popular librería `Underscore.js`, y que en [Java](https://www.baeldung.com/java-collections-zip) se puede implementar fácilmente utilizando técnicas introducidas en Java 1.8.  
El nombre _zip_ proviene de la imagen de un cierre relámpago (llamado justamente _zip_ o _zipper_ en inglés), que une las dos listas originales.


Afortunadamente, la función `zip` está incluida en la funcionalidad básica de Python, por lo podemos utilizarla sin necesidad de importar una librería específica.
``` python
>>> list(zip([3,8,5,22],[98,32,21,77]))
[(3, 98), (8, 32), (5, 21), (22, 77)]
>>> list(zip([3,8,5,22],[98,32]))
[(3, 98), (8, 32)]
>>> list(zip([],[3]))
[]
>>> list(zip([],[]))
[]
```
En los ejemplos se ve que si las dos listas tienen distinto tamaño, el `zip` considera el tamaño de la más chica.

> **Nota**  
En el ejemplo anterior, notarán el agregado del `list(...)` exterior, análogo al que aparece en nuestro programa: `files = list(Path(argv[1]).iterdir())`.  
Este agregado resulta necesario por una dualidad que mantiene Python entre lo que se conoce como _generadores_, y las listas. Mencionaremos este tema sobre el final del proceso de análisis de código Python; por ahora les pedimos no olvidar el `list(...)`.

Aunque cada par que forma el resultado de `zip` no es exactamente una lista, podemos tratarlo como tal, accediendo a sus elementos mediante los índices 0 y 1.
``` python
>>> pares = list(zip([3,8,5,22],[98,32]))
>>> primer_par = pares[0]
>>> primer_par
(3, 98)
>>> primer_par[0]
3
>>> primer_par[1]
98
```

## Uso del `zip` en nuestro programa
En nuestro caso tenemos una sola lista, la de tamaños. ¿Cuáles son las "dos" listas a "zipear"?  
Esta problemática particular también es conocida, junto con su solución: las dos listas a considerar son la original, y la que resulta de eliminar su primer elemento. Por ejemplo, si la lista original es `[3,8,5,22]`, obtenemos los pares a comparar calculando su `zip` con `[8,5,22]`.  
Para obtener esta segunda lista, se utiliza la notación `[1:]` que ya aplicamos en el programa, y que analizamos al repasar el manejo de [listas/arrays](../basicos/arrays-listas).
``` python
>>> tamanios = [3,8,5,22]
>>> list(zip(tamanios, tamanios[1:]))
[(3, 8), (8, 5), (5, 22)]
```

Estos son, exactamente, los pares sobre hay que hacer las comparaciones. A partir de este análsis, generamos la siguiente variante.
``` python
def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True

    pares_de_archivos = list(zip(files, files[1:]))
    for par in pares_de_archivos:
        tamanio_anterior = par[0].stat().st_size
        tamanio = par[1].stat().st_size
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False

    return cada_tamanio_es_mas_grande_que_el_anterior
```
A primera vista, esta versión no parece más sencilla que la anterior. Pero presenta una diferencia que va a resultar _fundamental_ para seguir aplicando mejoras: no es necesario mantener una variable adicional.  
En la versión previa, el valor de `tamanio_anterior` debía ser ajustado cuidadosamente. En esta versión, se define al único efecto de hacer más legible la función; notar que sólo se define y utiliza dentro del ciclo `for`, y que su valor se obtiene directamente a partir del `par` que resulta de recorrer la lista de pares.  
En este sentido, esta versión resulta ser más simple que la anterior.
