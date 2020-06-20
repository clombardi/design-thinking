# Programar y desarrollar
Después de haber descripto varias facetas de los proyectos de construcción de software, es hora de volver a una cuestión que mencionamos algunas veces. 

Ya en la [introducción](./mirada-hacia-construccion), nos preguntamos por qué se habla de "desarrollador" y no de "programador".  
¿Qué es una "desarrolladora"? Una persona que produce código. ¿Y una "programadora"? Lo mismo.  
Entonces ¿por qué existen dos palabras, son sinónimos o hay diferencias?

La respuesta (al menos, la que vamos a dar en este material) es que _sí hay diferencias_, y que un buen "lugar" para buscarlas es la _visión_ que tiene la persona que se dedica a producir código.  
Con "visión" nos referimos a en qué cosas piensa, qué aspectos tiene en cuenta, una persona mientras está realizando su trabajo.

Obviamente, lo que vamos a decir tiene algo (o bastante) de simplificación, y tal vez de exageración. Lo que vamos a describir a continuación son versiones estereotipadas de estas dos visiones.  
Elegimos hacerlo así para que lo que queremos transmitir quede nítidamente expresado.



## Programador: visión más acotada
Un programador tiene una visión centrada en el código que está escribiendo en cada momento.  
Tiene, y utiliza, conocimientos sobre distintos lenguajes de programación, sobre algoritmos, y manejo de estructuras de datos. También puede manejar otras tecnologías, p.ej. HTML/CSS para interfaces Web, o distintas bases de datos.

Al armar un programa, tiene claro lo que le piden, o sea cuál es el _resultado que se espera_ al utilizarlo.  
En su visión, el producto de su trabajo es el código que conforma un programa que genera los resultados esperados.


(las siguientes dos secciones están prolijamente separadas en parágrafos, para que tal vez alguien las pueda leer, pero también para simplificar la inclusión de imágenes adecuadas a cada subtítulo)

## Desarrollador: en un proyecto y en un entorno
Por su parte, un desarrollador no pierde de vista que su trabajo produciendo código está _en el contexto de un proyecto de desarrollo_, que involucra todos los aspectos que venimos debatiendo.

¿Qué quiere decir esto? Que su forma de trabajar está influida por varias cuestiones; mencionemos algunas.


### Trabajo dentro de un equipo
Un desarrollador tiene en cuenta que trabaja en conjunto con colegas.  
En principio, está dispuesto a intercambiar conocimiento, realizar y responder consultas. Por suerte nuestro ámbito es, en general, muy abierto a compartir información; por lo tanto, este no es un rasgo privativo de la visión de desarrollador.

Lo que resulta más particular de esta visión, es notar que el código que se está construyendo puede resultar de utilidad para otros, en varios aspectos.  
Puede ser que dentro del proyecto se requiera de un código de características similares. También es posible que parte del código que está produciendo, sea de utilidad en otras partes del proyecto. En una mirada más abstracta, puede advertir que hay técnicas, o razonamientos, que está aplicando y que podrían ser útiles para sus colegas.


### Productos que permanecen y evolucionan
Una desarrolladora es consciente de que, probablemente, el código que produce se va a utilizar durante largo tiempo.  
También percibe que es inevitable que el código evolucione, o sea, que ella misma u otras personas, generarán cambios, agregados y mejoras.
Asimismo, cambian las condiciones en que se escribió el código: tecnologías, cuestiones legales, etc.. 
Distintos fenómenos que ocurren en el _tiempo de vida_ del código.

Por lo tanto, entiende la relevancia de que el código no sólo funcione como se espera, sino que pueda ser leido y comprendido por otras personas ... o por ella misma después de unos meses (o incluso un par de años).  
Por otro lado, propenderá a generar código _robusto_, que "sufra" lo menos posible al ser modificado o adaptado.  
Finalmente, intentará generar las herramientas que ayuden a garantizar que el código seguirá funcionando correctamente a medida que evoluciona.


### Distintos usuarios, distintos escenarios
Un aspecto relacionado con el anterior, es que es probable que no se pueda anticipar quiénes, y cómo, utilizarán el código que se está desarrollando.  

Un desarrollador que tenga esto presente, verificará que los componentes que genera sean utilizados correctamente.


### Parte de un proyecto mucho más amplio
Otro aspecto importante en esta visión es la comprensión de que el código que se genera forma parte, y va a estar en relación con, otras partes y componentes de un proyecto.

Esto tiene varias implicancias.  
Tal vez la más relevante, es la actitud de aprovecharse de los otros componentes y librerías implementados, solicitando las adaptaciones que pudieran ser necesarias para utilzarlos adecuadamente; en lugar de "reinventar la rueda" y repetir lógica.  
Mencionamos también la capacidad de verificar que el resultado que se indicó como esperado es correcto; de analizar la conveniencia de ajustar este resultado a partir de cuestiones de eficiencia, confiabilidad, etc.; y de pensar en variaciones o agregados potencialmente útiles.  



## Actitudes _dev_
OK, la visión de desarrollo es más amplia que la que mira sólo el código. Ahora, ¿qué consecuencias _prácticas_ tiene esta visión en el día a día laboral?  
La respuesta que vamos a dar parte de observar las _actitudes_ que forman parte del estilo de trabajo de una persona. Identifiquemos y describamos algunas _actitudes dev_.


