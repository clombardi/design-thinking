---
layout: default
---

# Programación Orientada a Objetos - una aproximación

En esta página, vamos a presentar algunos conceptos básicos de la **Programación Orientada a Objetos (POO)**, tal vez el [paradigma de programación](./lenguajes-paradigmas) más influyente actualmente en la industria del software.

No pretendemos dar una descripción completa de este paradigma, sino solamente brindar una aproximación parcial, destacando los elementos que utilizaremos luego al mencionar patrones en desarrollo de software.  
Quienes estén interesado en un panorama más completo, pueden consultar el [libro clásico de Bertrand Meyer](https://www.amazon.com/-/es/Bertrand-Meyer/dp/0136291554), o el material más conciso que conforma la [serie de apuntes utilizados en varias universidades argentinas](https://www.wollok.org/documentacion/apuntes/).

Antes de comenzar, una pequeña puntualización. La POO admite varias variantes, que ponen énfasis en distintos conceptos y presentan diferencias en las formas de organizar el código que forma un programa o aplicación.  
Aquí presentaremos los elementos básicos de la versión más difundida del paradigma, en la que es preponderante el concepto de _clase_.

Incluiremos extractos de código en el lenguaje Python, que hemos utilizado en la unidad sobre [lógica algorítmica](../../logica-algoritmica/logica-algoritmica.index).


## Modelo basado en objetos
En la [página anterior](./lenguajes-paradigmas), mencionamos que los elementos básicos que conforman un programa en la POO son los _objetos_, y que el procesamiento surge de la interacción entre estos objetos, que están vinculados formando una red a partir de _referencias_.  
También indicamos que cada objeto será capaz de responder a determinadas consultas. 

En el ejemplo esbozado sobre manejo de permisos, indicamos que una forma posible de organizar el programa correspondiente es definir un objeto para cada recurso, para cada usuario, para cada rol, etc..   
Para saber si un usuario tiene acceso a un recurso, podemos hacer una consulta al (objeto que representa al) recurso, pasándole el (objeto que representa al) usuario como parámetro. La consulta podría tener esta forma:
``` python
recurso_X.tiene_acceso(usuario_Z)
``` 
suponiendo que el valor de la variable `recurso_X` es un objeto que representa a un recurso determinado, y análogamente para `usuario_Z`.  
Lo que se describe aquí es que los objetos que representan recursos admiten una consulta llamada `tiene_acceso`, que espera un usuario, y responde con un valor de verdadero-o-falso.  
Esta consulta dispara la ejecución del código que evalúa las condiciones de acceso.

Aquí debe quedar claro que cada elemento, en nuestro caso cada recurso, cada usuario, cada rol, estará representado mediante un objeto _distinto_. Si tenemos 100 recursos, tendremos 100 objetos, uno que representa a _cada_ recurso. Lo mismo para usuarios, roles, etc..  
Siguiendo con el ejemplo, suponiendo que el usuario al que llamamos `usuario_Z`  tiene acceso al `recurso_X` pero no al `recurso_J`, la respuesta a la consulta anterior será `True`, mientras que si consultamos
``` python
recurso_J.tiene_acceso(usuario_Z)
``` 
obtendremos `False` como respuesta.

Las acciones que tengan efecto sobre el programa, p.ej. otorgar un rol a un usuario, se resolverán en forma similar. En el mismo modelo, la sentencia por el cual se otorga un rol a un usuario podría tener esta forma.
``` python
usuario_Z.otorgar_rol(rol_W)
``` 


## Clases: definición unificada para objetos similares
En prácticamente todos los modelos, existirán muchos objetos con características similares, porque representan entidades de un mismo tipo.  
Para el dominio que estamos usando como ejemplo, en los modelos más usuales, todos los objetos que representan recursos admitirán las mismas consultas (en el modelo propuesto, una de estas consultas es `tiene_acceso`).  
Además, dada una consulta determinada, todos los objetos que representan recursos responderán _aplicando la misma lógica_, esto es, ejecutando el mismo código.
En el ejemplo, la lógica que se aplica para definir si un usuario tiene acceso a un recurso, es la misma para todos los recursos.

En POO, una **clase** es la definición del comportamiento y estructura de uno o varios objetos, que son llamados **instancias** de esa clase.  
Una clase define:
- _atributos_, que especifican qué referencias a otros objetos va a mantener cada instancia; y
- _métodos_, que especifican qué interacciones (consultas y/o acciones) admite cada instancia, y cuál es el código que debe ejecutarse para cada uno.

Presentamos una versión muy sencilla de una posible clase para representar recursos.

``` python
class Recurso:
    def __init__(self):
        self.usuarios_habilitados = []

    def habilitar_usuario(self, usuario):
        self.usuarios_habilitados.append(usuario)

    def tiene_acceso(self, usuario):
        # código que resuelve el control de acceso
        # en esta implementación sencilla, sólo los usuarios expresamente habilitados
        # tienen acceso al recurso
        return usuario in self.usuarios_habilitados
```
Destaquemos los elementos incluidos en la clase
- un atributo llamado `usuarios_habilitados`, cuyo valor será una lista, presumiblemente de usuarios.  
Debe tenerse presente que _cada instancia tendrá sus propios valores_ para cada atributo. En este ejemplo, podremos tener varias instancias de la clase `Recurso`, cada una con **su** lista de usuarios habilitados, separada de las listas de los otros recursos.
- un método llamado `habilitar_usuario`, que recibe un usuario por parámetro (el `self` que aparece como primer parámetro se refiere al mismo recurso y no aparece en las invocaciones). Este método representa una acción: se agrega al usuario a la lista de usuarios habilitados.
- un método llamado `tiene_acceso`, que también recibe un usuario por parámetro. Este método implementa la lógica de control de acceso. En esta versión inicial, la condición es que el usuario por el que se consulta esté dentro de la lista de usuarios habilitados.


## Usando una clase
Presentemos ejemplos sencillos de cómo se utilizan las clases. En lo que sigue, supondremos la existencia de una clase `Usuario`.

Para utilizar una clase, debemos crear instancias. Todo lenguaje que incluye características de la POO, provee una sintaxis para crear una instancia de una clase determinada. En Python se escribe el nombre de la clase seguido de paréntesis. Por ejemplo, si en la consola ejecutamos

``` python
> recurso_X = Recurso()
```
el valor de la variable `recurso_X` será una instancia de `Recurso`, recién creada.

Para cerrar este primer ejemplo, creemos otros objetos de entre los mencionados más arriba, y lleguemos a realizar nuestras primeras consultas
``` python
> recurso_J = Recurso()
> usuario_Z = Usuario()
> recurso_X.habilitar_usuario(usuario_Z)
> recurso_X.tiene_acceso(usuario_Z)
True
> recurso_J.tiene_acceso(usuario_Z)
False
```

Este ejemplo nos permite ver el factor que permite que al hacer una misma consulta a dos instancias de la misma clase, se obtengan respuestas distintas.  
En este ejemplo, consultamos a los dos recursos definidos si el `usuario_Z` tiene acceso, uno responde `True` y el otro `False`. La razón para esta diferencia en las respuestas está en los _valores que tienen los atributos_ en cada instancia, lo que genera que tengan referencias a objetos distintos.  

En este caso, la diferencia es sencilla: cada recurso tiene una lista separada de usuarios habilitados, el `usuario_Z` está en la lista del `recurso_X`, pero no en la del `recurso_J`.  
En otros casos, la configuración de los valores de los atributos en cada instancia puede dar lugar a juegos más sutiles para configurar el comportamiento de un programa. Este es uno de los recursos que da lugar a la definición de patrones de diseño para POO.


## El foco pasa del programa al dominio
Los objetos definidos (recursos, usuarios, roles, etc.) configuran un _modelo del dominio de aplicación_, en este caso, de la información relevante para un sistema de permisos basado en roles.  
Obviamente, este no es el único modelo posible: entre las decisiones principales al diseñar un programa en la POO están las que definen las características del modelo de dominio.

Este sencillo ejemplo, alcanza para apreciar el cambio de foco que habilita la POO. En lugar de pensar en funciones, procedimientos, listas o registros, nuestra atención está puesta en el modelo de usuarios, recursos y roles, o sea, de los conceptos relevantes del _dominio de aplicación_.

Es de esta forma en que la POO permite elevar el nivel de nuestros modelos, con un mayor grado de abstracción respecto de los equipos de cómputo, y con el foco puesto en el problema a resolver.


## Contratos y protocolos en POO
Obviamente, lo mostrado hasta aquí es una sobre-simplificación sin ninguna pretensión de verosimilitud, configurada al solo efecto de obtener una presentación lo más concisa posible.

En aplicaciones reales, la lógica para resolver el control de acceso será mucho más compleja, pudiendo involucrar roles, cuotas u otras cusestiones.  
Un aspecto a destacar es que la complejidad que se agregue, puede respetar el **contrato** básico que hemos definido: 
> para consultar si un usuario tiene acceso a un recurso, se le hace al recurso la consulta `tiene_acceso`, con el usuario como parámetro.

En la POO, los **protocolos** se definen a partir de la especificación de qué consultas deben admitir ciertos objetos, y la forma de las respuestas a estas consultas.  
Es decir, los _elementos_ a los que aplica un protocolo son los objetos, y las _operaciones_ que define un protocolo son consultas (o acciones) que ciertos objetos deben soportar.

En este pequeño ejemplo, hemos definido un protocolo que incluye una única operación, la consulta `tiene_acceso`, que recibe un valor que representa un usuario, y cuya respuesta es un valor booleano. Los elementos que cumplen con este protocolo son los objetos que representan recursos.
