# Corrigiendo el programa a partir del análisis de casos límite
En la sección anterior, llevamos a cabo un [análisis del algoritmo propuesto](./casos-limite.md) partiendo de la idea de _caso límite_.

Transcribimos las conclusiones obtenidas.
1. Si hay menos de cuatro archivos, no se analiza si los tamaños son crecientes, y se informa que "Hay pocos archivos, no alcanzan para analizar crecimiento".
1. Si el último archivo es más chico que el primero, o es más grande con una diferencia menor al 10%, entonces también se obvia el análisis, y se informa que "No se detecta crecimiento significativo de logs en general".
1. Caso contrario, se realiza el análisis de crecimiento sostenido. Se mantiene el criterio de que un caso en que el archivo anterior sea mayor que el siguiente, alcanza para definir que no hay crecimiento sostenido.

En esta sección vamos a modificar el programa para aplicar estas conclusiones.


## Cambiar el algoritmo o cambiar el programa
Recordemos que el resultado del programa se obtiene a partir de un algoritmo, que verifica que los tamaños de los archivos son crecientes.  
Para aplicar los cambios necesarios, tenemos dos caminos: o bien _modificamos el algoritmo_ (implementado en la función `los_tamanios_son_crecientes`), o bien _modificamos la estructura del programa_ sin tocar el algoritmo.  
En este caso, entendemos que es conveniente tomar el segundo camino. El algoritmo detecta correctamente si cada archivo es más grande que el anterior o no. Lo que necesitamos es que el programa _obvie_ este análisis en algunos casos.


## Más funciones, más respuestas
Vamos a mantener el principio de definir funciones para todas las decisiones que debe tomar el programa. Ahora se agregan dos cuestiones más a analizar
1. Hay pocos archivos.
1. El último archivo (no) es significativamente más grande que el primero.

Por lo tanto, vamos a definir dos nuevas funciones (por más sencillas que sean), y armar una estructura de salida que prevea las distintas respuestas posibles.

En concreto, esta es la versión revisada del programa en Python. 

``` python
from pathlib import Path
from sys import argv
from scriptLibrary import check_arg_count, check_folder


def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True
    tamanio_anterior = files[0].stat().st_size

    for file in files[1:]:          # a partir del segundo archivo
        tamanio = file.stat().st_size
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False
        tamanio_anterior = tamanio

    return cada_tamanio_es_mas_grande_que_el_anterior

def hay_pocos_archivos(files):
    return len(files) < 4

def hay_crecimiento_significativo(files):
    tamanio_primer_archivo = files[0].stat().st_size
    tamanio_ultimo_archivo = files[-1].stat().st_size
    return tamanio_ultimo_archivo >= tamanio_primer_archivo * 1.1
####################################################################


check_arg_count(1)
check_folder(argv[1])

files = list(Path(argv[1]).iterdir())

if (hay_pocos_archivos(files)):
    print("Hay pocos archivos, no alcanzan para analizar crecimiento")
elif (not hay_crecimiento_significativo(files)):
    print("No se detecta crecimiento significativo de logs en general")
elif (los_tamanios_son_crecientes(files)):
    print("Los logs vienen creciendo, atención")
else:
    print("No se detecta crecimiento sostenido de logs")
``` 