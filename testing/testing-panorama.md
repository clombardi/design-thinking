# Errores, defectos y test - un panorama general
En esta nueva unidad, nos despegamos de las cuestiones mayormente técnicas tratadas en las Unidades 2 y 3, elevando nuevamente nuestra visión para englobar al desarrollo de software en forma general.

Vamos a poner nuestra atención en dos de las tareas que mencionamos en el [panorama](../programacion-a-desarrollo/construccion-tareas-roles.md) que presentamos en la Unidad 1: _Gestión de errores_  y _Test_; en una mirada que pretenderá ser abarcadora, no perdiendo de vista el desarrollo de software en su conjunto, y en particular sus objetivos.


## Dos premisas iniciales
Partimos de dos premisas, que creemos dignas de mención aunque puedan parecer obvias.

1. Es inevitable que el software que se construye presente **defectos** de distinto tipo.  
Entre los distintos fenómenos que llevan al surgimiento de defectos, señalamos algunos que hemos mencionado en unidades anteriores: 
    - los múltiples aspectos en los que un producto de software puede resultar _complejo_, mencionados [al comienzo de la Unidad 3](../abstracciones-patrones/abstracciones-paradigmas/abstracciones.md), 
    - la gran cantidad de _componentes_ que pueden formar parte de una aplicación, y que deben combinarse adecuadamente, como se indica al presentar la [arquitectura de software](../programacion-a-desarrollo/arquitectura-de-software.md) en la Unidad 1,
    - los _distintos roles_ que participan en un proyecto de desarrollo, descriptos brevemente al [principio de la Unidad 1](../programacion-a-desarrollo/construccion-tareas-roles.md), que deben trabajar en forma sincronizada y colaborativa,
    - la inexorable aparición de cambios en los requerimientos, comentada al hablar sobre [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida.md) y sobre [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil.md), también en la Unidad 1.

2. Es de la máxima relevancia que estos defectos sean **detectados y corregidos**, antes que los componentes de software producidos se desplieguen para su operación normal.

Nótese que preferimos hablar de _defectos_ en lugar de _errores_. Como veremos durante el desarrollo de esta unidad, el concepto de defecto es más amplio que el específico de "error". 


## Marco de las actividades de testing y de gestión de defectos
La segura existencia de defectos de distinto tipo, conlleva la necesidad de realizar actividades cuyo propósito específico es su _detección y reporte_.

Estas tareas pueden tener distintas características: desde un tester que opera manualmente cada pantalla / página y verifica que los distintos flujos se comportan de acuerdo a lo definido, pasando por un proceso automático que genera una cantidad de operaciones y luego verifica que los datos correspondientes fueron registrados exitosamente, hasta un test de usabilidad en el que se presenta la aplicación a distintas personas y se estudia qué tan cómoda y amigable resulta la interfaz gráfica.

Esta multiplicidad de tareas conlleva la necesidad de definirlas, gestionarlas y documentarlas; este es el dominio de lo que se conoce como **testing de software**.  
En este ámbito, resulta especialmente relevante el _reporte_: los defectos encontrados deben ser registrados en una forma que permita su posterior tratamiento, y por lo tanto, que sean corregidos.

Los reportes de defectos son el punto inicial de la **gestión de defectos**: las acciones necesarias para corregir los defectos encontrados deben entrelazarse con las otras tareas de desarrollo, debe llevarse una gestión de las mismas (asignación, seguimiento, registro de la finalización de tareas de corrección), y finalmente debe volver a testearse para verificar que la corrección es adecuada.


## Contenido de esta unidad
Las tareas de _testing de software_ y _gestión de defectos_, tienen sus conceptos, roles, técnicas y herramientas específicas. En esta unidad haremos una rápida descripción de los principales, con el objetivo de elevar nuestro nivel de comprensión, sobre estas tareas en particular, y sobre el proceso global de desarrollo de software en general. 



