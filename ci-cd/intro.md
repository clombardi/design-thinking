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

La visión en la que este proceso se ejecuta una única vez, o eventualmente ante la generación de cada nueva _versión_ del producto, evento que ocurre a intervalos que se miden en meses o incluso años, resulta _incompatible_ con las necesidades de una proporción creciente de los proyectos de desarrollo actuales, por distintas razones que fuimos describiendo en secciones anteriores.  
En particular, destacamos las motivaciones para el cambio frecuente en los requerimientos de un proyecto mencionados al describir los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil), y la necesidad de reaccionar rápidamente al feedback que proporcionan los usuarios, y los comitentes, de un producto de software.

Por otra parte, las tareas de integración y despliegue están sujetas a varios factores relevantes de riesgo, entre los que destacamos los siguientes.
- Dificultades en los procesos sobre el código fuente necesarios para generar los desplegables: compilación, composición, empaquetado, etc..   
- Dificultades para reunir el código fuente que debe formar parte de la versión a desplegar, por fallas graves en los procesos de SCM.
- Incompatibilidades entre las piezas de software (funciones, módulos, servicios, etc.) construidas por separado, que deben funcionar en conjunto en el producto a desplegar.
- Falta de archivos que deben acompañar a los desplegables generados en un ambiente productivo: archivos de configuración, imágenes, etc..
- Fallas en la conexión con otras aplicaciones, que aparecen al montar el producto en el ambiente productivo.
- Necesidad de ejecutar una gran cantidad de [tests de regresión](../testing/testing-software/regresion), que pueden involucrar un volumen considerable de trabajo manual; y con el riesgo de tener que _repetir_ el trabajo si surgen problemas graves durante la integración.

Estos factores han sido responsables, en muchas ocasiones, de retrasos importantes en la salida a producción de productos de software, como señalamos [al introducir el ámbito de SCM](../scm-git/scm-intro) en la Unidad 5.  


### El software y otras industrias - pequeña digresión
Como señalamos anteriormente, la idea tradicional sobre cómo organizar la producción de software, propone la construcción por separado de partes  definidas en un proceso previo de diseño; y la posterior integración de estas partes en el producto final.

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


## Convertir la integración en un paso más

> Si en vez de ser una etapa, la convertimos en un paso de nuestro trabajo diario, la integración,
como la conocíamos antes, desaparece y nos aseguramos que al finalizar el día siempre tendremos
en el repositorio la última versión del código integrado. Así dieron nacimiento a la práctica
conocida como Integración Continua. 

> Para poder integrar diariamente, nuestro trabajo tendría que poder completarse en un día o
menos. Por este motivo, deberíamos procurar que cada tarea a integrar sea pequeña, idealmente
que pueda resolverse en un día o menos. Si la tarea es más grande, sería bueno dividirla en
subtareas más pequeñas. 

>  cada vez
que alguien envía un cambio al repositorio (o cada cierto tiempo), se dispara la ejecución de un
proceso de integración que toma los cambios del SCV, y en un ambiente previamente definido y
configurado, construye la aplicación y ejecuta las pruebas. 


## Siguiente nivel: despliegue continuo

> Esta práctica, que llamaremos Entrega Continua (Continuous Delivery), debe aceitarse para
poder alinearla con el concepto del desarrollo ágil. Por eso, Jez Humble y David Farley 87
proponen ciertos principios que deben tenerse en cuenta a la hora de implementar un proceso de
entrega continua: 
• Debe ser repetible y confiable. 
• Debe automatizarse todo lo que sea posible. 
• Debe mantenerse todo bajo control de versiones. 
• Si algo genera estado de pánico en el proceso, moverlo hacia el inicio. 
• La calidad debe formar parte del proceso. 
• Que algo está completo significa que está en producción. 
• Todos los integrantes de un equipo son responsables del proceso de despliegue.

> A partir de estos principios, se desprenden consideraciones a tener en cuenta como, por ejemplo,
el significado de tener todo bajo control de versiones. Este punto implica ahora no sólo el código
fuente sino el conjunto: 
Código Fuente + Datos de Configuración + Datos del Ambiente + Datos del Programa 

> Para facilitar el entendimiento del proceso, Humble y Farley utilizaron el concepto de tubería
(pipeline) donde el software va avanzando a través de la misma desde su creación hasta que queda
productivo. Cada vez que hay un cambio se genera un build que avanza por la tubería intentando
superar las diferentes pruebas y chequeos. En caso de no poder pasarlas, se genera una devolución
que explica el motivo del fallo y permite al equipo saber qué cambiar. Una vez corregido el
problema, un nuevo build se genera y vuelve a intentar atravesar la tubería hacia el ambiente de
producción. 

## La propuesta de esta unidad

Brindaremos una especie de receta para lograr que un proyecto existente pueda ser trabajado con CI / CD. O sea, vamos a mostrar cómo armar el famoso pipeline.
