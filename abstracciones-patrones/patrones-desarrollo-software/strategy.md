# Strategy
(acá Refactoring Guru me falló, hay que poner una imagen que sugiera "distintas estrategias para realizar una tarea, y una persona en el acto de elegir una")  
![imagen sobre estrategia](../../images/logoelevate.jpg) 


## Objetivo
Permitir la configuración de una determinada política relacionada con el comportamiento de un objeto, mediante la definición de objetos adicionales que representan cada posible opción.


## Motivación
La noción de política aplica a distintos dominios del "mundo real".

Por ejemplo, un comercio podría definir **distintas políticas de otorgamiento de descuentos** para sus clientes. Estos son algunos ejemplos.
- el 10% en todas las compras, 
- el 15% en compras que superen un valor, 
- nada, 
- el 5% si el valor total comprado por el cliente en los últimos 12 meses supera un valor, 
- el 15% para cierta línea de productos y el 8% para el resto. 

El comercio decide qué política utilizar para cada cliente, teniendo la libertad de _cambiar_ la política definida para un determinado cliente en cualquier momento.

En un dominio distinto, un banco podría definir distintas líneas de crédito, cada una con distinto **criterio de asignación** a un cliente: por nivel de ingresos, monto de transacciones con el banco, antigüedad como cliente, etc..

Otro ejemplo lo representa la política de **asignación de asientos en un aula para un examen** a medida que entran los estudiantes: de atrás hacia adelante, de izquierda a derecha, primero asientos pares y luego impares, etc.. Para cada examen podría definirse una política distinta.

En el desarrollo de software, además de los casos que resultan de modelar las situaciones descriptas y otras similares, existen situaciones ligadas a _algoritmos de decisión_. Mencionamos algunos ejemplos: 
- asignación de recursos a distintos procesos (misma cuota de recursos para todos los procesos, asignación de acuerdo a la prioridad del proceso, dar mayores recursos a procesos con menor tiempo previsto de ejecución, etc.),
- siguiente elemento a atender en una cola de mensajes, procesos, etc. pendientes (el más antiguo, el de mayor volumen, el de menor volumen, el de mayor prioridad, etc.), 
- servidor que va a atender un pedido en un load-balancer (por _round-robin_, intentar rutear los pedidos del mismo cliente al mismo servidor, intentar rutear los pedidos del mismo tipo de información al mismo servidor, etc.).


## Técnicas involucradas
Para ello, definiremos una nueva clase para cada criterio que se desee implementar. Estas clases deben resepetar _un nuevo_ contrato.

Esta es la implementación esquemática de tres posibles criterios para el ejemplo de descuento de clientes. El nuevo contrato, en este caso, corresponde a la operación `porcentaje_descuento(operacion)`.
``` python
class SinDescuento:
    def porcentaje_descuento(self, operacion):
        return 0

class DescuentoFijo:
    def __init__(self, porcentaje):
        self.porcentaje_fijo = porcentaje
    def porcentaje_descuento(self, operacion):
        return self.porcentaje_fijo

class CriterioSegunMontoDeLaOperacion:
    def porcentaje_descuento(self, operacion):
        return 15 if operacion.monto() > 1000 else 0
```
Se conoce como _strategies_ a los objetos creados a partir de estas clases.

Los objetos que deben aplicar el criterio (en los ejemplos anteriores, cada cliente del comercio, línea de crédito, o examen) deberán incluir una referencia a un strategy. Esta es una implementación esquemática del cliente al que pueden aplicar distintos criterios de cálculo de descuento.
``` python
class Cliente:
    def __init__(self):
        self.criterio_descuento = SinDescuento()

    def cambiar_criterio_descuento(self, nuevo_criterio):
        self.criterio_descuento = nuevo_criterio

    def calcular_importes(self, operacion):
        descuento_a_aplicar = self.criterio_descuento.porcentaje_descuento(operacion)
        # resto de la implementacion
```
Al crear un cliente se le puede asignar un criterio de cálculo de descuento, que luego puede ser modificado en cualquier momento. Al calcular los importes para una operación, el descuento a aplicar dependerá del criterio que tenga asignado en ese momento.  
Notamos que si a un cliente no se le asigna ningún criterio, utiliza una opción extrema: no aplicar ningún descuento en ningún caso. Esto está indicado en la inicialización del cliente.



