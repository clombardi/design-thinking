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


