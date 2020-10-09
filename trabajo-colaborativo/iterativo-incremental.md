---
layout: default
---

# Desarrollo iterativo e incremental
En distintas secciones de este curso, presentamos ideas y conceptos que se contraponen a la idea clásica de _desarrollo en cascada_, o por fases, en la que un producto de software emerge como resultado de una serie de tareas (análisis inicial, definición de requerimientos, diseño de alto nivel, implementación, test, entre otras) que se ejecutan en una secuencia estricta.

Al describirse la idea de [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida), mencionamos la conveniencia de organizar un proyecto de desarrollo en _ciclos cortos_, que idealmente pudieran medirse en semanas. Se mencionaron como motivaciones: mantener un mayor control del desarrollo previniendo los riesgos adecuadamente, y potenciar la capacidad de obtener feedback de clientes o usuarios que apunten a elevar la calidad del producto, señalando en forma temprana ajustes a realizar y defectos a ser corregidos. 

Estas ideas fueron reforzadas al presentar los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil), agregándose varios elementos relacionados.  
Uno es el carácter ilusorio de la pretensión de que los requerimientos de un proyecto de desarrollo de software puedan preverse completamente al principio del proyecto, y que permanezcan inalterados durante el mismo.  
También se mencionó la conveniencia de realizar varios ciclos o _iteraciones_ en el desarrollo de cada componente, a fin de aprovechar las enseñanzas obtenidas en cada ciclo para concebir e implementar mejoras en los sucesivos.  
Finalmente, se señaló el énfasis en entregar valor mediante el software construido, en buscar la satisfacción de clientes y usuarios, y en generar productos de calidad, más que en el cumplimiento de planes elaborados con alto grado de precisión.

Ya en la unidad 7, describimos el concepto de [entrega continua](../ci-cd/entrega-continua), mediante el cual se obtiene una enorme agilidad en la generación y despliegue de productos, en la forma de _builds_ de generación periódica.
Cada build incluye un volumen acotado de agregados, mejoras y/o corrección de defectos, que puede someterse a revisión inmediata por parte de usuarios y/o clientes.
Esta dinámica alienta el surgimiento de nuevas ideas o indicaciones, que pueden repercutir rápidamente en el ciclo de desarrollo.

A su vez, una parte importante del material de las unidades 4 a 7, está abocada a conceptos y aspectos que deben considerarse para poder llegar a un esquema de desarrollo que facilite la generación y despliegue frecuente de productos entregables: testing, SCM, entornos, integración, etc..

En esta sección completaremos el panorama recién presentado, puntualizando algunos aspectos de la estrategia de _desarrollo iterativo e incremental_, que es la propuesta más difundida actualmente en la industria del software.
A continuación, presentaremos brevemente el marco de trabajo _Scrum_, que es una de las propuestas para implementar esta estrategia más influyentes en la actualidad, en particular a raíz de su propuesta de organizar el desarrollo mediante _sprints_.


## Iterativo, incremental, su combinación
Las ideas de _desarrollo iterativo_ y _desarrollo incremental_ se combinan en la estrategia que permite un estilo dinámico, que alienta la interacción frecuente con clientes y usuarios.  
Tal vez, estos conceptos puedan describirse en forma más sencilla, si se presentan en el orden inverso al que sugiere el nombre de la estrategia. 

La idea de _desarrollo incremental_ se refiere a que un producto puede organizarse, para su construcción, en distintas partes, los llamados _incrementos_. 
Cada incremento agrega funcionalidad, que puede estar basada en la funcionalidad incluida en incrementos anteriores.

(acá puede ir una imagen que dé la idea de "incremental")  
![acá puede ir una imagen que dé la idea de "incremental", a mí me gustó esta](./images/incremental-development.jpg)

