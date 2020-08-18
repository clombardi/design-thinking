---
layout: default
---

# Gestión de versiones
En el tiempo de vida de un producto de software, desde que comienza su desarrollo hasta que sale de operaciones, se genera una gran cantidad de **versiones** del mismo.

Además de las versiones que efectivamente son desplegadas en entornos de producción, se generan otras de uso interno.
Entre ellas destacamos que se generan versiones para
- ciclos de testing de componentes individuales.
- testing de integración entre componentes.
- pruebas no funcionales.
- revisión con usuarios.
- aceptación por parte del cliente.

En productos que incluyen varios componentes, cada uno de ellos puede llevar una historia de versiones particular. 
A su vez, como lo comentamos en la [introducción](./scm-intro) de esta unidad, cada archivo que interviene en la generación de un producto o componente, también tiene su historia de cambios.

Este escenario muestra la importancia de una adecuada gestión de versiones en un proyecto de desarrollo.


## Baseline
Entre los archivos que forman parte del código fuente de un componente, algunos pueden haber tenido varios cambios a partir de una versión inicial; estos cambios se corresponden con sucesivas versiones registradas en el repositorio de código. De cada versión se conoce fecha, hora, autor, y algún identificador técnico provisto automáticamente por el repositorio.

Cuando se decide generar una versión del componente, debe elegirse cuáles de los archivos presentes en el código fuente deben incluirse, y qué versión de cada uno. 
En escenarios de desarrollo continuo como los descriptos en la [Unidad 1](../programacion-a-desarrollo/ciclo-de-vida), la simple selección de la versión más reciente de cada archivo suele no ser la adecuada, por razones asociadas a los flujos de trabajo que se describirán en la Unidad 6.  
Las versiones elegidas deben formar un todo coherente, a partir del cual se pueda generar un producto desplegable sin que surjan errores, y donde a su vez, el producto generado funcione sin inconvenientes e incluya las funcionalidades definidas para la versión que debe producirse.

(imagen de "baseline" aplicada a componente. Análoga a la de producto, pero con archivos y componente en lugar de componentes y producto)  
![imagen de "baseline" aplicada a componente](../images/logoelevate.jpg) 

Un fenómeno análogo se presenta, a una escala mayor, respecto de los componentes que conforman un producto. Para generar una versión de un producto, deben seleccionarse versiones de cada componente que funcionen correctamente en conjunto, y que cumplan con las funcionalidades y características esperadas.

(imagen de "baseline" aplicada a producto. Pongo la única que encontré que da la idea, aunque hay que cambiarla)  
![imagen de "baseline" aplicada a producto](./images/baseline-software.png) 

En general, se conoce como **baseline** a un conjunto de versiones de distintos elementos, que forman un todo coherente al integrarse.
De acuerdo a lo recién indicado:
- cada versión de un componente se corresponde con un _baseline_ de su código fuente, y
- cada versión de un producto se corresponde con un _baseline_ del conjunto de sus componentes.


### Baselines y repositorios de código
El concepto de _tag_ permite utilizar al repositorio de código como medio en donde se registran los baselines.

Un **tag** es una marca que se aplica en un repositorio de código, señalando la versión de cada archivo que se encuentra activa al momento de generarse.
Un tag puede tener una identificación definida por el usuario, diferente de las identificaciones técnicas generadas por el mismo repositorio.
De esta forma, se puede registrar el baseline de una versión de un componente, generando un tag que incluya la versión seleccionada de cada archivo.
Los tags quedan registrados, pudiendo inspeccionarse en cualquier momento posterior. Esto permite consultar el estado preciso del código fuente que corresponde a una versión desplegada de un componente.

Algunos productos, como GitHub, incorporan también un concepto de _release_, pensado para versiones destinadas a ser desplegadas en entornos operativos o de aceptación.
Un release se forma a partir de un tag, pudiendo agregarse documentación específica (los llamados _release notes_) y archivos adicionales que pudieran necesitarse para el despliegue.




## Dependencias
Uso de librerías. Necesidad de registrar las versiones de las librerías que se usan.

Sistemas de manejo de librerías: Maven, npm, pip.


## La importancia de ser retrocompatible
Decir algo