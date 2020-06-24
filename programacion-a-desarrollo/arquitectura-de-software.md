# Arquitectura de software

Alrededor de la figura del "arquitecto" (o arquitecta, claro) de software, se fue formando una imagen un poquito hasta legendaria, en el gremio IT, y un poco también fuera del mismo.  
Tal vez la escena del "arquitecto" en Matrix 2 haya ayudado al fortalecimiento de esta imagen en la cultura tech.

(y acá va la imagen)  
![y acá va la imagen](../images/logoelevate.jpg) 

Alrededor del campo de la _arquitectura de software_ rondan varios conceptos, que vamos a ir tratando de describir y organizar en lo que sigue.

Empecemos brindando ...

## Un rápido resumen
En todo proyecto de software deben tomarse ciertas decisiones sobre algunos temas que hacen a la _división, organización y comunicación entre componentes_ (backend y frontend, distintos "módulos").  
Existen también algunas cuestiones largamente independientes del dominio (o sea, de qué se trata la aplicación, si es bancaria, de retail, de gestión de personal, control de producción, y miles de etcéteras), dos ejemplos típicos son autenticación/autorización y logging.

(al párrafo que sigue le vendría bien una imagen que representara "decisión")  
![al párrafo que sigue le vendría bien una imagen que representara "decisión"](../images/logoelevate.jpg) 

A grandes rasgos, este es el dominio de la arquitectura de software.  
Estos aspectos, y la necesidad de tomar decisiones y adoptar criterios (o no hacerlo, a riesgo de los dolores de cabeza que se arriesgan en tal caso), aparecen en cualquier proyecto, independientemente de su tamaño.  
Es por esto que señalamos que **en todo proyecto hay arquitectura**. Lo que puede no haber son _arquitectos_, o sea personas que se dedican _específicamente_ a estas cuestiones.

Pasemos ahora a describir con algo más de detalle lo que acabamos de describir.


## Componentes: dimensión, organización, comunicación
En todo proyecto con cierta dimensión (ya a partir de la escala de años/hombre, que no es demasiado en la industria del software) se debe pensar en la división en componentes.  
Este fenómeno presenta varias aristas.

### Front y back 
(acá podría ir una imagen de temática "front y back")  
![acá podría ir una imagen de temática "front y back"](../images/logoelevate.jpg) 


Una temática que se repite en muchos proyectos es la relación entre "front" y "back".  
¿Queremos tener componentes separados de frontend y backend? 
En particular en las aplicaciones Web esta es, largamente, la opción más popular  (aunque siguen existiendo sitios, basados en p.ej. PHP, en los que el rol del frontend es débil).  

Decidir que se separa en "front" y "back" _no agota la cuestión_; existen _distintos estilos_ para la organización de una aplicación entre frontend y backend.  
Podemos definir una SPA (single-page application) en la que el frontend se encarga de renderización y lógica de interacción, dividir la aplicación cliente en módulos, o cargar cada página desde servidor.  
Por otro lado, podemos delegar todos los cálculos en el servidor, replicar algunos en el cliente para tener agilidad con el usuario y confiabilidad en las transacciones, o enviar datos más "crudos" con un procesamiento final en el cliente.   
Otro aspecto a tener en cuenta es la _comunicación_ ¿se van a usar interfaces API REST, Web Services, o alguna otra tecnología?


### Dentro del back, dentro del front
_Dentro del backend_, una aplicación puede englobar funcionalidades muy distintas. P.ej. un sitio de retail puede incluir 
- envío de sugerencias a las clientes de acuerdo a su historial de consultas y compras
- procesamiento de pagos
- envío de productos

Parece razonable separar estas funcionalidades en distintos módulos o servicios.  
A su vez, muchas veces existen distintos vínculos o relaciones entre los módulos. En este caso, todos los módulos deben conocer datos de contacto de los clientes. Por otra parte, el registro de un pago puede disparar el envío de un producto.  
Si se definen unidades separadas ¿cómo implementar las comunicaciones o vínculos necesarios? 
En este caso, los datos de cliente ¿son provistos por un servicio ad-hoc, o cada unidad accede a una base de datos? La comunicación entre pagos y envíos, ¿se implementa mediante colas de mensajes, una interface REST que ofrece el servicio de envíos para registrar la necesidad  de un nuevo envío, u otro mecanismo?  
Otra cuestión a resolver es la _granularidad_ de los servicios: ¿definimos un solo servicio de procesamiento de pagos, o varios que manejan específicamente la cuenta del cliente, el registro de pago con tarjeta, etc.?