Por su parte, el concepto de _desarrollo iterativo_ significa que el desarrollo de un producto, e incluso de incremento definido para el mismo, puede distribuirse en varios ciclos o _iteraciones_. 
Cada iteración concluye con la generación de una versión preliminar del producto o incremento.  
Cada versión preliminar puede, o bien abarcar sólo parte de la funcionalidad, o bien incluir la estructura en forma completa, quedando pendientes aspectos como validaciones, relación con otras operaciones, consideración de ciertos casos o escenarios menos probables, registro de parte de la información que debe generarse, detalles de estilo o presentación gráfica, entre otros. Cada iteración sucesiva concluye con la entrega de una versión con mayor grado de avance.

(acá puede ir una imagen que dé la idea de "iterativo")  
![acá va una imagen que dé la idea de "iterativo", a mí me gustó esta](./images/iterative-development.jpg)

La combinación de estas dos ideas genera la estrategia de _desarrollo iterativo e incremental_, que cuenta actualmente con una enorme aceptación en la industria del software.  
Esta estrategia permite presentar, periódicamente y desde una etapa temprana en el desarrollo, productos que pueden ser probados y evaluados por clientes y usuarios.
De esta forma, se alienta el feedback o retroalimentación que mantiene al **confianza en el producto que se está construyendo**, tanto por parte del comitente como del mismo equipo de desarrollo.  
Otra ventaja de esta estrategia es que contribuye a percibir rápidamente **distintas fuentes de riesgo**, que pueden estar originados en una falta de comprensión de las necesidades del cliente, como de cuestiones ligadas a la interfaz (p.ej. que el flujo de navegación requerido para una operación que se realiza muy frecuentemente es demasiado engorroso, que se consideraron pantallas más grandes o con mayor resolución de aquellas en donde se va a visualizar la aplicación, etc.) o a cuestiones de seguridad, performance o carga (p.ej. la existencia de un cuello de botella de performance por la generación simultánea de varios reportes complejos, o la necesidad de distinguir entre operaciones que requieren distinto tipo de credenciales).

Queda claro que un factor clave en el éxito de la implementación de esta estrategia, es la **selección adecuada del alcance de cada iteración**, que aumente la chance de descubrir riesgos relevantes en etapas tempranas del desarrollo, y en la que cada iteración entregue valor adicional que usuarios y clientes puedan percibir.


### Un ejemplo esquemático
Supongamos un proyecto cuyo objetivo es la generación de visualizaciones sobre una cartera de clientes, y más precisamente, obtener información sobre aquellos clientes cuyo grado de morosidad merece atención.

La siguiente es una posible definición de las cuatro primeras iteraciones en el desarrollo del producto. Notamos que en la iteración 3, se incorpora un segundo incremento al producto generado a fin de la iteración, lo que muestra el carácter simultáneamente iterativo e incremental de esta planificación.

**Iteración 1**  
Implementación de una primer versión de una consulta que muestra los clientes considerados morosos, de acuerdo a un criterio sencillo, p.ej., que tengan alguna deuda pendiente con más de 30 días de atraso.

**Iteración 2**  
Definición e implementación de un criterio más sofisticado, a partir de la experiencia de los usuarios con la primer versión y el análisis de casos concretos. Agregado de paginación en la consulta implementada.

**Iteración 3**  
Agregado de una interfaz adicional, que muestra el detalle de operaciones y pagos de un determinado cliente; esto constituye un segundo incremento. Mejora de la presentación gráfica: definición de paleta de colores, organización de la pantalla.

**Iteración 4**  
Agregado de una búsqueda de cliente por nombre o por ubicación geográfica. Ejecución de una prueba de carga con una versión anonimizada de la base de producción.


