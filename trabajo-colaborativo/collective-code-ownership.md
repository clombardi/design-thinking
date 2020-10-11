---
layout: default
---

# Collective code ownership
A pesar de la proliferación de roles y tareas que describimos en la [Unidad 1](../programacion-a-desarrollo/construccion-tareas-roles), el rol del desarrollador sigue siendo central para la mayor parte de los proyectos de construcción de software. 
A su vez, el principal producto del trabajo de las desarrolladoras, el _código fuente_, es uno de los principales recursos de un proyecto (si no el principal). En este curso, hemos dedicado la [Unidad 5](../scm-git/scm-git.index) a la gestión del mismo.  
Por lo tanto, las _actitudes_ que asuma cada desarrollador respecto de su trabajo, y respecto del proyecto del que forma parte, representan un aspecto crítico para el éxito de un proyecto de desarrollo.   
En el ámbito de la industria del software, se conocen varias propuestas para organizar equipos de trabajo que fomenten, en sus integrantes, actitudes positivas respecto del éxito de los proyectos en los que participan.

(acá puede ir una imagen sobre "trabajo en equipo")  
![imagen sobre "trabajo en equipo"](../images/logoelevate.jpg)

En esta sección, y en las siguientes, trataremos sobre algunos conceptos y técnicas referidos a la organización y la forma de trabajo de equipos de desarrollo. Tienen como objetivo común la generación de código comprensible, aprovechable y modificable por cualquiera de los integrantes de un equipo, y a la elevación continuada de la potencialidad del mismo mediante la disposición a compartir experiencias de trabajo y conocimientos.  
En esta sección, luego de una introducción general, hablaremos sobre _collective code ownership_. En la siguiente abordaremos la técnica de _pair programming_, que proviene al igual que la anterior, del conjunto de propuestas conocido como _Extreme Programming_ o _XP_. Finalmente, trataremos sobre _full-stack development_.  
Como veremos más adelante, estas ideas no se limitan al ámbito estricto del desarrollo, sino que pueden extenderse a otros roles, en particular en los ligados a tareas de operaciones. 
Entendemos que su aplicación fomenta el enfoque _DevOps_ de combinación entre las visiones de desarrollo y operaciones. Tal es la motivación para incluir, en esta última unidad, las temáticas recién mencionadas.


## Tres aspectos en la visión de desarrollador
Las distintas actitudes que puede manifestar cada desarrollador ya fueron tratadas en la [Unidad 1](../programacion-a-desarrollo/programar-y-desarrollar), al describir una visión acotada del rol de las personas que producen código, a la que asociamos con la idea de "programador", y contraponerla con otra de miras más amplias, que resulta mucho más valiosa para un proyecto de desarrollo, y a la que relacionamos con la palabra "desarrollador".
En esa parte del material, destacamos tres aspectos de lo que llamamos "visión de desarrolladora".

Por un lado, una desarrolladora entiende cabalmente que su trabajo _se inscribe dentro de un proyecto_, siendo consciente de que el código que produce debe representar una contribución positiva para el mismo. 
Por lo tanto, asume la actitud de conocer y comprender la [arquitectura de software](../programacion-a-desarrollo/arquitectura-de-software) definida, para evitar que el código que genera se contraponga a sus intenciones o necesidades.
Asimismo, se involucra con los aspectos funcionales del proyecto y de su dominio de aplicación.

Además, tiene presente la realidad de _cambio constante_ mencionada varias veces en este material.
A partir de este entendimiento, produce código preparado para adaptarse a circunstancias cambiantes, y más en general, genera condiciones que permiten realizar modificaciones al código generado, minimizando las probabilidades de que los cambios produzcan efectos catastróficos.

Por último, destacamos que un desarrollador se asume como _parte de un equipo_.
En consecuencia, produce código que pueda ser comprendido, aprovechado y modificado por sus colegas, y está dispuesto a realizar actividades de concepción y producción de código en forma colectiva.


## Factores en la dirección contraria
Lamentablemente, en la industria del software encontramos varios factores que atentan contra la "visión de desarrollador" recién mencionada. Algunos de ellos están ligados a las características personales de quienes se desempeñan en el rol de desarrolladores, y a su experiencia acumulada en la industria.

Uno de ellos lo constituye la tendencia que muestran varias personas que se dedican a esta actividad, a llevar un _estilo de trabajo aislado_ o solitario. Un "programador ermitaño", por llamarlo de alguna forma, se muestra por lo general muy dispuesto a colaborar con colegas que soliciten asistencia, pero mucho menos a realizar actividades en conjunto.  
Esta forma de trabajo genera grandes diferencias de estilo y concepción en el código de distintas personas que forman parte (al menos nominalmente) de un mismo equipo, lo que dificulta su aprovechamiento fuera del entorno aislado que forma el código escrito por cada persona, así como la aplicación de cambios al código por parte de alguien distinto a quien lo produjo.

