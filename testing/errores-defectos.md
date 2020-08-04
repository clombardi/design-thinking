# De errores a defectos
¿Cuál es la primera imaen que se nos aparece al pensar en la palabra "error" relacionada con software?

Probablemente sea la de un programa que termina su ejecución abruptamente, dando lugar a la aparición de una pantalla que muestra un mensaje críptico, como la conocida [pantalla azul de la muerte](https://es.wikipedia.org/wiki/Pantalla_azul_de_la_muerte) de Windows.

(una "pantalla azul de la muerte" o similar, dejo un ejemplo)  
![una "pantalla azul de la muerte" o similar](https://upload.wikimedia.org/wikipedia/commons/5/5b/Windows_9x_Blue_Screen_of_Death_recreated_in_Fixedsys.svg) 

Un caso análogo en aplicaciones Web es la aparición de una página que indica un "404 - page not found", señal de un "link roto", o (peor) alguna descripción de un error de programa, conexión o base de datos, que impide que se muestre la página solicitada.

(un 404 o error feo, puede ser uno de cada. Dejo un ejemplo de "error feo")  
![una "pantalla azul de la muerte" o similar](https://i.stack.imgur.com/kmyZ9.png) 

Otra posibilidad es que ante una acción que realizamos como usuarios, la respuesta de la aplicación difiere de lo indicado. 
Por ejemplo, en un carrito de compras, al pulsar el botón "comprar", que en lugar de aparecer una pantalla donde se me solicita datos de envío y de pago, aparezca un mensaje agradeciéndonos por la compra.

(imagen alegórica a error de navegación, pueden ser las dos pantallas con una flecha, en la primera el botón de "comprar" destacado)  
![imagen alegórica a error de navegación](../images/logoelevate.jpg) 

También podría ser que los datos que se muestren en una misma pantalla sean incoherentes. Siguiendo con el ejemplo del carrito, al ingresar la cantidad de unidades, si ingreso 5 unidades para un artículo cuyo precio unitario es 100 pesos, y calcula como total por los 5 artículos un importe de 95000 pesos, claramente estamos en presencia de un error.

(imagen sobre cálculo incorrecto en un artículo de carrito de compras)  
![imagen sobre cálculo incorrecto en un artículo de carrito de compras](../images/logoelevate.jpg) 


## Un amplio rango de fenómenos a evitar
La breve descripción anterior ya muestra que existen errores de distintas características: corte abrupto de ejecución de programa, página de error en aplicación Web, error de navegación en la interfaz de usuario, error de cálculo.  
Por otro lado, todos estos casos comparten una característica en común: un usuario realiza una acción mediante una interfaz gráfica, y la respuesta de la aplicación a dicha acción difiere de lo definido.  
En términos generales, asociamos la idea de **error** a este tipo de fenómenos.

En rigor, el rango de los fenómenos que deben ser evitados en un producto de software operativo resulta ser mucho más amplio. Entre otros, deben verifcarse los siguientes aspectos.

**Consistencia de datos**  
Si una acción tiene un efecto sobre el estado de la aplicación, entonces las consultas que se hagan posteriormente deben reflejar este efecto.  
Por ejemplo, al registrarse la compra de un producto para la que el cliente pidió entrega a domicilio, al consultar las entregas pendientes, debe incluir la que se acaba de registrar, con el domicilio del cliente tal cual como se especificó en la compra. 

**Usabilidad**  
Sobre todo en aplicaciones destinadas a público en general (a diferencia de las que son para uso interno de una organización), las interfaces deben resultar intuitivas y agradables para los usuarios. Debe ser comprensible qué acciones se pueden realizar, y cómo llevar a cabo cada una.

**Corrección de interfaces gráficas**  
Las interfaces gráficas deben mostrarse correctamente en todos los dispositivos en los cuales debe ser posible utilizar la aplicación, de acuerdo a lo que se especifique en cada caso. Esto aplica en particular, a distintos browsers de computadoras y celulares, o modelos de celulares.

**Performance**  
El tiempo de respuesta de la aplicación, desde que el usuario lanza una acción hasta que aparece el resultado, no debe superar cierto valor que se especifica para cada aplicación. 

**Seguridad**  
Se debe evitar el acceso a una aplicación, y/o a sus datos, por parte de cualquier actor (persona o aplicación) que no posea las credenciales correspondientes. 


## Concepto de defecto
El concepto de _defecto_ engloba todos los aspectos en que un producto de software debe comportarse de acuerdo a ciertos parámetros o expectativas. 

Transcribimos una definición de un sitio Web especializado en calidad de software.
> Un _defecto_ en un producto de software refleja su incapacidad, o falta de eficacia, para cumplir con los requerimientos y criterios especificados, y por lo tanto evita que dicho producto tenga un funcionamiento **acorde a lo esperado y deseado**.

De aquí surge otro fenómeno que tiene un gran impacto en el desarrollo de software: es frecuente que las _definiciones o especificaciones_ sobre un producto de software no correspondan con lo que realmente es _esperado y deseado_ por sus usuarias o comitentes. Muchas veces, este fenómeno puede apreciarse recién cuando se cuenta con versiones, a veces parciales, del producto que pueden probarse.  
Este fenómeno es una de las motivaciones para los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil.md) descriptos en la Unidad 1.

Desde una perspectiva guiada por los objetivos que dan lugar al desarrollo, estos casos también pueden considerarse defectos que deben ser gestionados adecuadamente.  

