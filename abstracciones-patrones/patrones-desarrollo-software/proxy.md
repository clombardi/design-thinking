# Proxy
(imagen que represente "hablar con un proxy")  
![imagen que represente "hablar con un proxy"](https://refactoring.guru/images/patterns/diagrams/proxy/solution-en.png) 

## Objetivo
Proveer un objeto sustituto, o sea un _proxy_, que controla el acceso a un objeto determinado. De esta forma, se pueden realizar acciones antes o después de realizar un pedido al objeto original, o "proxeado".  
Esto se realiza de forma transparente para los usuarios del objeto, que en realidad acceden al _proxy_ sin ser conscientes de su existencia.


## Motivación
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


## Ejemplo
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
    def __init__(self, _referencia_al_usuario_real):
        self.usuario_real = None
        self.referencia_al_usuario_real = _referencia_al_usuario_real
        
    def inicializar_objeto_real(self):
        if self.usuario_real == None:
            self.usuario_real = UsuarioDeDirectorio(self.referencia_al_usuario_real)

    def tiene_permiso_especial(self, recurso):
        inicializar_objeto_real()
        return self.usuario_real.tiene_permiso_especial(recurso)
```


## Técnicas involucradas
Como se ve en los extractos de código incluidos, el proxy debe mantener una referencia al objeto real.  
En muchos casos, también se debe mantener una referencia separada, a información que permita crear o configurar el objeto real en el momento oportuno.

Si el proxy se establece para demorar la configuración de los objetos originales hasta su primer uso efectivo, se utiliza la técnica de _inicialización perezoza_ (_lazy initialization_) utilizada en el último ejemplo: la referencia al objeto real está en principio vacía (`None`), y cambia al objeto en el momento en que se crea efectivamente.