(acá puede ir una imagen sobre "programador ermitaño")  
![imagen sobre "programador ermitaño"](../images/logoelevate.jpg)

Este fenómeno se ve reforzado por la tendencia a una _excesiva especialización_ en la producción de código con características o propósitos particulares por parte de una persona. 
Así, encontramos frecuentemente "programadoras X", donde X puede ser un lenguaje ("programador JavaScript"), una tecnología o herramienta ("desarrolladora Angular"), o un aspecto dentro del desarrollo de software ("programador Web").  
Indudablemente, contar con personas con conocimientos extendidos sobre temáticas relevantes para un proyecto resulta altamente valioso. 
De otro lado, organizar un equipo a base a los conocimientos o experiencia específicos de cada integrante, genera riesgos similares a los mencionados en relación a los "programadores ermitaños". El código puede quedar separado en secciones que resulte difícil reunir para generar los productos a desplegar, en donde no se favorece el aprovechamiento de desarrollos generados en una "sección", que podrían ser útiles en otras.  
Adicionalmente, una organización de esta forma desalienta la diseminación, dentro de un equipo, de los conocimientos específicos de cada integrante, atentándose de esta forma contra la elevación de la potencialidad del equipo.

Finalmente, mencionemos que muchos desarrolladores, en particular los más talentosos, presentan _personalidades fuertes_, que pueden dar lugar en un equipo de desarrollo al fenómeno conocido como "lucha de egos".  
Este hecho, si no es convenientemente gestionado y acotado, tiene consecuencias funestas para la posibilidad de generar espacios de colaboración y de trabajo compartido, para el establecimiento de convenciones para la producción de código, y en general, para la generación de código que resulte manejable por personas distintas a quien lo escribió.

En resumen, los factores reseñados provocan que el código fuente de un proyecto puede resultar de difícil comprensión y/o modificación. 
Una base de código con estas características corre, a su vez, el riesgo de quedar _obsoleta_ ante cambios en las tecnologías o lenguajes de programación utilizados: el temor a modificar código cuyo comportamiento se comprende sólo en forma aproximada puede resultar mayor a las ventajas o conveniencia de aplicar mejoras o actualizaciones.  
Esto genera una reacción en cadena: a medida que pasa el tiempo, se va haciendo más difícil encontrar personas que puedan lidiar con código donde se aplican tecnologías que van quedando obsoletas, lo que aumenta la dificultad para modificar dicho código, reforzándose así la intangibilidad del código incomprensible.  
Esta es una de las fuentes de la llamada _deuda técnica_, un término que designa a la incapacidad de un proyecto de mantenerse actualizado respecto del estado del arte de las tecnologías que utiliza.

(acá puede ir una imagen sobre obsolescencia)  
![imagen sobre obsolescencia](../images/logoelevate.jpg)

Otra problemática asociada a estos escenarios desfavorables es la _duplicación_ (o multiplicación) de código, o sea, que una misma funció o algoritmo aparezca repetido en secciones separadas del código, debido a la falta de comunicación en el equipo de trabajo y a la deficiente legibilidad y/o documentación en el código.  
Esto provoca el riesgo de que al producirse la necesidad de realizar cambios en el comportamiento de la función o algoritmo involucrado, se modifiquen sólo algunas de sus "copias" en el código, generándose inconsistencias que pueden ser difíciles de detectar.


## Conceptos para configurar equipos abiertos
Para evitar los efectos indeseados de los fenómenos recién descriptos, y reforzar las fortalezas de la "visión de desarrolladora" mencionada más arriba, surgieron varias propuestas de organización del desarrollo, que fomentan la conformación de equipos abiertos al intercambio de ideas sobre organización de código, al trabajo compartido, y al establecimiento de convenciones que faciliten la comprensión, por parte de todos los integrantes de un equipo, del código escrito por cualquiera de ellos.  
De acuerdo a lo indicado por la llamada "ley de Conway", que sugiere que la forma del código reflejará aquella en que se organiza la organización que lo produce, estas características abiertas y flexibles de un equipo de trabajo se transladarán al código fuente.

