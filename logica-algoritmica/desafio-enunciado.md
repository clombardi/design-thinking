---
layout: default
---

# El problema a resolver
El escenario al que (en principio) se aplica el problema que se nos plantea, es el análisis de una carpeta en la que se acumulan archivos de logs.
Se nos indica que los archivos llevan el nombre de cada día en formato YYYYMMDD, de forma tal que al ordenarlos por nombre, quedan ordenados también cronológicamente.

Se nos pide implementar, mediante un script, una especie de alarma que indique si los archivos son de tamaño creciente, o sea, si cada archivo resulta ser más grande que el anterior. Esto nos indica la posibilidad de tener que realizar, eventualmente, alguna acción como garantizar una cantidad mayor de espacio, mover logs viejos a otro lado, etc.. 
El script que se nos pide sólo debe "dar la voz de alerta"; las acciones que pudieran tomarse quedan fuera del alcance.

Concretamente, tenemos que armar un script donde el dato de entrada es el nombre de una carpeta, y la salida es un string que indica, o bien
```
atención, los logs vienen creciendo
```
o bien
```
paz, no se detecta crecimiento de logs
```

## Un primer análisis 
Para llegar a tener un programa ... perdón, script, que responda a este requerimiento, hay que resolver dos cuestiones, una técnica y una algorítmica.

La _cuestión técnica_ es obtener la lista de archivos de una carpeta, junto con el tamaño de cada uno. Esto no debería ser difícil.

La _cuestión algorítmica_ es verificar que los tamaños de los archivos son, cada uno, mayor que el anterior. 
Podemos pensar que tenemos una lista de números, sin importar mucho qué representan esos números. Lo que tenemos que resolver es si esta lista _es creciente_ o no.  
Respecto de la "popularidad", este problema se encuentra en algún punto intermedio entre los más comunes y los más raros. O sea, existen técnicas bien conocidas para resolverlo, pero no es tan común como para que los lenguajes tengan una sintaxis especial.  

En esta unidad, vamos a tomar este problema como ejemplo de aplicación de razonamiento algorítmico. Sucesivamente, vamos a:
1. elaborar un algoritmo que resuelve el problema
1. escribir programas que reflejan el algoritmo en distintos lenguajes de programación
1. analizar la estrategia utilizada, ver varios defectos y corregirlos mediante ajustes
1. finalmente, aplicar técnicas un poco más elaboradas para llegar a programas que sean, a la vez, más compactos y menos propensos a errores.

También vamos a trabajar en validación de los datos de entrada (en nuestro caso, el nombre de la carpeta) y cuestiones de organización de código (en particular, separación en unidades independientes).

Pero antes de todo esto, vamos a describir brevemente los lenguajes de programación a utilizar, y repasar algunas estructuras básicas que se utilizarán luego.

