---
layout: default
---

# Introducción: ¿cómo evitar una salida a producción traumática?

Como lo señalamos al introducir la idea de [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida) en la Unidad 1, en una perspectiva tradicional de producción de software, se distinguen fases separadas de "programación" y de "pasaje a operaciones".  
Esta última fase consta, básicamente, de dos procesos.
1. La generación de los productos desplegables a partir del código fuente.  
Este proceso involucra la **integración** de partes desarrolladas por separado por distintas personas o equipos, al menos en proyectos en los que participan varios, o muchos, desarrolladores (digamos, más de los que pueden contarse con los dedos de una mano); tarea descripta en [una página dedicada a este tema](../scm-git/integracion) en la Unidad 5.
1. El **despliegue** de los productos generados, en ambientes productivos.  
Típicamente, este proceso requiere de tareas de configuración del ambiente y/o de los desplegables, y probablemente también revisar cuestiones ligadas a la conectividad necesaria para interactuar con otras aplicaciones o para el acceso de usuarios.


## Los riesgos del enfoque "de única vez" 
La visión en la que el "pasaje a operaciones" se ejecuta una única vez, o eventualmente ante la generación de cada nueva _versión_ del producto, evento que ocurre a intervalos que se miden en meses o incluso años, resulta _incompatible_ con las necesidades de una proporción creciente de los proyectos de desarrollo actuales, por distintas razones que fuimos describiendo en secciones anteriores.  
En particular, destacamos las motivaciones para el cambio frecuente en los requerimientos de un proyecto mencionados al describir los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil), y la necesidad de reaccionar rápidamente al feedback que proporcionan los usuarios, y los comitentes, de un producto de software.

Por otra parte, las tareas de integración y despliegue están sujetas a varios factores relevantes de riesgo, entre los que destacamos los siguientes.
- Fallas en los procesos sobre el código fuente necesarios para generar los desplegables: compilación, composición, empaquetado, etc..   
- Dificultades para reunir el código fuente que debe formar parte de la versión a desplegar, por fallas graves en los procesos de SCM.
- Incompatibilidades entre las piezas de software (funciones, módulos, servicios, etc.) construidas por separado, que deben funcionar en conjunto en el producto a desplegar.
- Falta de archivos que deben acompañar a los desplegables generados en un ambiente productivo: archivos de configuración, imágenes, etc..
- Fallas en la conexión con otras aplicaciones, que aparecen al montar el producto en el ambiente productivo.
- Necesidad de ejecutar una gran cantidad de [tests de regresión](../testing/testing-software/regresion), que pueden involucrar un volumen considerable de trabajo manual; y con el riesgo de tener que _repetir_ el trabajo si surgen problemas graves durante la integración.

Estos factores han sido responsables, en muchas ocasiones, de retrasos importantes en la salida a producción de productos de software, como señalamos [al introducir el ámbito de SCM](../scm-git/scm-intro) en la Unidad 5.  


## Convertir la integración en un paso más
Para mitigar los riesgos recién mencionados, y elevar el valor del software producido, debemos evolucionar hacia formas de trabajo en las que la integración y el despliegue **pierdan su carácter excepcional**, transformándose en parte de las prácticas y procesos _habituales_ en el desarrollo.
Así, se podrá realizar el despliegue de nuevas versiones con mayor frecuencia, sin por ello perder calidad o control de los procesos.

Para lograr este objetivo, es necesario alinear varios aspectos del desarrollo, entre los que destacamos:
- Organizar el desarrollo en _tareas cortas_, evitando la definición de tareas individuales que lleven más de unos pocos días-hombre, y dividiendo las que resulten demasiado gravosas.  
De esta forma, se evita la generación de [ramas](../git-branch/git-branch-merge) de código que se alejen demasiado del tronco principal del desarrollo, y se alienta el agregado de valor y funcionalidad en forma continua, de acuerdo a la idea de desarrollo evolutivo.
- Contar con un buen nivel de [SCM](../scm-git/scm-intro), que permita obtener el conjunto de código fuente y otros archivos necesarios para generar cada entregable, en forma automatizada.
- Elevar el nivel de automatización de las tareas de [testing](../testing/sistematizacion/tipos-documentacion), en particular de los [tests de regresión](../testing/testing-software/regresion) y los de integración.
- Contar con definiciones de [arquitectura de software](../programacion-a-desarrollo/arquitectura-de-software) sólida, que estandarice y simplifique la integración entre componentes.
- Entrando específicamente en el terreno de operaciones, elevar el nivel de automatización en la generación de desplegables, y también el de gestión de [entornos](../scm-git/entornos).