Respecto _del frontend_, si decidimos separarlo en varios módulos, eso genera la pregunta de cómo manejar el estado común, por ejemplo los datos del usuario logueado.


### Múltiples decisiones
En este pequeño pantallazo se intenta mostrar la multiplicidad de decisiones que involucra la organización en componentes de una aplicación.

Estas decisiones tienen una influencia _enorme_ en el desarrollo: impactan en la organización que va a tener el código, en la conveniencia de usar una u otra librería o framework, en la organización del equipo de trabajo, en la generación de entregables, en el versionado, etc..  
O sea, estas decisiones deben ser consideradas en varias de las tareas que conforman un proyecto de desarrollo de software.

A su vez, este tipo de decisiones pueden estar influidas por _cuestiones de infraestructura_: una organización de front y back adecuada para el entorno intranet de una organización, en el cual se puede controlar qué browser utiliza cada usuario, podría no serlo para una aplicación de uso masivo.  
Esta influencia también va en el otro sentido: un backend separado en una multitud de microservicios va a requerir un entorno de ejecución con excelentes capacidades de networking entre servidores, mientras que en el otro extremo, una aplicación _monolítica_ puede generar un gran stress en las capacidades de procesamiento y memoria del equipo en donde se despliegue.

Aquí empezamos a visualizar la relación estrecha que existe entre las cuestiones de arquitectura de software y de infraestructura.


## Cuestiones independientes del dominio
Está claro que muchas de las cuestiones que deben resolverse en el desarrollo de una aplicación están estrechamente relacionadas con su _dominio_.  
Si pensamos en p.ej. un sitio de retail, una aplicación para prospección petrolífera, o un juego masivo, cada uno de estos tipos de proyecto resolverá distintas cuestiones de negocio, y tampoco serán similares los tipos de información que manejan.

Por otro lado, hay cuestiones que aparecen en proyectos de características muy diversas. Mencionamos algunos entre los más usuales:
- logging
- autenticación y autorización
- manejo de versiones
- gestión del código fuente
- selección de tecnologías y librerías
- comunicación con otros sistemas
- generación de desplegables.

Estas cuestiones comunes son los llamados _cross-cutting concerns_.  
Tal como pasa con la organización de componentes, su abordaje requiere de una mirada que abarque distintos aspectos y tareas comprendidos en un proyecto de desarrollo, y otra vez, varios tienen una relación estrecha con cuestiones de infraestructura.


## La arquitectura, las arquitectas y los arquitectos (de hecho o de derecho)
El dominio de la _arquitectura de software_ comprende, en principio, las cuestiones que mencionamos.

Como ya se señaló, todo proyecto está atravesado por las decisiones de arquitectura. En cualquier proyecto surge la pregunta de si, y cómo, organizarlo en componentes; a cualquier proyecto le aplican varias de (si no todas) las cuestiones listadas en el párrafo anterior.  
Por otro lado, puede haber o no un equipo que se dedique _específicamente_ a las mismas, puede existir o no un _equipo_ de arquitectura.  

En cualquier caso, las personas que se encargan de estas cuestiones suelen estar entre quienes cuentan con mayor seniority en un equipo de desarrollo.  
Por esto, suelen asociarse a otras tareas que no resultan, tal vez, específicas del dominio de la arquitectura, como ser: establecimiento de normas o standards, decisiones sobre tecnologías y librerías en general, o acciones de capacitación.

Esto es, en general tienen a cargo distintas iniciativas cuyo propósito es elevar el nivel de los productos, de los procesos, y del equipo.

También por lo ya expuesto, son quienes probablemente tengan una relación más estrecha con el equipo de infraestructura/operaciones.


## Nota social
En rigor, el alcance de qué se entiende por "arquitectura" va a variar de proyecto en proyecto, y va a estar en relación a la cultura y a las costumbres de cada lugar y cada grupo de trabajo.  
Dicho de otro modo, el concepto de "arquitectura", como pasa con otras cuestiones, va a estar fuertemente vinculado a la comunidad de desarrollo.

Esta observación lleva a un comentario más general: al pensar en cuestiones generales de desarrollo de software, y más en general de IT, la _perspectiva social_ puede ser muy relevante. 
Finalmente, es una actividad que requiere de muchas personas, que ponen -ponemos- bastante de su energía personal, que muchas veces va más allá de lo que significa una relación laboral. Somos un gremio apasionado, tenemos la suerte de dedicarnos a algo que (al menos a veces) nos gusta y/o nos desafía.