## Ejemplo
En nuestro ejemplo sobre usuarios, recursos y permisos, puede definirse una condición adicional para que un usuario tenga acceso a un recurso: que no esté _inhabilitado_.

Hay distintos criterios de cuándo considerar que un usuario está inhabilitado:
- está inhabilitado si está de licencia.
- está inhabilitado si está sancionado, o si ha sido sancionado en los últimos 5 años.
- está inhabilitado si tiene menos de 6 meses de antigüedad.
- los criterios extremos: _nadie_ está inhabilitado, _todos_ están inhabilitados.

Para distintos recursos, podrán aplicar distintas políticas de cuándo se considera que un usuario está inhabilitado. 

Para aplicar el patrón Strategy, definimos un contrato que incluye únicamente la operación
``` python
esta_inhabilitado(usuario)
``` 
cuyo resultado es un valor booleano (o sea, `True` o `False`).

Cada criterio estará implementado como una clase que respeta el contrato definido.  
A continuación, presentamos el código correspondiente a dos criterios: uno extremo en el que nadie está inhabilitado, el otro que considera inhabilitados a los usuarios que están de licencia
``` python
class NadieInhabilitado:
    def esta_inhabilitado(self, usuario):
        return False

class InhabilitarUsuariosEnLicencia:
    def esta_inhabilitado(self, usuario):
        return usuario.esta_de_licencia
``` 


Esta es una posible implementación de la clase `Recurso` que incorpora la condición adicional, incluyendo una referencia a un criterio de inhabilitación.
``` python
class Recurso:
    def __init__(self):
        self.usuarios_habilitados = []
        self.criterio_inhabilitacion = NadieInhabilitado()

    def cambiar_criterio_inhabilitacion(self, nuevo_criterio):
        self.criterio_inhabilitacion = nuevo_criterio

    def habilitar_usuario(self, usuario):
        self.usuarios_habilitados.append(usuario)

    def tiene_acceso(self, usuario):
        # se contemplan permisos especiales, más whitelist por recurso
        puede_en_principio = (usuario in self.usuarios_habilitados) or \
            usuario.tiene_permiso_especial(self)
        return puede_en_principio and not self.se_considera_inhabilitado(usuario)

    def se_considera_inhabilitado(self, usuario):
        return self.criterio_inhabilitacion.esta_inhabilitado(usuario)
``` 

Si creamos un recurso sin asignarle ningún criterio, utilizará `NadieInhabilitado`, que no considera inhabilitado a ningún usuario.
``` python
>>> recurso_A = Recurso()
>>> usuario_1 = Usuario()
>>> usuario_2 = Usuario()
>>> usuario_2.entrar_en_licencia()
>>> recurso_A.habilitar_usuario(usuario_1)
>>> recurso_A.habilitar_usuario(usuario_2)
>>> recurso_A.tiene_acceso(usuario_1)
True
>>> recurso_A.tiene_acceso(usuario_2)
True
```
En un momento posterior, podemos cambiar el criterio del `recurso_A`, para que considere inhabilitados a los empleados que estén de licencia, lo que genera una modificación en el comportamiento del recurso.
``` python
>>> recurso_A.cambiar_criterio_inhabilitacion(InhabilitarUsuariosEnLicencia())
>>> recurso_A.tiene_acceso(usuario_1)
True
>>> recurso_A.tiene_acceso(usuario_2)
False
```
Bajo este nuevo criterio, el usuario que está en licencia ya no tiene acceso.
