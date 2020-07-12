# Abstracciones básicas en programación

Al principio fue el código-máquina.

(dibujito que represente el código-máquina, onda alguien tipeando en una terminal de los 70 o algo así)  
![dibujito que represente el código-máquina](../../images/logoelevate.jpg) 

Durante varios años, cada programa se escribían utilizando la codificación binaria definida por el equipo de cómputo donde se fuera a ejecutar. Esto podía ser parte de un programa
``` 
            00000010        00000001, 0
            00010001        00000001, 00001010
            00001011        00000100
```

Aunque se definieron códigos mnemotécnicos para instrucciones, registros y otros 
``` 
            mov     ax, 0
            cmp     ax, 10
            je      :after_loop
```
la construcción de programas seguía estando ligada muy estrechamente a las características del procesador, y más en general, del equipo de cómputo.  
En lugar de pensarse en los objetivos de un programa, en la información que se deseara modelar, el foco tenía que estar puesto en registros, direcciones e instrucciones. 


## Paso 1 - lenguajes de programación 
Uno de los aspectos necesarios para pensar en programas con objetivos ambiciosos respecto del manejo de información y/o de la interacción con los usuarios, es contar con herramientas que faciliten la elevación del nivel de abstracción al programar.

Esta es una de las motivaciones para el surgimiento de los _lenguajes de programación_, que definen abstracciones de nivel más elevado tanto para el control del flujo de programa, como para la memoria. 

Respecto del flujo, este bucle en assembler
``` 
            mov     ax, 0
:loop
            cmp     ax, 10
            je      :after_loop
            // ... acciones ...
            inc     ax
            jump    :loop
:after_loop
```
se transforma en este [ciclo `for`](../../logica-algoritmica/basicos/repeticion-2.md)
``` c
for (i=0; i < 10; i++) {
    // ... acciones ...
}
```
que resulta más claro, legible y compacto.

Respecto de la memoria, este programa
``` 
            store   ax, 158         # b address
            load    cx, [ax]        # b value
            store   ax, 156         # a address
            load    bx, [ax]        # a value
            inc     bx, cx
            store   bx, [ax]        # store addition result in a address
``` 
se puede expresar de forma mucho más concisa
``` c
a = a + b
```

El surgimiento de los primeros lenguajes de programación como Fortran, Lisp, Cobol, o Algol, representó un primer paso en la elevación de la programación por sobre los detalles del hardware.

(imagen ligada a los primeros lenguajes)  
![imagen ligada a los primeros lenguajes](../../images/logoelevate.jpg) 


## Paso 2 - paradigmas de programación
Entre los conceptos principales que aportaron las primeras generaciones de lenguajes de programación, encontramos las [variables](../../logica-algoritmica/basicos/variables.md), los [arrays o listas](../../logica-algoritmica/basicos/arrays-listas.md), la [alternativa](../../logica-algoritmica/basicos/alternativa.md), las [estructuras de repetición](../../logica-algoritmica/basicos/repeticion.md), y las [funciones](../../logica-algoritmica/basicos/funciones.md) u otros conceptos similares.  Estos conceptos fueron mencionados brevemente en la unidad sobre lógica algorítmica. 

Todos estos conceptos, más otros como los [registros](https://en.wikipedia.org/wiki/Struct_(C_programming_language)), apuntan a organizar la _estructura_, tanto del programa como de los datos que maneja.  
El foco está puesto en los programas, quedando en las desarrolladoras la tarea de adaptar la descripción de los fenómenos que se desea manipular, a las estructuras de un programa.  


Un siguiente paso de la elevación del nivel de abstracción, lo constituye la concepción de distintos **paradigmas de programación**. 

El concepto de paradigma es tal vez, dentro de la informática, uno de los que más se resiste a una definición precisa; 
_aquí_ diremos que un **paradigma** define a partir de qué conceptos se organiza un programa, y cómo interactúan los elementos que se generan a partir de esos conceptos.

Los conceptos mencionados al principio de este parágrafo (variables, arrays/listas, alternativa, etc.) forman la base del llamado _paradigma imperativo-procedural_. Se caracteríza por el hecho de que varios de sus conceptos principales fueron concebidos en relación con las estructuras básicas de un equipo de cómputo: una variable surge como una forma de designar a una dirección de memoria, el ciclo y la alternativa como formas elegantes de describir una estructura de `jump`s.  
En otros paradigmas, se rompe esta relación entre los conceptos básicos que estructuran un programa, y el reflejo que van a tener cuando el programa se ejecute.  

## Los dos paradigmas más relevantes: "objetos y funcional"
Los dos paradigmas más influyentes en el estado actual de la programación son los llamados _programación orientada a objetos_ y _programación funcional_.

La **programación orientada a objetos** propone estructurar un programa a partir de elementos, llamados _objetos_, que representan las entidades que deben modelarse dentro de un programa.
Cada dato que se obtenga será el resultado de efectuarle una consulta al objeto correspondiente.  
Así, para construir p.ej. un programa que maneja los permisos para una aplicación, cada usuario, recurso, rol, etc., estará representado por un objeto.
Para saber si un usuario tiene acceso a un recurso, una forma posible es haciéndole una consulta al objeto que representa al recurso, pasando el (objeto que representa al) usuario como parámetro.  
Cada objeto puede mantener _referencias_ a otros objetos, y realizar consultas a los objetos que conoce de esta forma. En nuestro ejemplo, el objeto que representa a un usuario puede tener  mantener una referencia al (objeto que representa a) cada rol que tiene asignado, y consultarle p.ej. a qué recursos da acceso un rol.  
De esta forma, se configura una red (o grafo) de objetos que se conocen e interactúan entre sí. 
El procesamiento surge de esta interacción entre objetos, disparada por una consulta inicial que se hace a uno de ellos. 

En la **programación funcional**, el concepto más relevante es el de _función_, entendida desde un punto de vista matemático: recibe ciertos parámetros, entrega una respuesta.  
La información se estructura mediante listas y tuplas. El procesamiento ocurre aplicando funciones, donde la información a manejar se pasa como parámetro.  


## La potencia está en la combinación
Luego de una etapa de apasionados debates sobre "cuál es el mejor paradigma", el consenso de la industria ha tomado la (sabia) decisión de integrar fortalezas de ambos paradigmas en el desarrollo de software.

Esta decisión se refleja en varios de los lenguajes de programación más utilizados actualmente, que permiten combinar las estructuras básicas de la programación orientada a objetos con técnicas surgidas de la programación funcional.  
Entre estos lenguajes mencionamos a Python, Java, JavaScript y Swift.


