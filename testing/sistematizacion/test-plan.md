# Test plan
El test plan es un documento que incluye la información que permite planificar y gestionar las actividades de testing para un proyecto, o para parte del mismo en el caso de proyectos de gran envergadura.  
Puede considerarse el mapa general que guía el esfuerzo de testing, que de acuerdo a lo comentado en páginas anteriores, puede involucrar una gran cantidad y diversidad de actividades.

En las siguientes secciones, describiremos brevemente algunas características de este documento.


## Objetivos de un test plan
Entre los objetivos de la confección de un test plan mencionamos.
- contar con una guía general de qué actividades de test se llevarán a cabo, de forma de poder determinar un grado de avance de acuerdo a las tareas realizadas en un determinado momento.
- tener una herramienta que ayude a la organización de los esfuerzos y recursos necesarios.
- documentar las decisiones sobre actividades de test a realizar, su alcance y profundidad, teniendo en cuenta la necesidad de establecer límites en este sentido para mantener un balance costo/beneficio positivo.
- en algunos casos, establecer un contrato respecto de las actividades y condiciones de test entre la organización que se encarga del desarrollo, y el cliente o solicitante.
- servir como vehículo de comunicación entre los distintos actores relacionados con las actividades de testing: en particular los roles directamente ligados al testing, pero también los product owners, personal de operaciones, desarrolladoras, etc..

La necesidad de contar con una buena organización de las actividades de test puede ser esecialmente relevante en un esquema de [desarrollo continuo](../programacion-a-desarrollo/ciclo-de-vida.md), en el que estas actividades se desarrollan en paralelo con las otras tareas de desarrollo.  
Señalamos que este escenario implica una necesidad de sincronización que eleva el nivel necesario de gestión del testing.


## Elementos de un test plan
Un test plan debe incluir, al menos
- una descripción general de los [tipos de test](./tipos-documentacion.md) que deben implementarse, con indicaciones de nivel o alcance de cada uno.
- una estimación de los recursos de personal y equipamiento necesarios.
- un schedule para las actividades planificadas.
- la asignación de responsabilidades a los distintos actores que formen parte de las actividades de testing.
- una indicación sobre cómo deben reportarse los defectos que se encuentren.
- el alcance, en términos de las funcionalidades. Cuáles son las funcionalidades a las que debe prestarse especial atención, y eventualmente, qué funcionalidades quedarán fuera del esfuerzo de testing o tendrán sólo una atención marginal.


## Consecuencias de la confección de un test plan
La preparación de un test plan puede redundar en beneficios más allá de los objetivos indicados.

En particular, destacamos que la tarea de redactar un test plan puede ayudar a refinar la comprensión sobre los requerimientos de una aplicación. 
En particular, para debatir los niveles adecuados de requerimiento para los factores asociados a los [tests no funcionales](./tipos-documentacion.md), y la priorización entre los mismos.