## Organización en sprints, marco de trabajo Scrum
Actualmente, [Scrum](https://www.scrumguides.org/) es uno de los marco de trabajo más influyentes en la industria, ya sea que se lo utilice al pie de la letra o que se apliquen sólo algunas de sus propuestas. 
En particular, la idea de organizar el desarrollo en **sprints** cuenta con una gran difusión.

(acá puede ir una imagen sobre Scrum)  
![imagen sobre Scrum](../images/logoelevate.jpg)

Varios de los objetivos de Scrum están en línea con lo expresado en este material, entre ellos mencionamos los siguientes.
- Permitir un manejo apropiado de riesgos: los riesgos que se detectan en un sprint son documentados al finalizar el mismo, y se tienen en cuenta para la planificación de los sprints sucesivos.
- Poner el foco en la generación de valor para clientes y usuarios, favoreciendo el feedback a partir de los productos generados en cada sprint, y definiendo un rol específico dentro del equipo de trabajo (el _product owner_) que tiene como objetivos la elucidación, priorización y explicación de necesidades y requerimientos.
- Contar con resultados desde etapas tempranas, para mantener la confianza y el norte en el equipo de desarrollo.
- Favorecer la interacción entre miembros del equipo.


### Product Owner, backlog de proyecto
Scrum define sólo tres roles específicos: a un equipo de desarrollo al que se considera con un alto grado de auto-organización, se le suman las figuras de _Product Owner_ y _Scrum Master_. En particular, el rol del segundo es clave para asegurar que se cumplan los objetivos del proyecto.

El rol del Product Owner es garantizar que el producto que se genere cumpla con las necesidades para las que fue concebido, a tal efecto mantiene una relación cercana con clientes y usuarios.  
Una de sus responsabilidades es mantener el _backlog de proyecto_, que contiene todas las tareas que son necesarias para obtener un producto de las características deseadas.
Debe establecerse una organización de este backlog de acuerdo a _prioridades_, que destaque las tareas que resultan más relevantes o que conviene realizar a la brevedad, por cuestiones relacionadas con posibles riesgos, o por la importancia de que clientes o usuarios puedan experimentar una cierta funcionalidad para avanzar con la marcha del proyecto.


### Organización en sprints
Como ya mencionamos, una de las características salientes de Scrum es que propone una organización del desarrollo en unidades a las que llama _sprints_.  
Un sprint es un período determinado de tiempo, de entre una y cuatro semanas. 
Tanto al principio como al final de cada sprint, y también a lo largo del mismo, se realizan eventos con características bien definidas.

_Al principio_ de este período se realiza una reunión llamada _spring planning_, en la que participa todo el equipo de desarrollo, al que se suma el product owner. 
En esta reunión se define el alcance del sprint, seleccionando ítems del backlog, que se analizan de acuerdo a las prioridades establecidas por el product owner. Los ítems seleccionados configuran los objetivos del sprint.  
Se estiman y organizan las tareas de desarrollo necesarias para cumplir con los objetivos definidos, generándose un _backlog de sprint_ que guiará el trabajo durante el período abarcado por el mismo.

_Durante el sprint_, se realiza diariamente una pequeña reunión diaria, la llamada _daily meeting_ o simplemente "la daily".
El propósito de esta reunión es que cada integrante del equipo de desarrollo describa muy brevemente el trabajo realizado en la jornada anterior. En particular, debe mencionar las eventuales trabas que impidan o dificulten el trabajo, y señalar los riesgos potenciales que pudiere haber detectado.   
Esta práctica facilita la interacción y ayuda mutua entre miembros del equipo. Se alienta a que a continuación de la daily meeting, se realicen reuniones entre algunos integrantes para analizar los problemas que se hayan descripto en la misma.

Cada sprint debe _concluir_ con la generación de entregables, que incluyan las funcionalidades y mejoras previstas en la planificación. 
Estas se presentan en una reunión de cierre llamada _sprint review_, en la que participan el equipo de desarrollo al completo, el product owner, y eventualmente también representantes de clientes y/o usuarios.
En estas reuniones, también pueden presentarse cuestiones técnicas que hayan sido relevantes para la resolución de las tareas realizadas durante el sprint, lo que contribuye al debate de ideas en el equipo de desarrollo, y al enriquecimiento de cada integrante.  
Al final de cada sprint también se realiza la llamada _reunión retrospectiva_, en la que se analizan los eventuales desvíos entre los objetivos planteados al planificar el sprint, y los efectivamente alcanzados durante el mismo, con el fin de generar planificaciones más certeras para los sprints sucesivos, y relevar eventuales riesgos que pudieran afectar la marcha del proyecto.
