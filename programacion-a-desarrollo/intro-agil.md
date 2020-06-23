# Marcos de trabajo ágiles
Desde hace ya varios años, la comunidad de desarrollo de software está crecientemente atravesada por lo que podemos llamar _fenómeno ágil_: se habla de prácticas, metodologías, filosofía, rituales, roles en un equipo, prácticas del día a día, relacionados de alguna forma a la palabra "ágil".  
Hoy en día, es natural e incluso esperado, que un proyecto se desarrolle  (o en todo caso, que _declare_ que se desarrolla) dentro de un marco de trabajo o metodología ágil; esta forma de trabajar se ha transformado en el _estándar de facto_ de la industria del software.  

En esta sección, describiremos ideas y conceptos relacionados con los marcos de trabajo ágiles que, a nuestro entender, tienen un efecto positivo concreto al aplicarse en proyectos de desarrollo.  
De esta forma, intentamos extraer el valor que efectivamente puede brindar la adopción de conceptos ágiles, apartándonos de la proliferación de discursos, etiquetas y lugares comunes que suelen acompañar a cualquier palabra o idea de moda en el ámbito de la industria IT (o en cualquier otro).

Entendemos que este material resulta de utilidad para los (y las) profesionales de operaciones IT, indicando dos motivaciones principales para ello.  
Una es ampliar la comprensión de la forma en que se llevan a cabo las tareas involucradas en el desarrollo de software, que de acuerdo a lo descripto en secciones anteriores, están crecientemente interrelacionadas con el ámbito de operaciones.  
La otra (que no por mencionarse en segundo término es menos relevante) es que las ideas, conceptos y técnicas que vamos a introducir en lo que sigue, pueden ser de utilidad para realizar la transición hacia una _mirada DevOps_, es decir, pueden colaborar con el proceso de incorporación de características y técnicas propias del desarrollo en el trabajo de operaciones.


## Respuesta a problemas reales
Los elementos que forman parte de los marcos de trabajo ágiles surgieron como respuesta a problemáticas que se percibían con fuerza en el ámbito de la construcción de software.

Una es la _superabundancia de documentación_ de distinto tipo que carcteriza a formas de trabajo utilizadas anteriormente, que implica un enorme inversión, y en muchos casos no ha otorgado las garantías esperadas de confiabilidad en los productos de software generados.  
En particular, mencionemos que garantizar la consistencia de una documentación voluminosa resulta una tarea muy compleja, y que asegurar que una aplicación cumple a detalle con lo indicado en una documentación minuciosa puede resultar un esfuerzo de magnitud superior al del mismo desarrollo.  
A esto se suma la facilidad con que la documentación queda _desactualizada_, en el entorno crecientemente cambiante que caracteriza a muchos negocios, o en general ámbitos de aplicación.

Otro problema que se manifestaba frecuentemente, es la _falta de capacidad para prever el esfuerzo_ necesario para la construccion de aplicaciones que realmente satisficieran las necesidades que las motivaron. En muchos casos, los plazos previstos al principio de de un proyecto, resultaron ser _enormemente_ (incluso en órdenes de magnitud) inferiores a los que efectivamente llevó el desarrollo.

Finalmente, mencionamos que el clima creado por formas de trabajo demasiado apegadas a documentación con alto grado de obsolescencia, y regidas por plazos patentemente incumplibles, llevaba en muchos casos a la _insatisfacción_ de los desarrolladores con la forma y los resultados de su trabajo, lo que tiene un efecto fatal sobre la calidad del software producido.

En resumen, podemos concluir que el énfasis puesto en garantizar a priori el éxito de un proyecto de desarrollo, conspiraba en gran medida contra la misma probabilidad de éxito.  

### Concepción del "movimiento ágil"
Lo que se dio en llamar "movimiento ágil" surge como respuesta ante este estado de cosas, con la intención de elevar el nivel de satisfacción de todos los involucrados en un proyecto de desarrollo, incluyendo a usuarios y equipo de trabajo.

Los problemas recién descriptos, se reformulan en los siguientes tres ítems que configuran el punto de partida para pensar una forma distinta de encarar el desarrollo de software. 

1. **Ya es casi obvio que los requerimientos generalmente cambian con el tiempo.**  
Cuando pasa el tiempo, para nuestro producto o servicio pueden surgir cambios regulatorios, cambios en la organización, en el mercado, en las prioridades, etc. También suele ocurrir que a medida que se desarrolla el alcance, se va entendiendo mejor la problemática y la necesidad de la organización. Adicionalmente es común que los interesados definan mejoras que no habían identificadas de antemano. Este punto fue mencionado al hablar sobre [ciclo de vida](./ciclo-de-vida.md) en una sección anterior. 

