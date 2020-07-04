# Definamos un algoritmo

En la [página anterior](./estrategia.md) diseñamos una estrategia para resolver el [desafío](../desafio-enunciado.md) que queremos resolver.

En esta página, vamos a definir un **algoritmo** que lleve la estrategia a algo más parecido a un programa. Pero antes, respondamos una pregunta que tal vez esté en el aire.

## ¿Por qué "algoritmo" y no "programa"?
La pregunta es muy buena, ¿por qué todos estos pasos, primero estrategia, después algoritmo, recién depués programa?  
Indiquemos primero, dos diferencias entre algoritmo y programa
1. Un _algoritmo_ no está "pegado" a un lenguaje de programación; un mismo algoritmo puede expresarse en distintos lenguajes. Un _programa_ consta de código, está escrito en un lenguaje específico.  
En nuestro caso, el algoritmo que vamos a plantear a continuación, lo vamos a plasmar después en los trs lenguajes en los que venimos trabajando: Python, bash y PowerShell. Mismo algoritmo, tres programas.
1. El _algoritmo_ se concentra en (justamente) la tarea algorítmica que se necesita resolver. Un _programa_ tiene que contemplar todos los aspectos, en nuestro caso el algorítmico y el técnico.

Digamos además que estamos haciendo una exposición muy "paso-a-paso". A medida que se adquiere experiencia, se va pensando al mismo tiempo en estrategia, algoritmo y programa en un lenguaje determinado.  
Preferimos contarlo de esta forma por el siguiente detalle:
si un problema se complica, una estrategia para buscarle una solución es ir más despacio, e ir a esta separación, pensar el algoritmo por separado, o incluso la estrategia.  
Elegimos una presentación paso a paso, para que en caso de emergencia, puedan trabajar con cada concepto por separado.


## Empecemos
Por lo que acabamos de decir, podemos suponer que la tarea técnica está resuelta. Por decir algo, supongamos que tenemos una lista de números que tiene el tamaño de cada archivo, en el orden en que los tenemos que revisar. Si esto no es exactamente así, lo ajustaremos en el programa.

En los algoritmos, muchas veces se hace uso de [variables](../basicos/variables.md).