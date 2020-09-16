# Introducción: ¿cómo evitar una salida a producción traumática?

> Hablar sobre el garrón que representa salir a producción cada 3 meses: el código no anda, hay nuevas configuraciones de las que nadie se dio cuenta, las pruebas de regresión no terminan nunca, etc.

> RECUPERAR LO QUE YA DIJIMOS DE INTEGRACIÓN:  
> Hasta no hace mucho tiempo, uno de los trabajos más complicados dentro del proceso de
desarrollo era la integración de un producto a partir del trabajo de uno o varios equipos. Muchos
proyectos encaraban esta etapa luego de trabajar semanas, meses y hasta años en sus módulos,
quizá queriendo copiar la manera en que se trabaja en otras industrias en donde es posible la
construcción de varios componentes por separado para luego dar paso a su ensamblado en un
producto final. 

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
