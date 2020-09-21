---
layout: default
---

# Validación automática

El proyecto ya tiene todo lo necesario para poder ser ejecutado: algún archivo que establece cuáles son sus dependencias, un mecanismo que permite descargarlas y el código propio. En un esquema tradicional, el siguiente paso sería desplegar la aplicación en algún entorno de _testing_ para que algún equipo de QA pueda comenzar las pruebas manuales. En un esquema de _integración continua_, lo que haremos es ejecutar una serie de **validaciones automáticas** que nos darán una idea inicial de cómo se comportan los nuevos cambios introducidos en el código. 

Estas validaciones tendrán que ver con los tests que en la [Unidad 4](../testing/testing.index) mencionamos como _"cercanos al código"_ y servirán sobre todo para validar que no se introdujeron defectos sobre lo que ya estaba. Otro tipo de validaciones, más complejas, podrán hacerse más adelante en el _pipeline_, probablemente con intervención manual de algún equipo.

Por último, cabe destacar que la eficacia de las validaciones automáticas dependerá en gran medida de la cultura de la organización y la responsabilidad con la que trabaje el equipo de desarrollo. Si el código que se escribe no está acompañado de pruebas automatizadas, las reglas de estilo se ignoran o no se le da importancia al resultado de la validación, la metodología fracasará.

## El servidor de integración continua

Para poder realizar la tarea que mencionamos anteriormente será necesario contar con un _entorno_ adecuado, donde pueda descargarse la última versión del código y ejecutar las validaciones. Si bien podría montarse desde cero como cualquier otro entorno, existen muchas herramientas que ofrecen facilidades para realizar esta tarea, a las que suele conocerse como **servidor de integración continua**, **CI server**, o simplemente **CI**. 

Algunas de ellas están diseñadas para ser instaladas en una infraestructura propia (como [Jenkins](https://www.jenkins.io/) o [TeamCity](https://www.jetbrains.com/teamcity/)) y otras como un servicio en la nube (como [Travis](https://travis-ci.com/) o [GitHub Actions](https://github.com/features/actions)). En todas ellas está incluida alguna noción de _pipeline_, donde el equipo de operaciones deberá configurar cómo ejecutar cada una de las tareas.

A grandes rasgos, el servidor de integración continua se ocupará de:
* **preparar el código para su ejecución:** descargar dependencias, ejecutar tareas de compilación (si el lenguaje lo requiere),
* **ejecutar las validaciones automáticas**, entre las cuales probablemente se encuentren algunas de las que mencionamos en este material,
* **notificar el resultado:** en general, nos interesará enterarnos lo más rápido posible si la integración falló. 

Los detalles de cada uno de esos grandes pasos dependerán en gran medida de la tecnología y de los criterios sobre la _calidad_ del código que tenga la organización. Sería deseable que todo el proceso pueda ejecutarse en unos pocos minutos, para que la persona que introdujo los defectos pueda corregirlos antes de pasar a otra tarea. 

## Tipos de validaciones más comunes

Mencionaremos a continuación algunos ejemplos de validaciones automáticas que son habituales en los proyectos de software. Sería imposible abarcarlas todas porque hay muchos factores que intervienen, pero intentaremos dar una posible clasificación que permita comprender lo que poco a poco se va transformando en un estándar. 

Si bien estos ejemplos son agnósticos de la tecnología utilizada, es pertinente mencionar que la comunidad que se va armando alrededor de cada tecnología suele adoptar unos u otros mecanismos como "su propio estándar". Esto provoca que sea más sencillo configurar ciertas herramientas para validar software escrito en cierta tecnología, y también que quienes se especialicen con cierto lenguaje estén también familiarizados con algunas herramientas que suelen ir de la mano. 

Con esto queremos decir, una vez más, que no existen aquí tampoco _balas de plata_ ni _navajas multiuso_: será tarea del equipo de operaciones, en colaboración con el de desarrollo, evaluar qué herramientas son más adecuadas para cada proyecto e implementarlas.  

### Chequeos estáticos

Suelen ser muy veloces, y se utilizan para descartar rápidamente modificaciones que no cumplen con ciertos criterios básicos. Se los llama **estáticos** porque sus validaciones ocurren directamente sobre el código, y no sobre el resultado de su ejecución.

Mencionemos algunos ejemplos:

* **Compilación:** la validación por excelencia, un código que no compila no puede siquiera ser ejecutado. Cabe destacar que hoy en día hay una fuerte tendencia de algunos sectores de la industria a utilizar lenguajes _interpretados_, por lo cual este paso no siempre existirá.
* **Chequeos de tipo:** históricamente incluido en la compilación, hoy puede pensarse como un proceso complementario o incluso no existir.
* **Reglas de estilo:** que pueden ir desde convenciones de cómo nombrar a las funciones o qué tipo de indentación usar hasta la cantidad máxima de líneas o parámetros que puede tener una función. En lenguajes interpretados (como Javascript), estos chequeos son muy importantes, porque intentan reemplazar a los que en otros lenguajes realizaba el compilador. 
* **Versión de las dependencias:** existen herramientas que validan que las dependencias que utiliza una aplicación no hayan sido discontinuadas ni expongan vulnerabilidades.

Nuevamente, cuáles utilizar y con qué severidad dependerá de los acuerdos que se hayan generado en cada equipo.

### Chequeos dinámicos

Esencialmente, tienen que ver con ejecutar las pruebas automatizadas que las desarrolladoras hayan definido y detener el proceso de integración si alguna de ellas falla. 

Como ya hemos discutido, existen muchos tipos de pruebas (de unidad, de integración, de carga, etc.) y todos ellos podrían ser utilizados en esta etapa. En consonancia con el requerimiento de que las validaciones se ejecuten lo más rápido posible, podría ser interesante correr distintas validaciones en función de en qué punto del _pipeline_ nos encontremos: podríamos, por ejemplo, solo ejecutar las pruebas unitarias cuando se abre un _pull request_, reservar otra batería de pruebas de integración para cuando el pull request haya sido aprobado y finalmente ejecutar pruebas de carga luego de promocionar el código nuevo a un ambiente pre-productivo.

Además del resultado de las pruebas, es común también que en este punto se genere algún reporte de _cobertura_, que puede luego compararse con alguno anterior para saber si los nuevos cambios incrementaron, mantuvieron o perjudicaron al porcentaje anterior.
