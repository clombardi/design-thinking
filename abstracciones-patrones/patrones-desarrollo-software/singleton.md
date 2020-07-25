# Singleton

(imagen que represente "todos hablan con el mismo")  
![imagen que represente "todos hablan con el mismo"](https://refactoring.guru/images/patterns/content/singleton/singleton.png) 

## Objetivo
Garantizar que haya un único representante (esto es, una única instancia) de una determinada clase, y proveer una forma sencilla de acceder a dicho representante.


## Motivación
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


## Ejemplo
En nuestro ejemplo sobre usuarios, recursos y permisos, la clase `PermisoHabilitadosDeLicencia` puede ser un Singleton; podemos manejarnos con una única instancia.  
Distinto es el caso de `PermisoUnDiaPorMes`, porque debemos tener distintas instancias correspondientes a cada posible día para el que establezca un permiso de este tipo.

Si efectivamente implementamos el patrón Singleton en esta clase, entonces para agregar este permiso en los usuarios `usuario_2` y `usuario_3`, procederemos de la siguiente forma
``` python
usuario_2.agregar_permiso_especial(PermisoHabilitadosDeLicencia.get_instance())
usuario_3.agregar_permiso_especial(PermisoHabilitadosDeLicencia.get_instance())
```

## Técnicas involucradas
Existen distintas técnicas que facilitan la definición de Singletons.  
Mencionamos algunos conceptos relacionados: métodos de clase (o estáticos), metaclases, objetos "compañeros" de una clase, prototipos.  


