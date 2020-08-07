---
layout: default
---

# Defectos: tipos, severidad, prioridad
Al [comienzo de esta unidad](../errores-defectos) señalamos la existencia de una _gran diversidad_ de formas en las que el comportamiento de un producto de software puede ser distinto a lo que se requiere y/o se espera; englobando estos fenómenos con nombre genérico de _defectos_.  
También mencionamos la necesidad de una adecuada _gestión_ de los defectos, luego de su _detección_ que es el objetivo de las actividades de testing.

En esta página, realizaremos una pequeña exploración del universo de los  defectos de software, desde dos perspectivas.  
Primero propondremos una posible clasificación, entre las muchas que aparecen al consultar material online o bibliografía, definiendo algunos _tipos_ de defectos de acuerdo a su naturaleza.  
Luego describiremos brevemente dos atributos que dan lugar a clasificaciones de los defectos relevantes para su gestión: su _severidad_ y su _prioridad_.


## Una posible clasificación de defectos de software
Un criterio posible para clasificar a los defectos de software, consiste en analizar en qué _aspecto_ se está detectando una falla, o sea, una diferencia entre el comportamiento de un producto y lo que se espera, se requiere y/o fue especificado para el mismo.  
Utilizando este criterio, podemos definir la siguiente lista, no exhaustiva, de _tipos_ de defecto.

**Funcionalidad**  
La aplicación no cumple con la funcionalidad requerida. Entre los casos más comunes, están los errores de lógica, los de cómputo, y los de registración incorrecta de operaciones.  
Algunos ejemplos en una aplicación de venta online: permitir vender un producto que no tiene stock disponible, calcular incorrectamente el importe total de una venta, registrar una venta sin que se haya ingresado la forma de pago, no registrar que hay un envío pendiente para una venta con entrega a domicilio, registrar dos envíos en lugar de uno, o registrar un envío a una dirección distinta de la que corresponde.  

(acá puede ir una imagen de un error de funcionalidad, el del cálculo incorrecto es el más fácil de mostrar)  
![error de funcionalidad](../../images/logoelevate.jpg) 


**Interfaz**  
La interfaz de usuario es defectuosa, impidiendo al usuario realizar una acción, permitiendo acciones que no deberían estar habilitadas, o generando confusión en el usuario.  
Algunos casos comunes son: 
- errores de _validación_, un caso típico es permitir que un dato obligatorio quede sin completar.
- _elementos gráficos faltantes_, p.ej. en una aplicación de venta online, un medio de pago que debe proponerse, la cantidad a comprar al elegir un producto, o el botón de "cancelar operación".
- errores de _navegación_, p.ej. que luego de agregar un producto en una compra, en lugar de volver a la página para continuar con la compra, aparezcan los detalles de la dirección de envío.

(acá puede ir una imagen de un error de interfaz, puede ser un elemento faltante marcado "a mano")  
![error de interfaz](../../images/logoelevate.jpg) 

Aunque pueden considerarse como un subtipo especial dentro de los errores de funcionalidad, preferimos categorizarlos por separado para subrayar los distintos aspectos que puede involucrar un defecto.


**Performance**  
El tiempo de respuesta de la aplicación ante un evento o requerimiento, es mayor al especificado.  
Por ejemplo, al cargarse una página en una aplicación Web, pasan más de X segundos hasta que aparece una vista de la página en el navegador; o el tiempo de respuesta ante un pedido HTTP es mayor a Z milisegundos.

(acá puede ir una imagen de un error de performance, puede ser un browser con la página en blanco)  
![error de performance](../../images/logoelevate.jpg) 


**Concurrencia**  
La aplicación no responde, o responde defectuosamente, al acceder a la misma una cantidad de usuarios concurrentes que está dentro del rango establecido para funcionamiento normal.  
P.ej., se especifica que la aplicación debe soportar hasta 500 usuarios concurrentes, y con 150 los tiempos de respuesta se vuelven intolerables, o no permite el ingreso de un usuario adicional.


