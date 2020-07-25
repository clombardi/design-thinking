# Patrones para desarrollo de software

> ## Nota para la edición
> La verdad, todo este texto sin dibujos es un engorro. El sitio [Refactoring Guru](https://refactoring.guru/) tiene un catálogo de patrones con dibujos que me gustan mucho. Linkeo un dibujo de cada patrón, supongo que habrá que "adaptarlo" para que no sea igual-igual.


## Singleton

(imagen que represente "todos hablan con el mismo")  
![imagen que represente "todos hablan con el mismo"](https://refactoring.guru/images/patterns/content/singleton/singleton.png) 

**Objetivo**  
Garantizar que haya un único representante (esto es, una única instancia) de una determinada clase, y proveer una forma sencilla de acceder a dicho representante.


**Motivación**  
Existen varios escenarios en los que se necesita, o se prefiere, evitar la existencia de varias instancias de una misma clase. 

Uno está relacionado con la necesidad de proveer un único punto de acceso para una funcionalidad. 
Un ejemplo es un sistema de control de acceso a determinados recursos por parte de un grupo de usuarios, en el que se establecen cuotas para evitar el uso indiscriminado.
Para solicitar un recurso para un usuario, se podría realizar una invocación de este estilo
``` python
control_de_acceso.obtener_recurso(usuario,recurso)
```
En este escenario, debemos garantizar la existencia de un único `control_de_acceso`, para garantizar que la cantidad de accesos se registre adecuadamente y se inhiba el acceso de un usuario a recursos para los que superó su cuota permitida.

En un sistema implementado usando POO, se puede definir una clase `ControlDeAcceso` de la que se garantiza una única instancia, accesible mediante la expresión `ControlDeAcceso.get_instance()`. El control se realiza mediante esta invocación
``` python
ControlDeAcceso.get_instance().obtener_recurso(usuario,recurso)
```
De esta forma se garantiza que en todos los casos, interviene _la misma_ instancia de la clase `ControlDeAcceso`, porque es la _única_ instancia de dicha clase.

Otro ejemplo típico está relacionado con la generación de una secuencia correlativa de identificadores. Debe asegurarse la existencia de un núnico generador, para garantizar que no se van a repetir identificadores. Se solicita un nuevo identificador mediante esta expresión.
``` python
nuevo_identificador = Generador.get_instance().generar_identificador()
```

En otros casos, simplemente la existencia de múltiples instancias resulta innecesaria, y se prefiere evitarla generando una única instancia globalmente accesible.  


**Ejemplo**  
En nuestro ejemplo sobre usuarios, recursos y permisos, la clase `PermisoHabilitadosDeLicencia` puede ser un Singleton; podemos manejarnos con una única instancia.  
Distinto es el caso de `PermisoUnDiaPorMes`, porque debemos tener distintas instancias correspondientes a cada posible día para el que establezca un permiso de este tipo.

Si efectivamente implementamos el patrón Singleton en esta clase, entonces para agregar este permiso en los usuarios `usuario_2` y `usuario_3`, procederemos de la siguiente forma
``` python
usuario_2.agregar_permiso_especial(PermisoHabilitadosDeLicencia.get_instance())
usuario_3.agregar_permiso_especial(PermisoHabilitadosDeLicencia.get_instance())
```

**Técnicas involucradas**  
Existen distintas técnicas que facilitan la definición de Singletons.  
Mencionamos algunos conceptos relacionados: métodos de clase (o estáticos), metaclases, objetos "compañeros" de una clase, prototipos.  


## Proxy
(imagen que represente "hablar con un proxy")  
![imagen que represente "hablar con un proxy"](https://refactoring.guru/images/patterns/diagrams/proxy/solution-en.png) 

**Objetivo**  
Proveer un objeto sustituto, o sea un _proxy_, que controla el acceso a un objeto determinado. De esta forma, se pueden realizar acciones antes o después de realizar un pedido al objeto original, o "proxeado".  
Esto se realiza de forma transparente para los usuarios del objeto, que en realidad acceden al _proxy_ sin ser conscientes de su existencia.


**Motivación**  
La aplicación de este patrón permite simplificar el diseño en varias situaciones típicas en el desarrollo de software.

Una es la existencia de objetos de uso poco frecuente, cuya configuración utiliza muchos recursos, y/o lleva mucho tiempo.  
Un manejo adecuado de estas situaciones requiere postergar la configuración hasta que el objeto sea efectivamente utilizado.  
Una técnica para lograr esto es que el objeto que se accede sea un _proxy_, que realiza las acciones de configuración cuando se solicita una operación por primera vez, y luego mantiene la referencia al objeto configurado para evitar repetir el proceso de configuración.

Otro caso, habitual en sitios Web, es la necesidad de resolver la tensión entre el deseo de mostrar una página rápidamente, y el tiempo de carga que puede ser elevado para páginas con mucha información y/o gráficos.  
Para resolver esta situación, se establece un _proxy_ para cada sección de la página cuya carga tome una cantidad relevante de tiempo. El proxy muestra un contenido esquemático, y lanza la operación de carga del objeto que representa el contenido real de la sección. 

(imagen de una página "a medio cargar")  
![imagen de una página "a medio cargar"](../../images/logoelevate.jpg) 

Cuando se completa la carga, delega en el objeto "real" la operación de mostrar el contenido correspondiente, lo que tiene el efecto de reemplazar en la página, el contenido esquemático por el real.

(imagen de la misma página después de que se termina la carga)  
![imagen de la misma página después de que se termina la carga](../../images/logoelevate.jpg) 


Un escenario distinto está relacionado con la necesidad de establecer cuotas de acceso a la funcionalidad provista por un objeto, y/o llevar estadísticas de uso, de una forma que resulte transparente para el diseño en el que ese objeto está involucrado.  
Es decir, que al invocar la operación requerida
``` python
objeto.operacion()
```
debe activarse el registro y control de cuotas de acceso (generando un error si se ha sobrepasado la cuota de utilización), y/o acumularse los datos estadísticos necesarios.  
Para manejar esta situación, el objeto invocado es en realidad un _proxy_ que lleva el registro y control de cuotas, y/o el registro de los datos de uso de los que se quiere llevar estadística, antes de invocar al objeto original.  

La siguiente es una implementación esquemática de un proxy con estas características. Notar que el proxy mantiene una referencia al objeto original, necesaria para poder delegarle la operación requerida.
``` python
class Proxy:
    def operacion():
        self.registrar_acceso_a_operacion()
        if (self.sobrepasa_cuota()):
            raise QuotaException("Quota exceeded")
        self.objeto_original.operacion()
        self.registrar_estadisticas_de_uso()        
```


**Ejemplo**  
En nuestro ejemplo sobre usuarios, recursos y permisos, algunos de nuestros usuarios podrían estar registrados en directorios externos, en donde la obtención de la información sobre un usuario puede ser costosa en tiempo. Los permisos de estos usuarios son manejados por el sistema de directorio, a partir de un identificador que se establece para cada recurso.  
A su vez, estos usuarios sólo acceden ocasionalmente a los recursos que manejamos.

Un equipo de trabajo que participa de nuestro proyecto, impleenta la clase `UsuarioDeDirectorio` que implementa la operación `tiene_permiso_especial(recurso)`.
``` python
class UsuarioDeDirectorio:
    def __init__(self, referencia):
        # proceso de configuración lento
        
    def tiene_permiso_especial(self, recurso):
        # implementación ligada al servicio externo de directorio
```

Para incorporar a estos usuarios sin necesidad de configurarlos hasta que efectivamente soliciten acceder a un recurso, definimos una clase Proxy.
``` python
class UsuarioDeDirectorioProxy:
    def __init__(self, referencia_al_usuario_real):
        self.usuario_real = None
        self.referencia_al_usuario_real = referencia_al_usuario_real
        
    def inicializar_objeto_real(self):
        if self.usuario_real == None:
            self.usuario_real = UsuarioDeDirectorio(self.referencia_al_usuario_real)

    def tiene_permiso_especial(self, recurso):
        inicializar_objeto_real()
        return self.usuario_real.tiene_permiso_especial(recurso)
```


**Técnicas involucradas**  
Como se ve en los extractos de código incluidos, el proxy debe mantener una referencia al objeto real.  
En muchos casos, también se debe mantener una referencia separada, a información que permita crear o configurar el objeto real en el momento oportuno.

Si el proxy se establece para demorar la configuración de los objetos originales hasta su primer uso efectivo, se utiliza la técnica de _inicialización perezoza_ (_lazy initialization_) utilizada en el último ejemplo: la referencia al objeto real está en principio vacía (`None`), y cambia al objeto en el momento en que se crea efectivamente.