Mencionamos algunas de las ventajas que aporta este enfoque, relacionadas con las problemáticas descriptas al principio.
- La ejecución frecuente de los procesos de generación de desplegables, permite ir mejorándolos en forma paulatina, evitando los problemas habitualmente relacionados con esta tarea.
- El hecho de realizar con mayor asiduidad la integración entre componentes, acota el volumen de problemas de incompatibilidad que deben tratarse en cada oportunidad.
- La generación frecuente de actualizaciones, implica que disminuye la cantidad de código nuevo, y por lo tanto el riesgo de problemas imprevistos, en cada versión.
- El contar con un alto grado de automatización de los tests, permite agilizar su ejecución, y repetirla con la frecuencia que requiera un ciclo de desarrollo y despliegue ágil.


## Integración continua
Un horizonte posible en esta evolución es la llamada **integración continua** (_Continuous Integration / CI_), concepto según el cual la generación de desplegables, e idealmente su despliegue en un entorno de test, ocurre _automáticamente_.  
Una posibilidad es que el proceso se realice a intervalos regulares, idealmente una vez al día.
Otra variante es que la integración se lance a partir de un evento relacionado con el repositorio de código, que puede ser: la aceptación de un [pull request](../git-branch/pull-requests), el agregado de un commit en una rama determinada de acuerdo a la [estrategia de branching](../git-branch/estrategias-branching) elegida para el proyecto, o la definición de un nuevo _tag_ o _release_.

En cualquier caso, se activa una serie de tareas de empaquetado y despliegue que se ejecutan en forma automatizada, lanzando alarmas si se detectan fallas en el proceso.

Idealmente, luego del despliegue en un entorno de test previamente definidio y configurado, pueden ejecutarse ciertas baterías de tests, y/o realizarse tareas de análisis estático de código para buscar posibles defectos o puntos débiles.



