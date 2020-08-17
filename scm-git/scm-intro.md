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
Se suele asociar a la idea de **gestión del cambio**, subrayando al fenómeno del cambio constante como motivador del rol cada vez más central de SCM en un proyecto de desarrollo.


### Punto de encuentro entre desarrollo y operaciones
Varias de las tareas que abarca SCM, en particular la generación y/o gestión de productos desplegables, y también la gestión del código fuente (sobre todo, su almacenamiento y resguardo) se asocian al ámbito de operaciones IT.

Por otro lado, son los/las desarrolladores quienes generan y mantienen los archivos que componen el código fuente.
Por lo tanto, ellos/as tienen el conocimiento de qué archivos, y en qué versiones, deben tomarse para generar un determinado producto desplegable, y también los encargados de resolver los conflictos que pudieran aparecer por modificaciones concurrentes.

De esta forma, SCM resulta ser un punto en el que la confluencia de los ámbitos de desarrollo y operaciones se da naturalmente.  
De aquí que no sea casual que el concepto de _DevOps_ haya surgido a partir de, y se asocia mayormente con, tareas de SCM.


## Configuration items
Volviendo al significado de la sigla, "Software _Configuration_ Management", cabe la pregunta sobre cuáles son los elementos que conforman una "configuración".  
En una mirada , podría pensarse que se refiere únicamente a los archivos que definen elementos de configuración de un producto de software, asociados p.ej. a bases de datos, formas de comunicación (URL, puertos, etc.), carpetas para guardar o recuperar información, internacionalización, detalles gráficos (como colores, tipos de letra o detalles sobre ventanas), entre otros.

En realidad, se define como **configuration item** todo archivo que forma parte de la generación de los productos desplegables, o incluso del proceso del desarrollo.  
Por lo tanto, incluye al código fuente, a los recursos (imágenes, archivos de texto, etc.) que se integrarán al mismo en los desplegables, tests, y documentación de distinto tipo, además de los archivos de configuración mencionados.  
El término _work product_ también es utilizado para denotar cada una de las unidades incluidas en un proyecto de desarrollo.

En la mayor parte de los proyectos, los items que requieren de cuidados más precisos son los que constituyen el _código fuente_, debido a varios factores.
Entre ellos mencionamos: la _gran cantidad_ de archivos fuente que incluye un proyecto, la _alta frecuencia de cambio_ para algunos de ellos que implica la necesidad de registrar correctamente autor y contenido de cada modificación, y la característica _sutil_ del código, que provoca que pequeños cambios en el texto de un archivo fuente puedan generar cambios importantes o errores en el software.


## Aspectos del proceso de SCM
Para completar una primer mirada hacia el ámbito de SCM, distinguimos varios de los aspectos que deben considerarse para la correcta gestión de un proyecto de software y de los productos generados.

**Identificación**  
Cada _configuration item_ debe contar con una identificación única, este es el punto inicial para su gestión. La identificación de un item se asocia, en muchos casos, al nombre del archivo y su ubicación en una estructura de carpetas/directorios.  
En algunos proyectos se establecen _convenciones de nombre_ para facilitar la identificación de carpetas. Algunas tecnologías o prácticas de desarrollo, imponen convenciones análogas para la _organización_ de archivos en carpetas.

**Control de versiones**  
Cada versión de un desplegable involucra una gran cantidad de archivos. 
A su vez, varios de estos archivos, en particular dentro del código fuente, se modifican frecuentemente, dando lugar a una historia particular de versiones de cada uno.  

Debe llevarse un registro cuidadoso de cada versión de cada desplegable, estableciendo las relaciones correctas con la versión correspondiente de cada archivo utilizado para su generación.
Esto permite volver a generar el desplegable de ser necesario, y también tener una base cierta para el análisis de su comportamiento a partir de su código fuente.
Este registro debe incluir qué versión de cada componente está desplegada, en un determinado momento, en cada uno de los ambientes relevantes: el o los ambientes de producción, los que se utilizan para los tests de aceptación, y eventualmente otros.

Además, es importante que cada _defecto_ que se detecte, sea asociado a las versiones de los componentes involucrados sobre los cuales fue detectado. Esto es imprescindible para una gestión correcta del defecto.

**Gestión del cambio**  
Partiendo de la premisa de que el cambio es inevitable, deben establecerse procedimientos y técnicas para la gestión de los cambios que se producen en un proyecto de software.  
Esto aplica tanto a la gestión de los archivos a partir de los cuales se generan los entregables, en particular el código fuente; como a los componentes o porductos vistos como un todo.

Respecto del _código fuente_, debe llevarse cuenta de cada modificación hecha sobre uno o varios archivos, incluyendo su autor, y el detalle de los cambios efectuados en el código, idealmente línea-por-línea.  
Debe tenerse en cuenta la posibilidad de _modificaciones concurrentes_, que se verifican cuando varias desarrolladoras registran cambios sobre un mismo archivo que parten de una misma versión inicial, de modo tal que ninguna de ellas conoce los cambios hechos por las otras. 
Deben establecerse procedimientos adecuados que ayuden a incorporar las modificaciones hechas por distintas personas si son mutuamente compatibles, y a resolver los _conflictos_ encontrados en caso contrario, p.ej. dos propuestas de cambio afectan a la misma línea de código.

Respecto de los _productos_, debe mantenerse un registro de las solicitudes de modificación hechas por clientes o usuarios, o debidas a necesidades técnicas.
Para cada propuesta o pedido de cambio, debe analizarse su impacto sobre el código, incorporarlo al flujo de trabajo, y asociarlo con versiones de código y componentes que contengan las modificaciones solicitadas.

**Auditoría y reportes**  
Debe ser posible reconstruir la información sobre la historia de cambios, ya sea a nivel de producto o de código fuente, y poder generar reportes al respecto, que sean capaces de responder preguntas como:
- ¿qué desarrolladores contribuyeron a la generación de una determinada versión de un componente?
- ¿qué componentes estaban desplegados en un ambiente en una determinada fecha, y qué versión de cada uno?
- ¿cuál es la historia de versiones de un componente?
- ¿en qué versiones de qué componentes se incorporó la resolución de un defecto?



## Herramientas
Para organizar los items y el proceso definido sobre los mismos, hacen falta herramientas.

Seguro hay un repo de código, que resuelve la identificación, organización, y manejo de cambios del código fuente, permitiendo auditar los cambios y ayudando a resolver eventuales conflictos por cambios concurrentes.

Históricamente, el control de versiones, y el manejo de los otros items, se maneja utilizando otras herramientas.
Actualmente, existe una fuerte tendencia a integrar todas las responsabilidades de SCM en los repos de código, tal vez + plugins.


## Apéndice - nota de actualidad
Destacamos que en muchos proyectos de desarrollo, el hecho de haber incorporado prácticas y herramientas de SCM que provienen del ámbito del desarrollo colaborativo, permitió mitigar en una buena medida, el impacto de la pandemia provocada por la COVID-19.