Varias de las propuestas provienen de una iniciativa conocida como _Extreme Programming_ o _XP_, surgida en la década de 1990.
XP se propone como un proceso inscripto dentro de los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil), compartiendo el objetivo de adaptación y gestión del cambio, y un estilo [iterativo e incremental](./iterativo-incremental) de desarrollo.  
Una característica distintiva de XP es que acentúa la relevancia del equipo de desarrollo como factor clave para el éxito de un proyecto.

(acá puede ir una imagen sobre XP)  
![imagen sobre XP](../images/logoelevate.jpg)

Aunque XP fue propuesta originalmente como una metodología completa de desarrollo, su mayor legado al estado actual del arte de la industria del software lo constituyen varias prácticas que propuso originalmente, y que en la actualidad están mucho más difundidas que la metodología en sí.
Entre ellas encontramos varios aspectos ligados al trabajo del equipo del desarrollo; además de las que se tratarán en esta unidad, esto es Collective Code Ownership, Pair Programming, mencionamos [Test-Driven Development](../testing/testing-software/tdd) y Code Review. También es una de las primeras propuestas integrales que enfatiza el rol del [testing unitario](../testing/testing-software/testing-unitario) y de la [integración continua](../ci-cd/intro).


## Ownership del código
Para adentrarnos en la temática específica de esta sección, comencemos describiendo brevemente qué se entiende por _ownership_ del código. 
Este término se utiliza para indicar quién, o quiénes, tienen el control sobre una determinada parte del código fuente de un proyecto. En particular, el ownership implica la posibilidad de _definir quiénes pueden realizar modificaciones_ sobre el código.  
Este concepto también conlleva la responsabilidad de garantizar que el código en cuestión funciona adecuadamente, y de corregir los eventuales defectos que pudieran surgir.  
La unidad mínima para definir ownership de código es un archivo fuente; esto es, el ownership se aplica a un grupo de archivos, eventualmente a un único archivo.

En la industria se han propuesto varios modelos de ownership, que pueden describirse a partir de tres esquemas prototípicos.


## Modelos tradicionales de ownership
El modelo más tradicional es el conocido como _strong code ownership_.
En este modelo, el código fuente de un producto o componente se divide en secciones, asignándose cada sección a un desarrollador que será dueño y responsable de la misma.
Por lo tanto, cada desarrollador sólo puede modificar el código de las secciones que tiene asignadas, y del mismo modo, cada archivo sólo puede ser modificado por su owner.  
Si un desarrollador necesita modificaciones sobre un archivo que queda fuera de sus "dominios", debe solicitar al owner del archivo en cuestión que realice los cambios requeridos. 
Una variante posible, que permanece dentro de este esquema, es realizar los cambios en una [rama](../git-branch/git-branch-merge) separada, y solicitar al owner que los acepte mediante un [pull request](../git-branch/pull-requests).

Este modelo tiene una debilidad evidente: cuando un integrante deja el equipo por cualquier motivo, es probable que el resto sólo tenga un conocimiento débil o aproximado sobre el código del que tal integrante es owner.  
Por eso, en algunos proyectos se adopta la práctica de definir una suerte de "responsable accesorio" de cada sección del código, para que haya al menos dos personas que conozcan su funcionamiento con un cierto nivel de detalle.  
Otro problema del strong code ownership es que cualquier modificación que afecte a distintas partes del código (por ejemplo, un cambio de nombre en un componente utilizado extensamente) requiere del concurso simultáneo de varios desarrolladores, aún cuando se trate de operaciones rutinarias, que incluso pueden ser realizadas por un programa en forma automática.

El _weak code ownership_ es un esquema alternativo, en el que cada sección del código se asigna a un desarrollador como en el caso anterior, pero donde la propiedad del código no conlleva el derecho exclusivo a su modificación.
Por lo tanto, cualquier desarrollador puede realizar cambios sobre código del que no es owner. Si los cambios son pequeños o rutinarios, los puede realizar directamente. En caso de modificaciones más relevantes, deben contar al menos con el acuerdo del dueño del código involucrado (o de los dueños, si el cambio afecta a secciones de código asignadas a distintas personas).  
En este modelo, el owner de cada sección de código es responsable de su integridad y correcto funcionamiento, debiendo revisar las modificaciones realizadas por otros integrantes del equipo.


## Collective code ownership
Este esquema resulta de la eliminación del concepto de ownership individual del código: en una formulación con cierto dejo propagandístico, se dice que _el código no tiene dueño_.  
Todo el equipo es solidariamente responsable sobre el conjunto del código fuente, y consecuentemente, cualquier integrante tiene la potestad de realizar cambios en cualquier parte del código, en cualquier momento. 
Modificaciones relevantes serán sujetas a debate dentro del equipo, debiendo llegarse a una decisión conjunta.


