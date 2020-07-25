# Composite
(imagen que represente "objeto compuesto en forma de árbol")  
![imagen que represente "objeto compuesto en forma de árbol"](https://refactoring.guru/images/patterns/diagrams/composite/problem-en.png) 


## Objetivo
Representar una estructura de árbol mediante la composición de objetos, de forma tal de que se pueda tratar con objetos individuales y objetos compuestos en forma uniforme.


## Motivación
Las estructuras en forma de árbol aparecen frecuentemente en las situaciones que son modeladas por aplicaciones informáticas. 

Un caso común es el modelado de **procesos** que se definen componiendo varios subprocesos, de los cuales algunos a su vez se componen de acciones más simples.  
Por ejemplo, el despliegue de una aplicación (proceso principal) puede involucrar la instalación de uno o varios servidores (subprocesos), lo que implica instalar un sistema operativo y varias aplicaciones (acciones simples). A su vez, la instalación de una aplicación puede conllevar varios pasos, lo que configura un esquema con varios niveles de subprocesos.

(imagen que remita a procesos y subprocesos)  
![imagen que remita a procesos y subprocesos](../../images/logoelevate.jpg) 


**Objetos que se componen de partes**, donde en algunas partes son a su vez el resultado de ensamblar partes más sencillas. Un ejemplo típico es un modelo de un auto, una de cuyas partes es un motor, que a su vez se compone de partes más sencillas.

(imagen de partes de un auto)  
![imagen de partes de un auto](../../images/logoelevate.jpg) 


## Ejemplo
En nuestro ejemplo sobre usuarios, recursos y permisos, puede resultar de utilidad la definición de _recursos compuestos_, o sea agrupamientos de recursos. 
Un usuario tendrá acceso a un recurso compuesto, sólo si puede acceder a cada uno de sus componentes en forma separada.

De esta forma, se puede definir un recurso que presente una vista consolidada de cierta información, de forma tal que sólo tengan acceso a ella las usuarias que puedan acceder, en forma separada, a cada una de las partes de la información consolidada.

La siguiente clase Python es un modelo sencillo de un recurso compuesto
``` python
class RecursoCompuesto:
    def __init__(self, _recursos_individuales):
        self.recursos_individuales = _recursos_individuales

    def tiene_acceso(self, usuario):
        return all(recurso.tiene_acceso(usuario) for recurso in self.recursos_individuales)
```

Esta clase nos permite definir un recurso compuesto por otros, como se muestra en el siguiente ejemplo.
``` python
>>> recurso_A1 = Recurso()
>>> recurso_A2 = Recurso()
>>> usuario_1 = Usuario()
>>> usuario_2 = Usuario()
>>> recurso_A1.habilitar_usuario(usuario_1)
>>> recurso_A1.habilitar_usuario(usuario_2)
>>> recurso_A2.habilitar_usuario(usuario_2)
>>> recurso_A = RecursoCompuesto([recurso_A1, recurso_A2])
>>> recurso_A.tiene_acceso(usuario_1)
False
>>> recurso_A.tiene_acceso(usuario_2)
True
```
En este ejemplo, definimos un `recurso_A` compuesto a partir de `recurso_A1` y `recurso_A2`.  
El `usuario_1` no tiene acceso al recurso compuesto, porque sólo puede acceder a uno de sus componentes. El `usuario_2` sí, porque tiene acceso a los dos componentes de `recurso_A`.

Destacamos que los recursos compuestos, a su vez, pueden formar parte de otros recursos compuestos más complejos, formándose la estructura de árbol a la que se refiere el patrón Composite. Si a partir del ejemplo anterior continuamos de esta forma.
``` python
>>> recurso_B = Recurso()
>>> recurso_B.habilitar_usuario(usuario_1)
>>> recurso_X = RecursoCompuesto([recurso_A, recurso_B])
>>> recurso_X.tiene_acceso(usuario_1)
False
>>> recurso_X.tiene_acceso(usuario_2)
False
```
Hemos agregado un `recurso_X` compuesto por `recurso_A` (que a su vez es un compuesto de otros dos más simples) y `recurso_B`. Ninguno de los dos usuarios definidos tiene acceso al nuevo recurso: al `usuario_1` "le falta" `recurso_A` (como vimos antes), mientras que al `usuario_2` "le falta" `recurso_B`.


## Técnicas involucradas
Se definen clases separadas para los objetos que representan elementos compuestos. Los objetos que representan compuestos, mantienen referencias a los objetos que representan a cada uno de sus componentes, muchas veces en la forma de una lista o array. Mediante técnicas de manipulación de listas como las que describimos en la Unidad 2, se pueden realizar los recorridos necesarios sobre los componentes.

Es _fundamental_ que se defina un **contrato compartido** entre los objetos que representan objetos simples y compuestos. 
Esto permite que un elemento compuesto pueda ser, a su vez, componente en una composición ulterior.   
En el último ejemplo, las instancias de `Recurso` y de `RecursoCompuesto` comparten el contrato definido por la consulta `tiene_acceso`, que es el objetivo del modelo construido. Esto permite que un `RecursoCompuesto` sea, a su vez, componente dentro de otro `RecursoCompuesto`, sin que sea necesaria ninguna consideración especial en el código. 