---
layout: default
---

# Trabajo colaborativo
En esta unidad, la última de este material, abordaremos algunos conceptos relacionados con el rol de cada integrante de un equipo de desarrollo, y la necesidad de desarrollar una perspectiva en la que converjan las visiones tradicionalmente asociadas a los roles de "desarrollo" y de "operaciones".

Comenzamos con una breve reseña de varios puntos desarrollados a lo largo de las unidades anteriores.


## Un nuevo escenario en el desarrollo de software
Este curso propuesto por Elevate, "Desde Ops a DevOps", se enmarca en un _nuevo escenario_ acerca del desarrollo de software, que tiene un impacto creciente en la industria, y que requiere de cambios en las actitudes y modalidad de trabajo de las y los profesionales de sistemas.  
Este escenario se basa en varios conceptos, que son tratados en varios pasajes del material de las unidades anteriores.

Mencionemos en primer término la dinámica de **cambio continuo** que resulta necesaria en muchos proyectos de desarrollo.
Esta dinámica surge de la modificación frecuente de requerimientos sobre los productos esperados, tanto respecto de su funcionalidad como de las condiciones de operación, que involucran ambientes/dispositivos donde debe poder desplegarse el software y cuestiones de infraestructura.  
Esta dinámica se ve impulsada por un cúmulo de experiencias conocidas en la industria, en las que la intención de asegurar el éxito de un proyecto mediante un esfuerzo relevante de planificación y documentación previo al comienzo de la construcción de software, lejos de lograr los resultados deseados, llevó a retrasos considerables en los tiempos de desarrollo y atentó contra la calidad del software producido. 
Estos resultados negativos se deben, entre otros factores, a la dificultad de generar documentación precisa en proyectos extensos y/o complejos, la obsolescencia temprana de parte de esa documentación, y la aparición de factores de riesgo no previstos durante el desarrollo.

En parte como respuesta a estos fenómenos, surgen los llamados [**marcos de trabajo ágiles**](../programacion-a-desarrollo/intro-agil), que parten de aceptar la realidad del cambio continuo, y proponen formas de organización que se adaptan a esta realidad, y a la conveniencia de contar con una práctica activa de presentación de resultados en forma frecuente, y de ajuste a partir del feedback recibido.

A su vez, una forma de trabajo que permita generar y mostrar en forma frecuente nuevas versiones de los productos de software, y adaptarse rápidamente a cambios en los requerimientos y condiciones de operación, requiere de un alto grado de **automatización** de varias tareas asociadas al ámbito de operaciones, como la gestión de entornos, la ejecución de tests de distinto tipo, y el despliegue de productos.  
La automatización resulta necesaria para poder llevar a cabo estas tareas con la velocidad y asiduidad requeridas en un escenario altamente dinámico.

La adopción, en el ámbito de operaciones, de técnicas, herramientas y conceptos tradicionalmente vinculados al desarrollo, resulta una herramienta relevante para lograr la elevación necesaria en el grado de automatización de las tareas mencionadas.  
Esta es la génesis del movimiento **DevOps**, que es el tema unificador de este curso.

En este nuevo escenario, cobra una relevancia especial el concepto de **integración**, en varios aspectos.  
Por un lado, el desarrollo de productos de software de complejidad creciente, junto con la necesidad ya mencionada de generación frecuente de versiones a ser desplegadas incluyendo ajustes y agregados, refuerza la importancia y criticidad de la interacción entre distintos componentes, y  por lo tanto de los [tests](../testing/sistematizacion/tipos-documentacion) de integración.  
En otra faceta, el desarrollo de cada componente involucra el trabajo de varias personas o equipos. La integración del código generado por cada uno en una base común desde la que se generan los productos a ser desplegados, conlleva el riesgo de modificaciones concurrentes sobre una misma sección de código, o que modificaciones realizadas por una persona o equipo afecten al código escrito por el resto. 
El carácter altamente dinámico del desarrollo en este nuevo escenario, hace necesaria la minimización de estos riesgos, y por lo tanto, requiere de una atención especial en los eventos de integración de código.

Finalmente, mencionamos un aspecto que delineamos en unidades anteriores, y que trataremos con mayor profundidad en el material que sigue.  
Se trata de un cambio de perspectiva en cada persona involucrada en un proyecto de producción de software, pasando de una visión centrada en el [rol particular](../programacion-a-desarrollo/construccion-tareas-roles) que cada uno lleva a cabo, a otra **enfocada en el producto** que se está desarrollando en su conjunto, considerando la contribución del trabajo de cada persona en _el marco del objetivo colectivo_.  
Este cambio de actitud implica una toma de responsabilidad más directa de cada integrante respecto del resultado global de un proyecto, así como una mayor colaboración entre las personas que desarrollan distintos roles.
Se busca evitar el surgimiento, dentro de un equipo de proyecto, de "cotos cerrados" o "silos", como los descriptos en literatura sobre administración en general. 

## Esta unidad
En esta última unidad, trataremos sobre dos enfoques directamente relacionados con el escenario recién planteado.  
Uno es la integración de equipos que reúnan personas con distintas perspectivas y/o saberes, que colaboran activamente para lograr objetivos compartidos.  
El otro es la obtención de una perspectiva más amplia por parte de cada integrante de un equipo, en la que se logre una mejor comprensión de las consecuencias de sus decisiones en el conjunto del desarrollo, y se propenda a elevar el grado de colaboración en tareas alejadas a priori de su área de experticia.

En concreto, comenzaremos describiendo la estrategia de _desarrollo iterativo e incremental_, que está en línea con un escenario dinámico de producción de software.

Luego pasaremos a varios conceptos que fortalecen una _perspectiva de trabajo colaborativo_: collective code ownership, pair programming y full-stack development.

Finalmente, volveremos al _rol de operaciones_ en el nuevo escenario planteado, reforzando la conveniencia de incorporar prácticas habitualmente vinculadas a una visión _developer_ y, más en general, de adoptar una perspectiva en la que las visiones de desarrollo y de operaciones se integren, poniendo el foco en elevar la calidad de los productos del trabajo compartido.
