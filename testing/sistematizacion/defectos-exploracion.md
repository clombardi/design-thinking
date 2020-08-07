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


