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
La concepción del Pair Programming refleja la _relevancia de los aspectos interpersonales y sociales_ para el éxito de un proyecto de software: al establecerse que dos personas deben trabajar juntas, se generan situaciones que requieren el fortalecimiento de las capacidades de interacción y comunicación dentro del equipo de desarrollo.

En esta sección, describimos las distintas formas o variantes que puede adoptar esta práctica de trabajo junto con algunas técnicas asociadas; y presentaremos las consecuencias principales que se derivan de su adopción.


## Organización del Pair Programming
El esquema más difundido para implementar Pair Programming se basa en la definición de dos roles que se designan como _driver_ y _navigator_, en analogía con los roles de piloto y navegante que encontramos p.ej. en las competencias de rally.
De las dos desarrolladoras que componen un par, una asumirá el rol de driver y la otra el de navigator.

(acá puede ir una imagen sobre "driver y navigator")  
![imagen sobre "driver y navigator"](../images/logoelevate.jpg)

El driver es quien realiza el tipeo del código que se va generando, para lo cual tiene el control del teclado (así como el piloto de rally es quien tiene a cargo el volante del auto).  
Por su parte, el navigator asume un rol de observador con una mirada más amplia, que le permite analizar y proponer alternativas acerca de las próximas unidades y componentes de código que deben definirse, realizando una planificación de corto alcance acerca de la codificación. Asimismo, revisa el código a medida que el driver lo va generando, previendo posibles defectos.  
Se considera que el navigator proporciona una mirada estratégica acerca del código que se está construyendo, lo que libera al driver permitiéndole asumir una visión táctica, focalizada en cada línea que se va generando. Esto reduce las posibilidades de errores de tipeo o lógica a medida que se genera el código, y facilita una dinámica más ágil en la codificación.

En general, se recomienda que los roles de driver y navigator roten con frecuencia, idealmente varias veces en el día, para evitar la pérdida de atención que puede generar el rol de navigator si se mantiene por períodos largos.

Una variante sobre este esquema básico es el llamado _strong-style pairing_, en el que una persona que cuenta con un bajo nivel de conocimiento en algún aspecto relevante (el lenguaje de programación utilizado, alguna librería o framework que se utilice en el componente que se está desarrollando, o la funcionalidad que debe implementarse), o bien con poca experiencia, se empareja con una desarrolladora que cuenta con un mayor grado de conocimiento o desarrollo profesional.  
En esta variante, se recomienda asignar el rol de piloto al integrante más inexperto; el navegante provee información y sugerencias que guían el trabajo del piloto.
De esta forma, se genera un entorno de _aprendizaje activo_, en el que quien asume el rol de driver va adquiriendo conocimientos y/o experiencia mediante la práctica, que es asistida por el rol del navigator.

También mencionamos otro esquema posible para el Pair Programming, al que se conoce por el nombre de _Ping Pong_. 
En este esquema, una de las dos integrantes del par genera un test para un componente o unidad de código a construirse (Ping), y la otra provee posteriormente una implementación (Pong) que satisface las condiciones del test. Los roles de generadora de test y de implementación se alternan en cada iteración de "Ping-Pong".
Esta variante representa una forma de implementar las ideas de [Test-driven development](../testing/testing-software/tdd) en un entorno que aplica Pair Programming.

(acá puede ir una imagen sobre "ping pong en pair programming")  
![imagen sobre "ping pong en pair programming"](../images/logoelevate.jpg)


## Prácticas y riesgos asociados al Pair Programming
Respecto del impulso a la interacción dentro de un equipo de desarrollo, la propuesta de Pair Programming puede complementarse con la de realizar, de forma regular, _rotaciones_ dentro del equipo. 
En el contexto de Pair Programming, esto significa que en algunos pares, se producirá el reemplazo de uno de sus integrantes por otro proveniente de otro par. Esta idea de rotación regular aparece en XP con el nombre de "moving people around". 
Un efecto adicional de la combinación de Pair Programming y rotaciones, es que fomenta en gran medida la difusión de conocimientos y experiencias dentro del equipo, en línea con la propuesta de [Collective Code Ownership](./collective-code-ownership) descripta en una sección anterior.   
Se recomienda que, si un determinado par de desarrolladoras esté resolviendo una funcionalidad o tarea compleja, una de sus integrantes permanezca asignada a la misma, no siendo afectada por las rotaciones. Esta práctica se asocia a la idea de "dejar un ancla" respecto de la tarea o funcionalidad que se está desarrollando.

Por otra parte, la literatura sobre Pair Programming describe distintos riesgos asociados a esta práctica, junto con propuestas que apuntan a mitigarlos.

Algunos de estos riesgos están relacionados con el _ritmo de trabajo_.  
Una característica del trabajo en conjunto es que ayuda a evitar distracciones o situaciones de procastinación, a las que es proclive el trabajo en solitario, manteniendo el foco en forma continua sobre la tarea que se está llevando a cabo.
A la vez que se eleva la productividad, esta práctica también puede resultar agotadora. Para mitigar este efecto, se propone organizar la jornada laboral en períodos cortos, de no más de media hora, separados por pausas reales (p.ej. resolver asuntos laborales de naturaleza individual en los intervalos no se considera una pausa).  
Al mismo tiempo, la adopción de Pair Programming puede conllevar en los integrantes de los pares, una sensación de falta de tiempo para atender asuntos no relacionados con el trabajo en el par, como responder o enviar mails administrativos, participar en reuniones con temáticas distintas a las de la tarea que se está llevando a cabo en conjunto, o incluso asuntos particulares que deban atenderse. Teniendo esto en cuenta, se recomienda limitar la cantidad de tiempo en que se aplica Pair Programming durante la jornada laboral, por ejemplo imponiendo un máximo de 5 ó 6 horas por día (incluyendo las pausas mencionadas previamente) en una jornada laboral de 8 horas.

Algunas cuestiones ligadas a la _naturaleza de la interacción_ entre los integrantes de un par también deben ser tenidas en cuenta.  
En particular, debe mitigarse el riesgo de indicaciones hechas por el navigator con una frecuencia excesiva, debida a la intención de señalar en forma prematura situaciones que percibe como problemáticas. Esta situación conspira contra un ritmo sostenido en el trabajo del driver.
Para ello, se recomienda que el navigator se tome un tiempo para asegurarse de que aquello que percibe como un problema o potencial defecto, no proviene en realidad de una comprensión insuficiente de las intenciones del driver, comprensión que se completa a medida que el driver avanza con la redacción de código. Esto provoca una dinámica en la que las contribuciones del navigator resultan más certeras y útiles.

Finalmente, creemos oportuno mencionar que la adopción de Pair Programming en un equipo de desarrollo puede conllevar un _tiempo de adaptación_ a este esquema de trabajo, principalmente por cuestiones ligadas a las características personales de sus integrantes.   
En particular, la aplicación de Pair Programming implica la necesidad de mantener una interacción activa y frecuente con una colega, incluyendo la formulación, debate y eventual aceptación de sugerencias y alternativas, prácticas a las cuales muchos desarrolladores están insuficientemente acostumbrados.
También deben manejarse situaciones de conflicto, si las integrantes de un par no logran un acuerdo acerca de cierta cuestión: debe aceptarse que una de las dos propuestas en danza debe ser la que se pruebe primero, para evitar un bloqueo en el trabajo del par.


