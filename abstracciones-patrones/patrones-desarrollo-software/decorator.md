---
layout: default
---

# Decorator
(imagen que represente mamuschas o algo parecido. En este caso, el de RefactoringGuru no me gusta mucho, pero es lo que hay.)  
![imagen que represente mamuschas o algo parecido](https://refactoring.guru/images/patterns/content/decorator/decorator.png) 


## Objetivo
Definir distintos agregados a una funcionalidad básica, de forma tal de que se puedan combinar fácilmente.


## Motivación
La existencia de distintos agregados sobre una estructura principal, que admiten una diversidad de configuraciones, es un fenómeno común en el "mundo real".

Una situación usual es la de un **producto** que se ofrece en una versión básica, para el cual se define una serie de opcionales, donde cada cliente que compra el producto, puede elegir libremente cuáles de estos opcionales desea agregar.  
Un ejemplo típico es la venta de automóviles, sobre una base se puede elegir agregar, o no, levantavidrios eléctrico, airbag en el asiento del conductor, asiento ajustable en altura, una mejor calidad de sonido, etc..

La **oferta de diversos servicios** sigue un patrón similar. Por ejemplo, un gimnasio puede ofrecer un abono básico al que se le pueden añadir acceso a natación, profesor particular, clases específicas de alguna disciplina, etc.. Cada cliente elige la combinación de servicios opcionales, que se agregan al servicio base.

Este mismo patrón, resulta útil para resolver varias situaciones que aparecen en el desarrollo de software.  
En principio, puede aplicarse para desarrollar modelos de situaciones similares a las recién descriptas. 
También existen otros dominios, más cercanos específicamente al software, donde este patrón resulta útil. Un ejemplo es la configuración de una ventana en un sistema gráfico: al diseño básico de una ventana se le pueden agregar bordes, títulos, barras de menú o de íconos, etc..


## Técnicas involucradas
Para cada característica que se quiera incorporar, debe definirse una nueva clase, que debe respetar los contratos definidos para los objetos que se desee decorar.  

Esta es una definición esquemática de un objeto original y dos posibles decoradores
``` python
class ObjetoOriginal:
    def operacion_x(self):
        # implementacion

class Decorador1:
    def __init__(self, _objeto_decorado):
        self.objeto_decorado = _objeto_decorado

    def operacion_x(self):
        # agregados del decorador 1
        self.objeto_decorado.operacion_x()

class Decorador2:
    def __init__(self, _objeto_decorado):
        self.objeto_decorado = _objeto_decorado

    def operacion_x(self):
        # agregados del decorador 2
        self.objeto_decorado.operacion_x()
```
Destacamos que los decoradores respetan el contrato definido por la `operacion_x()`. Esto permite la definición de cadenas de decoradores de longitud arbitraria, en la que un decorador puede decorar a otro decorador.
En este ejemplo:
``` python
objeto_original = ObjetoOriginal()
deco_1 = Decorador1(objeto_original)
deco_2 = Decorador2(deco_1)
```
el decorador `deco_2` decora a otro decorador, que a su vez decora al objeto original. Si ejecutamos
`deco_2.operacion_x()`
se aplicarán los agregados de _ambos_ decoradores, al comportamiento definido en la clase del objeto original.


## Ejemplo
A partir de la definición básica del criterio para definir si un usuario tiene o no acceso a un recurso, podemos pensar en varias variantes, entre otras las siguientes.
- recursos que sólo pueden ser accedidos por usuarios con rango de administrador.
- recursos que tienen una cuota máxima de uso, p.ej. por día.
- recursos que sólo pueden ser accedidos en un determinado rango horario.

Supongamos que se nos solicita agregar varias restricciones de este estilo, de forma tal que puedan ser combinadas libremente.

Este es un buen caso para aplicar la idea de _Decorator_.
Para cada capacidad agregada, definiremos una clase específica, _que debe compartir el contrato básico de los recursos_. Los objetos generados a partir de estas clases son _decoradores_ de recursos. 
A su vez, cada decorador debe mantener una referencia al recurso al que está decorando.

Por ejemplo, para agregar a cualquier recurso la restricción de rango horario, definimos la siguiente "clase decoradora".
``` python
from datetime import datetime

class RecursoEnRangoHorario:
    def __init__(self, _recurso_decorado, _desde_hora, _hasta_hora):
        self.recurso_decorado = _recurso_decorado
        self.desde_hora = _desde_hora
        self.hasta_hora = _hasta_hora

    def habilitar_usuario(self, usuario):
        self.recurso_decorado.habilitar_usuario(usuario)

    def tiene_acceso(self, usuario):
        return self.estamos_en_horario() and self.recurso_decorado.tiene_acceso(usuario)

    def estamos_en_horario(self):
        current_hour = datetime.now().hour
        return current_hour >= self.desde_hora and current_hour < self.hasta_hora
```

En forma análoga, podemos definir las clases `RecursoSoloParaAdministrador` y `RecursoConCuotaDeAcceso`.

Para crear un recurso con restricción horaria y sólo para administrador, procedemos de la siguiente forma.
``` python
>>> recurso_original = Recurso()
>>> recurso_administrador = RecursoSoloParaAdministrador(recurso_original)
>>> recurso_con_dos_agregados = RecursoEnRangoHorario(recurso_administrador, 11, 13)
```
Como el `recurso_con_dos_agregados` cumple con el contrato común de todos los recursos, podemos utilizarlo de la misma forma que cualquier otro recurso.
``` python
>>> datetime.now().hour
17
>>> recurso_con_dos_agregados.habilitar_usuario(usuario_1)
>>> recurso_con_dos_agregados.habilitar_usuario(usuario_2)
>>> recurso_con_dos_agregados.tiene_acceso(usuario_1)
False
```
aunque el `usuario_1` tiene habilitado el recurso, no puede acceder porque se está fuera del rango horario definido al construir el `recurso_con_dos_agregados`.

Este recurso podrá ser accedido únicamente por administradores, y en el horario de 11 a 13.


## Nota adicional
Mencionamos que la _herencia de clases_, una de las técnicas más usuales en POO, puede utilizarse para agregar **una** característica (o un conjunto fijo de características) sobre un comportamiento original.  
El beneficio que da el uso de Decorators sobre la herencia es que permite combinar libremente las características adicionales, donde cada una se define en una clase separada, y por lo tanto de código sencillo.