### Usar antes que (re)inventar
Tal vez la actitud más valiosa es la _búsqueda activa_ de librerías, rutinas, etc., que resuelvan partes o aspectos de cada componente o programa a construir.  
Esto incluye entender para qué partes o aspectos es más probable que exista una solución que pueda utilizarse o adaptarse.  
También implica una gimnasia de búsqueda de componentes, lectura de documentación, y generación de las llamadas pruebas de concepto (o _POC_, por las siglas del inglés "Proof of Concept"). Esto en la convicción de que el tiempo usado en conocer y aprender librerías y componentes externos, es una _inversión_ que muy probablemente se justifique en el tiempo.

El ahorro en tiempo de desarrollo, siendo la ventaja más evidente, no es en absoluto la única, y puede incluso no ser la más relevante en la decisión de usar en lugar de producir.  
Un aspecto importante es la _calidad_, en varios aspectos, entre ellos eficiencia, tasa de fallos, manejo correcto ante datos o situaciones erróneos, etc.. El código de una librería va a estar, por lo general, mucho más probado, depurado y estudiado que el que se pueda generar dese un proyecto.  
Además, el uso soluciones que son conocidas dentro del ámbito IT, puede simplificar la incorporación de nuevas personas a un equipo de trabajo.  
Otra cuestión a considerar es que ante cambios (en formatos, tecnologías, reglamentaciones, etc.) es muy probable que surjan versiones actualizadas de los componentes que utilizamos que realicen las adaptaciones necesarias, desligándonos de la necesidad de realizarlas dentro del equipo.

Es interesante aclarar que esta búsqueda debe darse, tanto para componentes de uso público, como para aquellos que hayan sido desarrollados _dentro del proyecto en el que trabajamos_ y que pueden ser de utilidad para la tarea que se requiere.


### Desarrollar componentes y (eco)sistemas, más que productos cerrados
El complemento de lo anterior es tomar una actitud más abierta respecto del código _que se produce_. En lugar de pensarlo exclusivamente como un programa que se limita a producir un resultado determinado, concebirlo en la forma de uno o varios componentes, de los cuales algunos pueden ser de utilidad para otras personas.  
Dicho de otra forma, en lugar de resolver un problema puntual, pensar en contribuir a un ecosistema de componentes que evoluciona constantemente.


### Respetar convenciones
Para facilitar la comprensión por parte de otros miembros del equipo, y tal vez el manejo del código en otras tareas que forman parte proceso de desarrrollo (gestión del código fuente, generación de entregables, etc.), es importante respetar las convenciones de codificación que se hayan definido en un proyecto.

Existen convenciones de distinta naturaleza: formato del código (tabs o espacios, cantidad de indentaciones, etc.), nombres de componentes (p.ej. que el nombre de todas las funciones que obtienen un valor empiece con `get`, o el uso de `CamelCase` vs `snake_case`), idioma (p.ej. se puede definir que todos los nombres estén en inglés), selección de librerías (utilizar la librería A, que es la que se usa en todo el proyecto, y no la B), organización en carpetas.


### Mantener legibilidad
Surge de tener en cuenta que el código se escribe para ser leido por otras personas (que puedo ser yo misma dentro de unos meses), tanto como (o incluso más que) por un compilador/intérprete/etc. que lo lleve a su forma entregable.

Resulta conveniente mantener un estilo que facilite la legibilidad del código que se escribe. El respeto a las convenciones ayuda para ello. Elegir buenos nombres para las variables y funciones es otro aspecto de _gran_ relevancia.  
También, tener la capacidad de renunciar a variantes que hacen al código más compacto ... al mismo tiempo que más enmarañado.


### Escribir comentarios
Otra actitud que ayuda a la legibilidad, y también a la facilidad de mantener, y de reutilizar partes, es la inclusión de _comentarios_ en el código.


### Acompañar el código con tests automáticos
Dejamos para el final una práctica con un impacto enorme: la de acompañar cada pieza de software que se construye con una batería de _tests automáticos_ que verifican que se brindan los resultados esperados.

Tal como indicamos con la búsqueda activa de elementos reutilizables, la ventaja más evidente, en este caso garantizar que el software que producimos funcione correctamente en distintos escenarios, está lejos de ser la única.  

Tal vez la consecuencia más buscada del hábito de testear es _disminuir el temor al cambio_. Cuando una aplicación ya está productiva, o ante un componente que puede ser utilizado por otros que no conocemos ¿cómo evitar las dudas antes de realizar cambios?  
En particular, y para mencionar un tema muy presente en el desarrollo, cuando resulta conveniente modificar la organización del código (la llamada _refactorización_) para que resulte más sencillo realizar modificaciones o agregados, o por cuestiones de eficiencia, seguridad u otras.  
Contar con una buena batería de tests de ejecución automática es de gran utilidad para indicarnos que los cambios y/o refactorizaciones que apliquemos "van en la buena senda", en el sentido que no conspiran contra el funcionamiento correcto del código. Por esto, el hábito de testeo se considera útil para ayudar a la decisión de realizar cambios que en ausencia de tests, podrían considerarse como demasiado riesgosos.

Otro aspecto en que los tests resultan de utilidad es que son ejemplos "vivos" que muestran cómo utilizar un componente, qué datos espera, cuál es la forma de los resultados que brinda, cómo funciona en ciertos casos específicos.  
Por esto, se consideran como un complemento de la documentación.

La construcción, ejecución y mantenimiento de tests automático ya constituye un tema de estudio por sí mismo, del que hablaremos extensivamente en una unidad posterior de este curso.

