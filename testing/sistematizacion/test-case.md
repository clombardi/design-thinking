# Test case, test script
Un _test case_ especifica una actividad puntual de testing, que podrá ser ejecutada una o varias veces durante el ciclo de vida de un producto.  
El término _test script_ se usa en el mismo sentido. Las diferencias son de matiz y varían según la fuente que se tome. 
En algunos casos, están ligadas a la automatización de la ejecución, tema del cual hablaremos más adelante en esta misma unidad. 
En otros, se describe un test script como un documento de nivel más detallado que un test case, donde el procedimiento se describe en forma más precisa.

El concepto de test case está, por lo general, vinculado a los [tests funcionales](./tipos-documentacion.md), que suelen ser ejecutados por testers. En este caso, un test case describe la actividad que permite verificar el correcto funcionamiento, ya sea de una funcionalidad particular, ya sea de la integración entre varias funcionalidades, en circunstancias específicas cuya definición forma parte del test case.  
También puede aplicarse también a tests no funcionales, en cuya ejecución suele intervenir personal de operaciones.


## Elementos de un test case
Un test case debe incluir, al menos, los siguientes elementos.

**Escenario inicial**  
Indica qué condiciones son necesarias para poder comenzar con la ejecución de la actividad de test.  
En particular, se incluyen condiciones de entorno (p.ej. en el caso de una aplicación Web, si se debe probar en una computadora con un cierto navegador, en una tablet, en un celular, o en otro dispositivo), las conexiones que deben estar disponibles (p.ej. un mail server si el test case involucra el envío de mails), y los datos que deben estar cargados.

**Procedimiento**
Qué secuencia de acciones son necesarias para ejecutar el test. Pueden ser acciones respecto de una interfaz gráfica, como ingresar determinados valores y pulsar ciertos botones, o respecto de una API, en este caso las acciones son realizar ciertos requests.

**Test data**
