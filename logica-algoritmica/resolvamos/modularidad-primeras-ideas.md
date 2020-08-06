---
layout: default
---

# Organización del programa - primeras ideas
Podríamos preguntarnos si es necesario "esperar" al final para poner todos los "print". Con una idea análoga a la del comando `break` introducido [durante la explicación del algoritmo](./algoritmo.md), cuando se detecta una comparación "mala", podría cortarse directamente la ejecución, dado que ya tenemos el resultado.  
Eso se puede hacer en Python usando `exit`, un comando incluido en la librería `sys`. Queda de esta forma.
``` python
from pathlib import Path
from sys import argv, exit

files = list(Path(argv[1]).iterdir())
tamanio_anterior = files[0].stat().st_size

for file in files[1:]:          # a partir del segundo archivo
    tamanio = file.stat().st_size
    if tamanio_anterior > tamanio:
        exit("no se detecta crecimiento sostenido de logs")
    tamanio_anterior = tamanio

print("los logs vienen creciendo, atención")
``` 
Funciona igual que la versión anterior. Y "nos ahorramos" la variable de nombre largo, `cada_tamanio_es_mas_grande_que_el_anterior`.

A pesar de estas (en nuestra visión, supuestas) ventajas, nosotros recomendamos _fuertemente_ la estructura del programa anterior.

En una primera mirada, la razón de esta preferencia se relaciona con la _claridad_: en esta nueva versión, el objetivo está mucho menos explícito, y hay que pensar en detalle cómo "trabaja" el algoritmo para entender qué hace.  
En particular ¿qué hace ese `print` suelto al final de todo? Hay que relacionarlo con el `exit` del medio, para darse cuenta de que el `print` del final no se va a ejecutar en todos los casos, sino sólo en aquellos en los que no se encontró ninguna comparación "mala".  
Entender el programa anterior involucra, creemos, menos sutilezas.


## Separación en partes - modularidad
Esta observación particular está relacionada con una idea general: en el primer programa podemos separar tres tareas
1. tratamiento inicial de _datos de entrada_.
1. resolución de la _operación_, en este caso mediante un algoritmo.
1. generación de la _salida_.

Transcribamos nuevamente el programa, separando claramente las tres tareas, y señalando dónde queda el resultado de las dos primeras.

``` python
from pathlib import Path
from sys import argv


##  1. Datos de entrada
##     resultado: variable files
files = list(Path(argv[1]).iterdir())
##########################################################


##  2. operación
##     resultado: variable cada_tamanio_es_mas_grande_que_el_anterior
##########################################################
cada_tamanio_es_mas_grande_que_el_anterior = True
tamanio_anterior = files[0].stat().st_size

for file in files[1:]:          # a partir del segundo archivo
    tamanio = file.stat().st_size
    if tamanio_anterior > tamanio:
        cada_tamanio_es_mas_grande_que_el_anterior = False
    tamanio_anterior = tamanio        
##########################################################


##  3. salida
##########################################################
if (cada_tamanio_es_mas_grande_que_el_anterior):
    print("los logs vienen creciendo, atención")
else:
    print("no se detecta crecimiento sostenido de logs")
##########################################################
``` 
Notamos que la _única_ conexión entre las tareas es que cada una usa el resultado de la anterior. 

Nuestro programa se _compone_ de tres partes, con interfaces bien definidas entre ellas.  
Esta idea se asocia a la de _componente_ o _módulo_: decimos que este programa está mejor _modularizado_ que la versión que mezcla la salida con el proceso.

Mencionamos que esta forma de modularización en particular, es análoga a la que se busca, en el desarrollo de aplicaciones, entre _lógica de negocio_ (lo que llamamos aquí "operación") e _interface_ (lo que involucra en este programa a los datos de entrada, y a la salida).


### Fortalezas de un programa mejor modularizado
Esta separación de los tres aspectos que constituyen el programa, hace más sencillo realizar manipulaciones con el programa, que afectan a uno de ellos.

Respecto de la _salida_, si en lugar de informar por consola, se debe generar un archivo con el resulado, enviarlo por mail, o cualquier otra forma de salida, sabemos que con modificar la tercera parte alcanza.  

Respecto de la _operación_, podemos encapsularla en una [función](../basicos/funciones.md)
``` python
def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande = True
    tamanio_anterior = files[0].stat().st_size

    for file in files[1:]:          # a partir del segundo archivo
        tamanio = file.stat().st_size
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande = False
        tamanio_anterior = tamanio
    return cada_tamanio_es_mas_grande
``` 
lo que simplifica aplicar _testeo automático_, de lo que hablaremos en una unidad posterior.

Por otro lado, tener claramente separada la parte del programa que resuelve la lógica algorítmica, nos va a permitir aplicar mejoras y probar con variantes, como veremos más adelante en esta unidad.


## Separar - una actitud básica de desarrollador/a
Al introducir las primeras formas de [repetición](../basicos/repeticion.md), se mencionó la conveniencia de _separar_ entre un objetivo y la técnica para lograrlo.  
En esta sección, subrayamos las ventajas de _separar_ el tratamiento de distintos aspectos involucrados en un programa.

En general, la actitud de _separar_, organizar, dividir, va a estar presente en una desarrolladora. Esto tiene que ver con lo descripto al hablar de la [diferencia entre programar y desarrollar](../../programacion-a-desarrollo/programar-y-desarrollar), respecto de tener la visión amplia sobre un proyecto de desarrollo. 
Muchas veces los proyectos abordan aplicaciones (o conjuntos de aplicaciones) extensos, con mucha funcionalidad para resolver. Además, en general para desarrollar una aplicación interviene una [multitud de aspectos](../../programacion-a-desarrollo/construccion-tareas-roles.md).  
De ahí la necesidad de separar, para pasar de un problema enorme a muchos problemas, que cada uno por separado son abordables.  

Está claro que la estrategia de separar conlleva la problemática de armonizar y relacionar los distintos componentes que se generan.  
En este script, alcanza con tener claro cuáles son las variables que forman la _interface_ entre las distintas partes.  
En una aplicación de mayor volumen, esta problemática entra en el dominio de la [arquitectura de software](../../programacion-a-desarrollo/arquitectura-de-software.md).