---
layout: default
---

# Pair programming
Al igual que la política de [Collective Code Ownership](./collective-code-ownership) que presentamos en la sección anterior, **Pair Programming** es una propuesta que apunta a la organización del equipo de desarrollo, surgida como parte de _XP_. 

La idea básica del _Pair Programming_ es la que indica su nombre: para algunas de las tareas de diseño y producción de código que requiere un proyecto (o eventualmente, para todas ellas), definir que cada una sea llevada a cabo por dos personas que _trabajan juntas_, incluso físicamente sentándose una al lado de la otra, compartiendo una misma pantalla y trabajando en cada momento sobre la misma sección de código o problema.  
Notamos que la propuesta del Pair Programming es más específica que la de asignar cada tarea a dos personas.
La intención es que los dos integrantes del par trabajen _en conjunto_, lo que favorece la interacción constante entre los mismos.

(acá puede ir una imagen sobre "dos personas sobre la misma pantalla")  
![imagen sobre "dos personas sobre la misma pantalla"](../images/logoelevate.jpg)

Esta propuesta apunta a _dos objetivos principales_: elevar la calidad del código generado, y al mismo tiempo, la cohesión y nivel de conocimiento del equipo de trabajo.  
La concepción del Pair Programming refleja la _relevancia de los aspectos interpersonales y sociales_ para el éxito de un proyecto de software: al establecer que dos personas deben trabajar juntas, se generan situaciones que requieren el fortalecimiento de las capacidades de interacción y comunicación dentro del equipo de desarrollo.

En esta sección, describimos las distintas formas o variantes que puede adoptar esta práctica de trabajo junto con algunas técnicas asociadas; y presentaremos las consecuencias principales derivadas de su adopción.


## Organización del Pair Programming
El esquema más difundido para implementar Pair Programming se basa en la definición de dos roles que se designan como _driver_ y _navigator_, en analogía con los roles de piloto y navegante que encontramos p.ej. en las competencias de rally.
De las dos desarrolladoras que componen un par, una asumirá el rol de driver y la otra el de navigator.

El driver es quien realiza el tipeo del código que se va generando, para lo cual tiene el control del teclado (así como el piloto de rally es quien tiene a cargo el volante del auto).  
Por su parte, el navigator asume un rol de observador con una mirada más amplia, que le permite analizar y proponer alternativas acerca de las próximas unidades y componentes de código que deben definirse, realizando una planificación de corto alcance acerca de la codificación. Asimismo, revisa el código a medida que el driver lo va generando, previendo posibles defectos.  
Se considera que el navigator proporciona una mirada estratégica acerca del código que se está construyendo, lo que libera al driver permitiéndole asumir una visión táctica, focalizada en cada línea que se va generando. Esto reduce las posibilidades de errores de tipeo o lógica a medida que se genera el código, y facilita una dinámica más ágil en la codificación.

En general, se recomienda que los roles de driver y navigator roten con frecuencia, idealmente varias veces en el día, para evitar la pérdida de atención que puede generar el rol de navigator si se mantiene por períodos largos.

Una variante sobre este esquema básico es el llamado _strong-style pairing_, en el que una persona que cuenta con un bajo nivel de conocimiento en algún aspecto relevante (el lenguaje de programación utilizado, alguna librería o framework que se utilice en el componente que se está desarrollando, o la funcionalidad que debe implementarse), o bien con poca experiencia, se empareja con una desarrolladora que cuenta con un mayor grado de conocimiento o desarrollo profesional.  
En esta variante, se recomienda asignar el rol de piloto al integrante más inexperto; el navegante provee información y sugerencias que guían el trabajo del piloto.
De esta forma, se genera un entorno de _aprendizaje activo_, en el que quien asume el rol de driver va adquiriendo conocimientos y/o experiencia mediante la práctica, que es asistida por el rol del navigator.

También mencionamos otro esquema posible para el Pair Programming, al que se conoce por el nombre de _Ping Pong_. 
En este esquema, una de las dos integrantes del par genera un test para un componente o unidad de código a construirse (Ping), y la otra provee posteriormente una implementación (Pong) que satisface las condiciones del test. Los roles de generadora de test y de implementación se alternan en cada iteración de "Ping-Pong".
Esta variante representa una forma de implementar las ideas de [Test-driven development](../testing/testing-software/tdd) mediante Pair Programming.

