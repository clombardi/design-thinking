---
layout: default
---

# Introducción a SCM
La gestión del código fuente, temática de esta unidad, es uno de los aspectos de un área más vasta dentro del desarrollo de software, que se conoce como **Software Configuration Management** (**SCM**).  
A grandes rasgos, SCM se refiere a 
- la _gestión de las sucesivas versiones_ que se generan de cada producto desplegable (aplicación / módulo / microservicio) que se produce en un proyecto de desarrollo, y 
- la _gestión de los archivos_ a partir de los cuales se generan dichos desplegables, lo que incluye, pero no se limita, al código fuente; y en general, a todos los archivos involucrados en un proyecto (lo que incorpora documentación, contratos, etc.).




## Relevancia de SCM, sus motivaciones
Las tareas que se agrupan en la sigla SCM podrían ser vistas como meramente administrativas, accesorias a las tareas principales que merecerían el grueso de la atención: las relacionadas con la definición y construcción de los productos de software.

En cambio, en el estado del arte actual del desarrollo de software, se reconoce a SCM como una pieza clave del desarrollo, brindándole una atención creciente. 
Hay varios fenómenos que provocan que la industria eleve la consideración de las tareas de SCM. 

Uno de ellos es la creciente **complejidad** de los productos de software, que conlleva la de su proceso de desarrollo. 
Este fenómeno ya fue referido varias veces en este material, pues está en la base de varios de los conceptos que se describieron en las unidades anteriores, entre ellas: la definición de una gran diversidad de tareas y roles, la relevancia de la arquitectura de software, la búsqueda de la abstracción, la definición de patrones de diseño.  
En relación con SCM, la complejidad se observa en que un producto puede estar formado por distintos componentes, lo que conlleva la necesidad de un registro y sincronización entre las versiones de cada componente. Por otro lado, el código fuente de dichos componentes se compone de una gran cantidad de archivos, en cuya confección participan distintas personas. De aquí deriva la importancia de contar con capacidades adecuadas de auditoría sobre cada elemento.

Otro fenómeno relevante, que también ha aparecido en las unidades anteriores, es el **cambio constante** que es una característica inescapable en muchos proyectos de desarrollo. 
Mencionamos este fenómeno, en particular, entre las motivaciones para el surgimiento de los marcos de trabajo ágiles en la Unidad 1, y de la relevancia del testing en el desarrollo de software, en la Unidad 4.  
Respecto de las tareas de SCM, el cambio constante implica una mayor frecuencia de ejecución, y a la vez, la necesidad de una sincronización más precisa entre las versiones de distintos elementos que forman un componente o un producto de software.  
En particular, la modificación frecuente de los archivos que componen el código fuente, aumenta la probabilidad de _conflictos_ generados por la actualización concurrente de un mismo archivo. Las herramientas y técnicas de SCM deben brindar soluciones para estos casos.

Finalmente, mencionamos que al igual que (p.ej.) los marcos de trabajo ágiles, la importancia de SCM surge de la **experiencia acumulada** en la industria, y en particular de problemas que fueron detectados.  
En particular, la generación de productos desplegables sufrió retrasos muy importanes, debido a problemas de _integración_ entre componentes desarrollados por distintos equipos.  
En otros casos, los problemas se debieron a las diferencias de comportamiento del software en distintos _ambientes_: programas que funcionan correctamente en el equipo individual de un desarrollador, fallan al ser desplegados en un entorno productivo.  
Finalmente, mencionamos un problema que se presenta repetidamente en entornos donde el SCM no es adecuado: ante un defecto que se detecta en un entorno productivo, resulta complejo reconstruir la historia del código fuente involucrado para entender en qué momento se introdujo el defecto, o peor aún, 
simplemente encontrar la versión precisa del código fuente que corresponde al componente productivo.


### Desarrollo colaborativo de software
Mencionamos un estilo de desarrollo de software en el que los fenómenos que dan relevancia a SCM se manifiestan en forma particularmente intensa.

Se trata de los proyectos en los que el desarrollo de un producto de software se realiza de forma _colaborativa_. Tal vez el más renombrado, y que dio lugar a algunas de las herramientas y técnicas que describiremos en esta unidad, es el desarrollo del sistema operativo Linux.  
Estos proyectos están abiertos a la colaboración de cualquier interesado que cumpla con un mínimo de requisitos, lo que provoca que el código fuente incluya contribuciones de muchas personas (que llegan a estar en el orden de los cientos en algunos casos), que no tienen contacto entre ellas.

En este tipo de proyectos, un manejo adecuado de los archivos que componen el código fuente, y de la generación y registro de versiones, resulta particularmente crítico.



## El rol de SCM - manejo del cambio
Los fenómenos recién mencionados hacen que resulte crítica la necesidad de coordinar el esfuerzo de las participantes en un proyecto de software, generando entornos de trabajo en los que la evolución de los productos se dé en forma ordenada, evitando conflictos o fallas de sincronización entre el trabajo de distintos integrantes o equipos, y la aparición de errores.  
En suma, se trata de evitar que un proyecto de software caiga en las negras aguas del caos.

El ámbito de SCM abarca todas las tareas, herramientas y técnicas que se definen para perseguir este objetivo.
Se suele asociar a la idea de "gestión del cambio", subrayando al fenómeno del cambio constante como motivador del rol cada vez más central de SCM en un proyecto de desarrollo.


### Punto de encuentro entre desarrollo y operaciones

Tal vez decir "devops" acá.

## Configuration items
No se refieren solamente a archivos de config. 

Es todo elemento que forma parte del producto, o incluso del proceso. 
Incluye código fuente (que incluye a los tests), recursos (como imágenes), config de varios tipos, y también documentación.

Dentro de estos, el que requiere de cuidados más precisos es el código fuente. 
Habría que explicar por qué, yo lo asocio a que cambia todo el tiempo y tiene muchas unidades.


## Aspectos del proceso de SCM
(esto lo saco del Pressman)
- Identificación de items
- Control de versiones
- Manejo de cambios
- Auditoría de configuraciones


## Herramientas
Para organizar los items y el proceso definido sobre los mismos, hacen falta herramientas.

Seguro hay un repo de código, que resuelve la identificación, organización, y manejo de cambios del código fuente, permitiendo auditar los cambios y ayudando a resolver eventuales conflictos por cambios concurrentes.

Históricamente, el control de versiones, y el manejo de los otros items, se maneja utilizando otras herramientas.
Actualmente, existe una fuerte tendencia a integrar todas las responsabilidades de SCM en los repos de código, tal vez + plugins.
