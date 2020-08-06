---
layout: default
---

# Repaso de list comprehension - sólo los tamaños

Transcribimos el código de la función luego de [utilizar la función `zip`](./zip).
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

En esta página vamos a dar un pequeño paso que nos permita refrescar la sintaxis de _list comprehension_, que fue introducida al hablar sobre distintas formas de [repetición](../basicos/repeticion). Allí se mencionó como una forma "Pythónica" de expresar un ciclo `for`.  

Esta es la forma general de una _list comprehension_.
``` python
[<que_quiero_extraer>
    for <elemento> in <secuencia_o_lista>
    if <condicion>
]
```
En este caso la vamos a utilizar para extraer los tamaños de los archivos, al principio. Como no hay una condición, se obvia la cláusula `if`. 
Luego manejaremos la lista de tamaños, obteniéndose una versión un poco más sencilla.  

``` python
def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True

    tamanios = [archivo.stat().st_size for archivo in files]
    pares_de_tamanios = zip(tamanios, tamanios[1:])
    for par in pares_de_tamanios:
        tamanio_anterior = par[0]
        tamanio = par[1]
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False

    return cada_tamanio_es_mas_grande_que_el_anterior
```

## Asignación desestructurante (o _destructuring_)
En esta versión, cada `par` es sencillamente un par de números.  
Podemos aprovechar una característica que está presente en Python y PowerShell (y también en otros lenguajes como p.ej. JavaScript o Ruby): la _asignación desestructurante_ (mucho más conocida por su nombre en inglés _destructuring assignment_ o sencillamente _destructuring_), que permite asignar el valor de varios elementos de un array a distintas variables, en una sola sentencia.   
Veamos cómo funciona esto, jugando en la consola interactiva
``` python
>>> par = [4,22]
>>> a, b = par
>>> a
4
>>> b
22
```
Este truco sintáctico, aplicado directamente en el encabezado del `for`, nos va a permitir abreviar la definición de las variables `tamanio_anterior` y `tamanio`
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
Ahora sí, hemos logrado obtener una versión más compacta de la función, sin perder claridad. 