**Seguridad**  
Un agente que no cuenta con las credenciales necesarias, puede realizar operaciones en la aplicación.


**Usabilidad**  
Usuarios que forman parte del público objetivo de la aplicación, ven dificultada su operación por no comprender adecuadamente la interfaz que se les presenta.  
Esto puede dar lugar a que haya casos en los que un usuario piense que realizó una operación, y en realidad no la realizó, o realizó una acción distinta.


## Severidad y prioridad
Otros criterios de clasificación de defectos están relacionados con su _relevancia_. Estos criterios resultan muy útiles para el tratamiento de cada defecto, dentro de la gestión de un proyecto.

En este sentido, hay dos criterios ampliamente utilizados: la _severidad_ de un defecto, y su _prioridad_.  
En amobs casos, las categorías que se definen, y sobre todo la caracterización de cada una, difieren según la fuente que se consulte. Las descripciones que siguen integran ideas presentes en varias de las definiciones disponibles. Obviamente, los criterios pueden diferir de proyecto en proyecto.


### Severidad
La **severidad** de un defecto es una medida desu impacto en los servicios que brinda un producto de software y de los riesgos que conlleva no corregirlo.  
Distinguimos cuatro categorías.

**Crítico** o **bloqueante**  
Impide el funcionamiento de la aplicación, o de uno o varios de sus componentes más necesarios para la operación. 
Alternativamente, genera corrupción de datos relevantes, de una forma que no puede recuperarse.
En breve, un error es bloqueante si impide, o desaconseja, el funcionamiento de la aplicación en su conjunto.  
<u>Ejemplos</u>: crash del sistema, un error 500 o 404 ante cualquier intento de login.

**Grave** o **Major**  
Hay componentes importantes de una aplicación que no están operativos, o su  comportamiento difiere en forma sustancial de lo definido o requerido.  
Dicho de otra forma, mirando a la aplicación en conjunto, su funcionamiento está degradado severamente.  
Por ejemplo, en una aplicación de venta online, sólo se pueden vender algunos productos.

**Moderado** o **Minor**  
El comportamiento de la aplicación difiere de lo especificado, en formas y aspectos no sustanciales. No hay daño en los datos, o son mínimos y recuperables.  
Dicho de otra forma, representa una pérdida leve de funcionalidad y/o eficiencia.  

**Leve** o **Low**  
Detalles, muchas veces de estética o presentación. No afectan a la funcionalidad, usabilidad, ni datos.


### Prioridad
La **prioridad** de un defecto indica la urgencia con que debe ser corregido, y por lo tanto, en qué medida afecta al flujo de trabajo. 
Distinguimos cuatro categorías.

**Inmediato** o **urgente**  
Requiere atención inmediata, p.ej. dentro de las 24 horas. 
Su consideración debe anteponerse al trabajo que estén llevando a cabo quienes se designe para su corrección.

**Alta**  
La corrección debe formar parte del siguiente release planificado del, o de los, componente/s involucrados en la resolución. 
Se puede combinar con el trabajo en curso de quienes se designe para su corrección.

**Media**  
La corrección puede planificarse para releases posteriores.

**Baja**  
La corrección puede postergarse sin una fecha específica.


### Relación entre severidad y prioridad
Está claro que hay una fuerte correlación entre los niveles de severidad y de prioridad que se asignen a un determinado defecto. En particular, un defecto bloqueante tendrá prioridad urgente, y por lo general, los siguientes niveles de severidad se corresponderán con los correspondientes de prioridad.

Por otro lado, esta correlación no es absoluta. En particular, es perfectamente posible que a un defecto no crítico se le asigne una prioridad urgente.
En el ejemplo indicado para severidad grave, si los productos que no se pueden vender son aquellos de los que más se desea impulsar la venta por alguna razón de negocio, este defecto puede ser considerado como de prioridad urgente.  
Incluso un defecto de severidad leve, como la falta de una imagen, puede ser considerado urgente si se trata p.ej. del logo de la empresa.




