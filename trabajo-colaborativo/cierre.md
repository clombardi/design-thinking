---
layout: default
---

# Conclusiones y cierre
Con esta sección, llegamos al final del curso al que dimos en llamar "Desde Ops a Devops".  
En este material revisamos varios de los conceptos, prácticas y herramientas ligadas al rol de desarrollador, comenzando con algunas más cercanas a las tareas de codificación como [conceptos de programación y algoritmia](../logica-algoritmica/logica-algoritmica.index) o [patrones de diseño](../abstracciones-patrones/abstracciones-patrones.index), y focalizando luego en aquellas vás vinculadas a las que clásicamente se considera el ámbito de operaciones, como [SCM](../scm-git/scm-intro), [gestión de versiones](../scm-git/gestion-de-versiones), [integración](../scm-git/integracion) y [gestión de dependencias](../ci-cd/gestion-dependencias).  


## Un cambio de enfoque
Varias de las temáticas incluidas en este material adquirieron mayor relevancia, e incluso algunas surgieron, como reflejo de un **cambio de enfoque** en la forma de concebir y organizar proyectos de construcción de software, cuya influencia crece sostenidamente a partir de propuestas iniciales que aparecieron a principios de este siglo 21.  
Así, conceptos como [sprint](./iterativo-incremental) o [testing unitario](../testing/testing-software/testing-unitario) se han incorporado al vocabulario y a las prácticas del sector, incluso en mayor medida que las propuestas que los originaron (para los ejemplos mencionados, Scrum y Extreme Programming respectivamente).

### Dos motivaciones
Este _cambio de enfoque_ se motiva en dos factores que se observan en la evolución de las aplicaciones informáticas, y que hemos mencionado en este material repetidas veces.  

Uno es su creciente **complejidad**: se espera que la industria del software elabore productos que puedan utilizarse en distintos canales de acceso masivo (browsers en computadoras, tablets o celulares, y posiblemente otros) con miles de usuarios concurrentes, que funcionen 24/7 reflejando información actualizada en forma inmediata a partir del registro de cada transacción, que manejen volúmenes crecientes de información, y que contemplen la aplicación de técnicas de análisis masivos de datos para alimentar la llamada _Business Intelligence_, además de la gestión de operaciones.  

El segundo factor que motiva el cambio en las prácticas de construcción de software, es que se asume un escenario de **cambio constante** respecto de los requerimientos.
La experiencia acumulada en cientos de proyectos muestra que la intención de llevar a cabo una definición detallada de un producto de software antes de comenzar con su desarrollo, resulta inviable por dos razones: la inevitabilidad de que surjan nuevos requerimientos que modifiquen las definiciones y/o agreguen nuevas funcionalidades, por una multitud de razones que describimos brevemente al presentar el concepto de [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida); y la imposibilidad práctica de realizar un análisis detallado de todos los escenarios posibles para una funcionalidad compleja.

### Dos consecuencias
Entre las múltiples _consecuencias_ de este nuevo enfoque, destacamos dos aspectos que impactan en el ámbito de operaciones.

Uno de ellos es la tendencia a la **integración**.
Un esquema de [desarrollo iterativo e incremental](./iterativo-incremental) conlleva la ejecución de despliegues en forma frecuente, lo que implica la necesidad de integrar el código generado por varias desarrolladoras, y probablemente también de integrar varios componentes que se despliegan por separado pero conforman un producto único. Los conceptos de [integración y despliegue continuos](../ci-cd/ci-cd.index) acentúan esta orientación.

El otro aspecto que queremos destacar es la tendencia a la **automatización** de tareas, en particular de varias ligadas al ámbito de operaciones.
Este fenómeno está _motivado_ por la mayor asiduidad con que deben realizarse estas tareas, por las razones recién mencionadas a las que se suma la necesidad de generar múltiples [entornos](../scm-git/entornos) de desarrollo y de test; y al mismo tiempo _facilitado_ por la aparición de herramientas que permiten automatizar tareas de gestión de entornos a partir de definiciones que se plasman en archivos de texto, como Docker o Kubernetes, y por el uso extendido de entornos Cloud.