## Siguiente nivel: entrega continua
El concepto de **entrega continua** (_Continuous Delivery / CD_) representa un paso adicional en el camino de incorporar las tareas de integración y despliegue dentro de un ciclo iterativo de producción de software. 
Fue formulado originalmente en el libro [Continuous Delivery](https://www.amazon.com/dp/0321601912) de 2010, cuyos autores son Jez Humble y David Farley.  

En concreto, este concepto propone realizar todos los cambios y ajustes en el funcionamiento de un proyecto de construcción de software, que resulten necesarios para poder realizar entregas _que lleguen a los usuarios finales_ como resultado de un proceso rutinario que se ejecuta con alta frecuencia, idealmente en forma diaria.  
De acuerdo con esta idea, la evolución de un producto se refleja en una secuencia de _builds_ con la incorporación de pequeños cambios en cada uno. De acuerdo a las características de cada proyecto, el concepto de build complementa o reemplaza al más tradicional de _versión_.

Para lograr estos objetivos, se propone una serie de principios, que resumen varias de las ideas que fueron comentadas en distintos pasajes de este material. Describimos brevemente los principios más destacados.

**Incorporar la calidad como parte del proceso**  
Esto implica en particular contar con baterías extensas de tests automáticos, procesos que ejecutan estos tests en forma rutinaria incluyendo la gestión de los entornos necesrios.  
Además, se sugiere que ante cada defecto detectado mediante testing exploratorio manual, además de proceder a su corrección, se revise y se amplíe la capacidad de testing automático para que detecte defectos similares.  
El esfuerzo de creación y gestión de las baterías de test se justifica en la seguridad que agrega para el despliegue rutinario de nuevas versiones, y por el análisis que muestra que el costo de la [gestión de defectos](../testing/sistematizacion/bug-tracking) aumenta exponencialmente cuanto más tiempo pasa entre la introducción de un defecto y su detección.

**Trabajar en ciclos cortos, pasar rápidamente a producción**  
Se insiste en definir tareas de corta duración, de acuerdo a lo expresado anteriormente. 
Adicionalmente, se propone reducir el tiempo entre que el desarrollo/programación asociado a una tarea se concluye, y que los cambios forman parte de una versión productiva. De esta forma, se espera agilizar la entrega de valor a los usuarios, y obtener rápidamente feedback que permita mejorar el producto.  
En la visión de la entrega continua, _una tarea se considera concluida únicamente cuando está operativa en un entorno productivo_.

**Automatizar todo lo posible**  
Para lograr un entorno de entrega continua sostenible en el tiempo, debe reducirse al máximo la carga de tareas manuales repetitivas, y buscar continuamente nuevas oportunidades para la automatización, de acuerdo a la idea de _mejora continua_.  
Aquí es donde entra de lleno la idea de gestionar tareas tradicionalmente asociadas a operaciones con una lógica similar a la del desarrollo, o sea el enfoque _DevOps_.

**Considerar a todos los integrantes de un equipo como responsables del producto**  
Con este principio, se apunta a fomentar la colaboración y la asistencia mutua entre las personas que cumplen [distintas tareas o roles](../programacion-a-desarrollo/construccion-tareas-roles) en un proyecto de desarrollo, en lugar de considerarlas "silos" separados.  
Los autores proponen revisar las políticas de premios en una organización, para verificar que las conductas premiadas sean las que efectivamente mejoren el rendimiento del equipo de proyecto _tomado en conjunto_.

**Tener todo bajo control de versiones**  
Con este principio, se destaca la necesidad de que todos los archivos que intervienen en la generación y despliegue de entregables, y no sólo el código fuente, estén en repositorios de código administrados de acuerdo a una sólida [gestión de versiones](../scm-git/gestion-de-versiones).  
En particular, se incluye en este concepto a los archivos de configuración que deban incluirse en los entornos productivos.


### Pipeline
Para facilitar el entendimiento del proceso, Humble y Farley utilizaron el concepto de **pipeline** o _tubería_.
A partir del agregado de un commit o tag, o de la aceptación de un Pull Request, se dispara una secuencia de acciones que configuran la tubería que atraviesa el código hasta llegar al entorno productivo. Entre estas acciones encontramos: 
- la generación de un nuevo build, 
- su despliegue en distintos entornos; se dice que el build va "promoviendo" a distintos entornos, progresivamente más "cercanos" al productivo que constituye el fin de la tubería.
- la ejecución de baterías crecientemente completas de tests, desde smoke tests hasta tests completos de performance, integración y regresión.
- el _análisis estático de código_, que complementa los tests buscando posibles fuentes de defectos o puntos débiles en el código fuente.

Si en algún estadío de esta tubería se encuentra un problema, se genera una devolución que explica el motivo del fallo, permitiendo así abordarlo rápidamente. Una vez corregido, se vuelve a activar esta "tubería" que intentará "promover" los cambios en el código hacia el ambiente de producción.

 
### Entrega continua según el modo de uso del software
Para cumplir con la idea de entrega continua, además de generar y verificar los sucesivos _builds_ o versiones, deben garantizarse que los mismos lleguen efectivamente a los usuarios finales en forma regular.

El cumplimiento de este requisito resulta más sencillo para aplicaciones cuya instalación corre por cuenta de una organización encargada de su gestión, en lugar de tener que ser instaladas por cada usuaria.  
Este es, en particular, el caso de las **aplicaciones Web**, a las que se accede mediante un navegador Internet.
El enfoque de entrega continua resulta, por lo tanto, especialmente adecuado para este tipo de aplicaciones, que cada vez cubren un espectro mayor de funcionalidades, y cuya popularidad se encuentra en franco ascenso.

Adicionalmente, mencionamos que la enorme difusión de las conexiones hogareñas a Internet, permite que aplicaciones instaladas en cada equipo, cuenten con mecanismos de actualización automática. 
Esto posibilita que el concepto de entrega continua se pueda aplicar también en este tipo de productos.



## La propuesta de esta unidad
En el resto de esta unidad, describiremos y destacaremos varios de los elementos que deben estar presentes en la gestión de un proyecto de software, para poder trabajar de acuerdo a las propuestas de CI / CD.  
Dicho de otra forma, brindaremos los elementos necesarios para armar el _pipeline_ descripto anteriormente, llegando a suerte de "receta para CI / CD". 


## Anexo - el software y otras industrias - pequeña digresión
Como señalamos al principio, la idea tradicional sobre cómo organizar la producción de software, propone la construcción por separado de partes  definidas en un proceso previo de diseño; y la posterior integración de estas partes en el producto final.

Subyace a esta idea, la intención de trazar un _paralelismo_ entre la industria del software y otras ramas industriales, en cuales efectivamente, una fase inicial de diseño y planificación es seguida por la producción por separado (y muchas veces, en unidades de producción distintas) de distintas piezas, y finalmente por el ensamblado y puesta a punto del producto.

Este planteo apunta, en principio, a la _producción en serie_.  
Muchas veces, el proceso de producción es precedido por un proceso previo y distinto, de generación y testeo de prototipos, con el fin de garantizar la adecuación del bien a producir a las necesidades u objetivos para los que fue concebido, y para evitar sorpresas desagradables al lanzar la producción.  
También existen procesos cuyo objetivo es generar _un único producto_, tomemos como ejemplo la construcción de un puente en un determinado lugar. 
En estos casos, se producen distintos planos y maquetas para poder visualizar el producto a construir, se realizan estudios para comprobar su adecuación, p.ej. pruebas de resistencia de materiales en el caso de un puente, y también se hace una planificación detallada de materiales y costos. Estos procesos previos, que pueden resultar muy costosos, se justifican porque la modificación del producto luego de construido, o bien es sencillamente imposible, o bien involucra costos prohibitvos.  
Tal vez más importante, se considera que al comenzar la producción, los _requerimientos_ del bien a producir, están definidos al menos en gran medida. Muchas veces, existen etapas previas de estudios cuyo único objetivo es afinar la definición de requerimientos: investigaciones de mercado para productos en serie, estudios de tránsito en una zona geográfica, y también estudios de suelo, en el ejemplo del puente.  
Finalmente, en productos únicos, o bien de precio unitario considerable, se supone una vida útil en la cual sólo se espera realizar mantenimientos, pero no agregados o modificaciones en la funcionalidad.

Varias particularidades de la producción de software la alejan de estos modelos.
- Aunque pueden construirse maquetas o prototipos para testear cuestiones de interfaz o experiencia de usuario (UI/UX), y también _pruebas de concepto_ sobre tecnologías o procesos en los que se detectan riesgos o necesidades importantes; en general construir un prototipo que brinde una medida real de la funcionalidad de un producto de software, no es sustancialmente más económico que construir una primer versión a partir de la cual evolucionar.
- La experiencia ha mostrado que, al mismo tiempo que no puede construirse un producto de software sin contar con requerimientos, resulta prácticamente imposible completar la definición de requerimiento sin contar con versiones parciales del software. El desarrollo evolutivo viene a resolver esta situación de necesidad mutua.
- Por una multitud de razones que ya hemos descripto, un escenario en el cual los requerimientos sobre un producto permanecen estables durante un período considerable de tiempo, resulta sencillamente ilusorio.

Como conclusión, notamos que **deben** encontrarse modelos para la producción de software que sean _sustancialmente distintos_ de los utilizados para la producción de otros tipos de bienes.


