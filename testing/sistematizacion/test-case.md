---
layout: default
---

# Test case, test script
Un _test case_ especifica una actividad puntual de testing, que podrá ser ejecutada una o varias veces durante el ciclo de vida de un producto.  
El término _test script_ se usa en el mismo sentido. Las diferencias son de matiz y varían según la fuente que se tome. 
En algunos casos, están ligadas a la automatización de la ejecución, tema del cual hablaremos más adelante en esta misma unidad. 
En otros, se describe un test script como un documento de nivel más detallado que un test case, donde el procedimiento se describe en forma más precisa.

El concepto de test case está, por lo general, vinculado a los [tests funcionales](./tipos-documentacion), que suelen ser ejecutados por testers. En este caso, un test case describe la actividad que permite verificar el correcto funcionamiento, ya sea de una funcionalidad particular, ya sea de la integración entre varias funcionalidades, en circunstancias específicas cuya definición forma parte del test case.  
También puede aplicarse también a tests no funcionales, en cuya ejecución suele intervenir personal de operaciones.


## Elementos de un test case
Un test case debe incluir, al menos, los siguientes elementos.

**Escenario inicial**  
Indica qué condiciones son necesarias para poder comenzar con la ejecución de la actividad de test.  
En particular, se incluyen condiciones de entorno (p.ej. en el caso de una aplicación Web, si se debe probar en una computadora con un cierto navegador, en una tablet, en un celular, o en otro dispositivo), las conexiones que deben estar disponibles (p.ej. un mail server si el test case involucra el envío de mails), y los datos que deben estar cargados.

**Procedimiento**  
Qué secuencia de acciones son necesarias para ejecutar el test. Pueden ser acciones respecto de una interfaz gráfica, como ingresar determinados valores y pulsar ciertos botones, o respecto de una API, en este caso las acciones son realizar ciertos requests.

**Test data**  
Los datos directamente involucrados en el caso de test. P.ej. si el test case es sobre agregar un artículo en un carrito de compras, se indica qué artículo hay que agregar, y qué cantidad.

**Resultado esperado**  
Todo aquello que debe ser verificado al ejecutar el test case, que puede incluir respuestas directas a las acciones del usuario (p.ej. que calcule correctamente el precio total del artículo como precio unitario * cantidad) y formas de verificar el efecto que las acciones realizadas tengan sobre la aplicación (p.ej. que al volver a ver el detalle de la compra, se incluya el artículo recién ingresado).


## Técnicas para desarrollar test cases
Para desarrollar uno o varios test cases se parte de una situación vinculada con una o varias de las funcionalidades requeridas en la aplicación. P.ej. el agregado de un artículo a un carrito de compra. Esto es lo que se conoce como un **escenario de test**.

A partir de un escenario, pueden aparecer distintas condiciones (producto fuera de stock, el usuario no ingresa explícitamente una cantidad, etc.). En rigor, cada test case corresponde a _un caso específico_, si hay varias variantes y/o combinaciones que se quieran comprobar, cada una es un test case distinto.

Para derivar test cases a partir de un escenario, y evitar por otro lado la generación de una cantidad exagerada de test que acarrearía costos innecesarios para su ejecución, se han definido distintas técnicas, entre las cuales mencionamos:
- **Boundary Value**: se recomienda pensar en los valores límite de las variables involucradas en el test data. P.ej. un valor límite para la cantidad de productos es 0. Es lo que hicimos al [analizar el algoritmo](../../logica-algoritmica/elevando/casos-limite) desarrollado en la Unidad 2.
- **Equivalence Partitioning**: se analizan rangos o conjuntos de valores que tienen el mismo efecto en el test, a los que se llama _clases de equivalencia_. En el ejemplo del agregado de un producto a un carrito de compras, se pueden dividir los productos entre los que tienen stock suficiente para cubrir la cantidad a comprar, los que tienen stock insuficiente, y los que no tienen stock. El análisis de las clases de equivalencia generadas puede ayudar a armar combinaciones que cubran la mayor parte de los casos posibles, evitando la generación de una cantidad exagerada de test cases.
- **Negative Testing**: consiste simplemente en considerar condiciones inesperadas, p.ej. la carga de una cantidad negativa en la compra de un producto.

Es importante encontrar un buen balance entre la _cobertura_ del test, o sea qué posibles defectos puede detectar, y el _esfuerzo_ de redactar, ejecutar y mantener los test cases. La cobertura total es imposible en la mayor parte de los casos, debiéndose utilizar técnicas de _verificación formal_ en aquellas situaciones en las que la criticidad de los recursos controlados por una aplicación hace pertinente la búsqueda de estrategias que eliminen de raíz la posibilidad de defectos.


## Ejecución de un test case
De acuerdo a lo que se establezca en el [Test Plan](./test-plan) y en otras instancias de gestión, se deben ejecutar los Test Cases definidos ante ciertos eventos, p.ej. generación de una nueva versión, cambios en el código que afectan una cierta funcionalidad, etc..  
Se debe registar el _resultado_ de la ejecución de cada Test Case. Primariamente, si se obtuvieron los resultados esperados o no, o dicho informalmente, si el test _pasa_ o _no pasa_.  
En el segundo caso, se deben registrar los defectos encontrados. Para esto existen herramientas específicas utilizadas en la gestión de defectos, de las que hablaremos más adelante.