A su vez, la frecuencia en que se realizan actividades de integración y su tendencia a la automatización de tareas de operaciones, provocan un _segundo sentido de integración_: la que debe darse entre los distintos roles que contribuyen a un proyecto de construcción de software.  
Es en este sentido que surge la idea _DevOps_, que parte de constatar el requerimiento creciente de tareas de operaciones por parte de las desarrolladoras, la utilización también creciente de técnicas asociadas al ámbito de desarrollo en el trabajo de operaciones, y la necesidad de mantener alineados ambos ámbitos para asegurar el éxito de un proyecto.  
Más recientemente surgió la propuesta de sumar al ámbito de seguridad a esta visión, generándose el llamado [DevSecOps](./dev-sec-ops) al que nos referimos anteriormente en esta unidad.

## Un cambio en las participantes
La participación como integrantes de un equipo de proyecto requiere la revisión de varias de nuestras actitudes y prácticas, para que nuestra contribución sea valiosa en este nuevo escenario.

Primeramente, debemos elevar nuestra percepción y conocimiento acerca del proyecto al que contribuimos, involucrándonos con sus objetivos, formas de trabajo e incluso su dominio de aplicación, en consonancia qon lo que expresamos al describir las diferencias, respecto de los roles de desarrollo, entre [una visión acotada de programador y otra, más amplia, de desarrollador](../programacion-a-desarrollo/programar-y-desarrollar).  

A partir de esta visión más amplia, se espera de quienes participan de un equipo de proyecto una actitud favorable al _trabajo en conjunto_ entre distintos roles, que implica la disposición de cada integrante a compartir y difundir sus conocimientos y habilidades con sus colegas, de adquirir prácticas y herramientas que se asocian usualmente a otros roles, y de evitar una separación rígida de tareas entre distintos ámbitos.  
De esta forma, contribuiremos a la conformación de equipos que puedan responder ágilmente ante la necesidad de resolver defectos o realizar modificaciones sobre lo ya construido, y se impedirá la aparición de "silos" de conocimiento o de prácticas de trabajo, de acuerdo a lo descripto al tratar las [relaciones entre Desarrollo y Operaciones](./desarrollo-operaciones-conflicto).


## DevOps - oportunidad ... y necesidad
Como consecuencia de lo expresado en esta sección, y un poco como resumen general de este material, señalamos que una visión DevOps representa un activo valioso para el profesional de Operaciones, en el escenario actual de la industria.

Como lo mencionamos a lo largo de este material, incorporar técnicas y herramientas propios del desarrollo, puede proporcionar ventajas apreciables para el trabajo en Operaciones.
En particular, mencionemos que 
1. adquirir habilidades de programación y desarrollo permite generar scripts más potentes, y que puedan adaptarse más fácilmente a cambios que ocurran durante el tiempo de vida de un proyecto.
1. un manejo adecuado de repositorios de código, y en particular de Git, facilitará tanto la gestión del código fuente de los proyectos en los que nos toque participar, como la de los archivos que resulten necesarios para generar y gestionar entornos y despliegues.
1. la combinación de estas dos habilidades nos acercará a los conocimientos necesarios para adaptarnos a escenarios de integración continua, que involucran muchas veces acciones lanzadas a partir de un evento asociado a un repositorio, y que pueden requerir de pequeñas secciones de código para su configuración.

De una relevancia al menos similar resulta la _orientación al trabajo en equipo_ que comentamos más arriba, que está en línea en particular con la idea de [Collective Code Ownership](./collective-code-ownership), y en general con la tendencia a conformar equipos integrados y enfocados en el producto.

Para concluir, subrayamos que este nuevo escenario en la producción de software, que en particular favorece la visión _DevOps_, es una tendencia que sigue creciendo y a la que resultará conveniente (si no necesario) sumarse, tal vez más temprano que tarde.


## ¡¡Hasta la próxima!!
Esperando que este material les resulte de utilidad en sus próximos desafíos, nos despedimos deseándoles el mayor de los éxitos en su desempeño profesional.
