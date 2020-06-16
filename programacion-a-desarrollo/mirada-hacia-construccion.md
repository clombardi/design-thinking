# Una mirada hacia el desarrollo de software

¡Hola!

Si estás leyendo esto, seguramente tenés conocimientos y experiencia sobre lo que se llama _operaciones_, o sea, tareas de instalación y administración de infraestructura IT.

Varias de las tareas de operaciones IT están relacionadas con productos de software conocidos como _aplicaciones_ informáticas. Listemos algunas de estas tareas.
- Definir los equipos (físicos o virtuales) donde se van a desplegar: servidores individuales, granjas de servidores, recursos Cloud. 
- Asegurar la conectividad necesaria: proveer facilidades de networking, establecer firewalls u otros mecanismos de protección.
- Organizar cómo se va a llevar a cabo el despliegue de cada componente: multiplicidad de servidores, load balancing.
- Desplegar cada versión.
- Instalar recursos necesarios, como Bases de Datos o volúmenes para registros de logs.
- Monitorear el estado de las aplicaciones y recursos.
- Administrar y monitorear mecanismos de resguardo de la información.

<br/>

En esta unidad, vamos a echar una mirada sobre la _construcción_, o _desarrollo_, de estas aplicaciones: qué tareas son necesarias, qué roles están involucrados, cuál es la evolución de un producto de software y cómo se relaciona esto con las versiones que se despliegan, qué se conoce como _arquitectura de software_.

En particular, nos interesa echar luz sobre dos cuestiones.  
Una es qué son las (tan mentadas) _metodologías ágiles_, y que impacto concreto tienen en el desarrollo de software.  
La otra es por qué se habla de _desarrollador_ de software, y no de _programador_. Lo que hay que hacer para tener una app andando ¿no es programar? Veremos que es programar ... y bastante más, y por eso se busca una mirada un poco más general, esa es la _visión dev_.


## ¿Por qué nos interesa?
Antes de arrancar, hablemos un poco de _por qué_ tener esta mirada sobre el desarrollo de software, en qué nos nutre.  
Se podría pensar: que les programadores, o quienes sean, nos provean de las aplicaciones, desde operaciones las instalamos y mantenemos, y si vemos algún error les avisamos. Ustedes saben de lo suyo, nosotres de lo nuestro, y todes contentes.

Hay una cantidad de motivaciones por las que esta división rígida entre "desarrollo" y "operaciones", simplemente ya no puede existir.


### Desde desarrollo hacia operaciones

Algunas surgen de necesidades que vienen desde el desarrollo.

Las aplicaciones que construimos tienden a ser cada vez _más complejas_ en varios sentidos: más funcionalidad, mayor volumen de transacciones, requerimientos más sofisticados respecto de la experiencia de usuario y de la ubicuidad (que se pueda acceder desde una computadora, un celular, una tablet, próximamente reloj y heladera), a veces requerimientos más exigentes respecto de la performance.  
A su vez, los universos de usuarios crecen, lo que enfrenta a algunas aplicaciones a un _mayor nivel de stress_.  
Por su lado, el mayor volumen de operaciones puede _atentar contra la tolerancia a fallos_: buscar el dato erróneo en una miríada de operaciones se hace más complejo, muchas veces se pide/exige estar operativos 24x7.

Esta mayor complejidad provoca una mayor _necesidad de tareas de operaciones durante el desarrollo_.  
El equipo de trabajo se organiza en grupos, cada grupo necesita sus ambientes para ir volcando lo que va produciendo. También tenemos ambientes de integración. 
El _test_ toma cada vez más relevancia ... nos piden ambientes de test.  
En resumen, "desde desarrollo nos piden ambientes como si fueran caramelos". 

Otro factor a tener en cuenta es que, por muchas razones, los ciclos de desarrollo y de operaciones están cada vez más solapados, la visión "se construye / se instala / se mantiene" está dejando paso a una idea mucho más _continua_ de desarrollo de software, en la que la generación de nuevas versiones, agregados y ajustes tiende a ser rutinaria.

Finalmente, mencionemos que la dificultad de generar los productos entregables para aplicaciones con mucha funcionalidad, fue creciendo hasta convertirse en un factor crítico, que además, va en la dirección contraria de la idea de continuidad en el desarrollo que mencionamos recién.  
De ahí la tendencia a trabajar con _múltiples entregables_ que pueden tener mucho volumen de comunicación entre ellos ... más necesidad de un trabajo fino de configuración y despliegue.

Todas estas razones nos llevan a la conveniencia de tener una comprensión y una mirada, desde operaciones, sobre cómo se construye el software. Cada vez menos, alcanza con saber qué hacer con el producto de software terminado, estamos más y más involucrados en el proceso de producción.


### Desde operaciones hacia desarrollo

Todo lo expuesto hace _explotar la cantidad de tareas de operaciones_ necesarias, desde el principio del desarrollo y durante toda la vida útil de un producto de software. Varias de estas tareas tienen una naturaleza _repetitiva_: instalar muchos ambientes similares, desplegar distintas versiones del mismo (micro)servicio, o de servicios similares, etc..

Esta es una motivación importante para la tendencia actual hacia la _automatización_ de tareas de operaciones. En muchos escenarios la automatización, en lugar de habilitar la supresión del trabajo, es necesaria para que no se deshabilite el resto de la vida del trabajador IT.

Esta automatización se logra, en buena medida, con un cambio de óptica acerca de los scripts (y también archivos de configuración) que alivian el día a día del trabajo en operaciones.  
Estos scripts se van haciendo más complejos, evolucionan, involucran el uso de librerías, tenemos que tener bien en claro qué queremos que hagan, pueden tener distintas versiones y puede ser necesario reconstruir la versión activa en un determinado momento.  
Incluso empieza a tener sentido armar tests que verifiquen su funcionamiento, en particular ante cambios.  
O sea, algunos productos del trabajo en operaciones, van tomando características de un producto de software. Esto involucra aplicar conceptos de programación, pero también otros aspectos del desarrollo de software.

Este es el segundo punto de vista por el que resulta conveniente conocer más sobre desarrollo.