1. **El objetivo del trabajo debe ser crear valor más que el cumplimiento de un plan o metas inicialmente definidas.**  
En algunos casos puede ser más importante adaptarnos a un cambio reciente o que se agreguen algunas funcionalidades importantes que se propusieron luego de una premisa inicial, en lugar de terminar en fecha y con el presupuesto acordado.

1. **Es casi imposible crear lo mejor con un solo intento.**  
En este sentido es fundamental pensar el desarrollo como un camino de aprendizaje, donde es necesario poder tener feedback para ir descubriendo, cual es la mejor forma de avanzar


## En qué consiste "lo ágil" - principios y actitudes
La dificultad para incorporar marcos de trabajo ágiles no se da por cuestiones de complejidad; en muchos casos se trata de conceptos de sentido común cuya comprensión resulta sencilla.  
Lo complejo está en _cómo_ aplicar estos conceptos. Debe comprenderse que "Agile" es una "filosofía de trabajo". Bajando a tierra esta idea de "filosofía", diremos que se trata (como lo indica el título de esta sección) de un _marco_, en el sentido de "forma en que encaramos el trabajo". _

Comencemos describiendo algunos **principios** que guían a la forma de trabajo ágil.
- Pensar en _causas y efectos_, antes que en métodos y herramientas.
- Tener como foco principal en incrementar la _satisfacción del usuario_.
- _Aprender_ constantemente, comprender que un proyecto de desarrollo tiene una parte de experiencia de aprendizaje, sobre cuestiones de software y también de aspectos del dominio para el cual se están construyendo aplicaciones.   
La conveniencia de realizar iteraciones frecuentes se deriva de este principio: brinda la oportunidad para aprovechar rápidamente (_ágilmente_) los conocimientos adquiridos en el marco del mismo proyecto.
- Mantener a la _calidad_ como un valor clave en nuestro trabajo.

De estos principios básicos, se derivan algunas **actitudes** que se recomienda que formen parte de nuestra forma de trabajo, tanto al nivel macro de la visión de un proyecto, como en el día a día de cada integrante de un equpo de trabajo.
- Enfocar el esfuerzo en la _creación de valor desde el estadío más temprano_ posible. Esto es, tener lo antes posible algo simple que funcione y luego ir evolucionándolo.
- _Sumar a la comunidad de usuarios_ como parte del proceso. Si se trata de un trabajo hecho para nosotros mismos, es conveniente compartirlo con otros para asegurarnos que la utilidad de lo que producimos no se agote en nuestro pequeño ámbito, propendiendo a la creación de productos de mayor riqueza.
- _Aceptar la incertidumbre_, organizando el trabajo a partir de las ideas de _iteración sucesiva_ y _adaptación_. Esta actitud implica entender que, muy probablemente, no podamos definir con anterioridad todo lo que involucra la construcción de una aplicación, sino que (nuevamente) debemos apoyarnos en el concepto de evolución como guía del desarrollo.
- Maximizar el _aporte humano_ (como la creatividad y la innovación) invirtiendo en las personas y sus interacciones.

Subrayamos un factor que subyace a estos principios y actitudes: abandonar la búsqueda de una sensación de seguridad (que como lo indicamos en el parágrafo anterior, resulta falsa en la mayor parte de los casos), apuntando a la generación continua de valor a partir de las ideas de evolución y descubrimiento.


## Gestión ágil
A partir de los principios y actitudes mencionados, llegamos a los **métodos de gestión** ágiles.

La gestión ágil tiene como meta principal entregar un producto o un resultado con el mayor valor posible para un cliente en un tiempo definido, esto se conoce como _time-box_.

En general la forma de lograr esto se basa en emplear un aprendizaje y mejoramiento veloz y eficiente, que por lo general involucra un ciclo de vida iterativo e incremental.  
_Iterativo_ ya que se sigue una secuencia de etapas cortas que terminan con la entrega de una porción del producto terminada o un resultado parcial alcanzado.  
_Incremental_, porque a cambio de entregar “todo o nada” se realizan entregas que construyen sobre lo ya construido con anterioridad (incrementales) con el fin también de reducir el riesgo y la incertidumbre a partir de la propia forma de construcción.

Esta forma de trabajar está estrechamente vinculada a la idea de _ciclo de vida_ descripta en una [sección anterior](./ciclo-de-vida.md).  
Destacamos que facilita la validación, detección de problemas y ajustes en forma temprana, al definir pequeñas unidades de funcionalidad y entregarlas en plazos breves.  
Además, permite ir descubriendo cuáles son las funciones o elementos que aportan más valor al cliente a medida que se entregan las porciones del producto en cada iteración; e incorporar cambios provenientes del feedback del cliente sobre el uso real del producto o servicio.  

Se contrapone con el seguimiento de un plan preestablecido para llegar a un objetivo que se supone conocido de antemano, postergando la validación hasta luego de concluir el desarrollo. 

