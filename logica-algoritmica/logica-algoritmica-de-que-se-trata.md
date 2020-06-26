# "Lógica algorítmica" - de qué se trata, por qué nos interesa

En esta unidad, cuyo título es tal vez (admitámoslo) un poco pomposo, intentaremos describir algunos elementos (conceptos, técnicas, herramientas) que utilizan las desarrolladoras en su trabajo diario. Vamos a focalizar sobre aspectos bien cercanos al código.

En la unidad 1 tratamos brevemente cuestiones de este estilo, al hablar de la [diferencia entre programar y desarrollar](../programacion-a-desarrollo/programar-y-desarrollar.md), y en particular, al resolver un requerimiento concreto mediante dos programas, uno [construido con visión de programador](../programacion-a-desarrollo/programar-y-desarrollar-ejemplo-prog.md) y otro [con visión de desarrollador](../programacion-a-desarrollo/programar-y-desarrollar-ejemplo-dev.md).  
En ese material, se mostró la gran diversidad de enfoques para construir un programa que resuelva un problema dado, y la conveniencia de aplicar las actitudes asociadas a lo que llamamos "visión de desarrollador".

En [un apéndice](../programacion-a-desarrollo/programar-y-desarrollar-ejemplo-apendice.md), nos concentramos en un análisis típico del trabajo con un programa: cómo ir transformando iterativamente el código para llegar a una forma que es, a la vez, más compacta y más clara.  
Uno de los focos que queremos darle a esta unidad es profundizar en este tipo de razonamientos.


## Aplicación a las tareas de operaciones - automatización
En la unidad 1, mencionamos (e intentamos justificar) la relevancia de adquirir capacidades de desarrollo para el trabajo en operaciones, debido a la tendencia creciente a la **automatización** de tareas de gestión de recursos IT.

Puntualizemos una vez más, las motivaciones para elevar nuestras capacidades en el ámbito de la automatización, como profesionales IT.

Por un lado, el establecimiento de dinámicas de construcción de software que incorporan el concepto de _desarrollo continuo_ (mencionado al hablar sobre [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida.md)), la tendencia a organizar las aplicaciones como federaciones de múltiples componentes, y los múltiples requerimientos de operaciones provocados por varias de las [tareas involucradas en el desarrollo](../programacion-a-desarrollo/construccion-tareas-roles.md), provocan un enorme flujo de pedidos de tareas de operaciones.  
En este contexto la automatización, lejos de ser un factor que puede disminuir la relevancia o necesidad del trabajo de operaciones IT, resulta un aliado fundamental para poder responder a las demandas de los proyectos de desarrollo actuales, y por lo tanto constituir el factor diferencial que realza la valoración de este trabajo.

Por otro, y ya en forma independiente de visiones u opiniones, la automatización es una tendencia que está avanzando con mucha fuerza, por lo cual, contar con estos conocimientos está pasando de ser un skill opcional a ser requerido.


## De scripts ... a programas
Un elemento básico de la automatización en tareas de operaciones es la construcción de _scripts_, que son ... ¿_qué_ son los scripts?

En una primera mirada, los podemos pensar como secuencias de instrucciones de línea de comandos, que se agrupan en un archivo para evitar la molestia de tener que escribirlas una por una, y que pueden ser útiles para configurar schedulers u otras herramientas de administración.

Pero a medida que las tareas que debemos realizar se van complejizando, vemos que los scripts, y los lenguajes de programación que se utilizan (bash, PowerShell, etc.)  incorporan más elementos: alternativas, loops, funciones.  
Y también surge la alternativa de utilizar _lenguajes de programación de propósito general_, p.ej. Python, para escribir scripts.

En suma, observamos que los scripts van tomando más y más elementos que se pensaban propios de los "programas". Es que actualmente, _los scripts no son otra cosa que programas_.  
Se conciben y desarrollan dentro de un ámbito específico como son las tareas de operaciones IT, son ejecutados típicamente desde línea de comandos (o procesos análogos), pero no por eso dejan de ser programas.

Es por esto, específicamente, que la adquisición de capacidades propias de las tareas de programación, o con una visión más amplia, de desarrollo, ayudan a elevar las capacidades de las profesionales IT.  
Este tipo de capacidades nos permitirá, por un lado, _ampliar el rango_ de los problemas que podemos abordar mediante scripts.  
Y tal vez más importante, nos ayudará a generar _productos de mayor calidad_ en varios sentidos: más fáciles de modificar, más confiables al tener tests automáticos, con más posibilidades de generar librerías y funciones que pueda reutilizar en distintos scripts.  