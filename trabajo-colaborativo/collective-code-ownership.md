---
layout: default
---

# Collective code ownership
A pesar de la proliferación de roles y tareas que describimos en la [Unidad 1](../programacion-a-desarrollo/construccion-tareas-roles), el rol del desarrollador sigue siendo central para la mayor parte de los proyectos de construcción de software. 
A su vez, el principal producto del trabajo de las desarrolladoras, el _código fuente_, es uno de los principales recursos de un proyecto (si no el principal). En este curso, hemos dedicado la [Unidad 5](../scm-git/scm-git.index) a la gestión del mismo.  
Por lo tanto, las _actitudes_ que asuma cada desarrollador respecto de su trabajo, y respecto del proyecto del que forma parte, representan un aspecto crítico para el éxito de un proyecto de desarrollo.


## Tres aspectos en la visión de desarrollador
Este tema fue tratado ya en la [Unidad 1](../programacion-a-desarrollo/programar-y-desarrollar), al describir una visión acotada del rol de las personas que producen código, a la que asociamos con la idea de "programador", y contraponerla con otra de miras más amplias, que resulta mucho más valiosa para un proyecto de desarrollo, y a la que relacionamos con la palabra "desarrollador".
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

Este fenómeno se ve reforzado por la tendencia a una _excesiva especialización_ en la producción de código con características o propósitos particulares por parte de una persona. 
Así, encontramos frecuentemente "programadoras X", donde X puede ser un lenguaje ("programador JavaScript"), una tecnología o herramienta ("desarrolladora Angular"), o un aspecto dentro del desarrollo de software ("programador Web").  
Indudablemente, contar con personas con conocimientos extendidos sobre temáticas relevantes para un proyecto resulta altamente valioso. 
De otro lado, organizar un equipo a base a los conocimientos o experiencia específicos de cada integrante, genera riesgos similares a los mencionados en relación a los "programadores ermitaños". El código puede quedar separado en secciones que resulte difícil reunir para generar los productos a desplegar, en donde no se favorece el aprovechamiento de desarrollos generados en una "sección", que podrían ser útiles en otras.  
Adicionalmente, una organización de esta forma desalienta la diseminación, dentro de un equipo, de los conocimientos específicos de cada integrante, atentándose de esta forma contra la elevación de la potencialidad del equipo.

Finalmente, mencionemos que muchos desarrolladores, en particular los más talentosos, presentan _personalidades fuertes_, que pueden dar lugar en un equipo de desarrollo al fenómeno conocido como "lucha de egos".  
Este hecho, si no es convenientemente gestionado y acotado, tiene consecuencias funestas para la posibilidad de generar espacios de colaboración y de trabajo compartido, para el establecimiento de convenciones para la producción de código, y en general, para la generación de código que resulte manejable por personas distintas a quien lo escribió.