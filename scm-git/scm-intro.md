---
layout: default
---

# Introducción a SCM
La gestión del código fuente, temática de esta unidad, es uno de los aspectos de un área más vasta dentro del desarrollo de software, que se conoce por el nombre Software Configuration Management (SCM).

Comenzamos dando una pequeña introducción al ámbito de SCM, sus características, conceptos, y tareas principales.


## Los drivers
Hay dos fenómenos, que ya mencionamos varias veces en este material, que llevan a la necesidad de SCM
1. complejidad, del producto y del proceso.
1. cambio constante.

Se puede comentar que la movida abierta empuja ambos fenómenos un paso más allá.


## Qué es SCM en dos palabras
Estos dos drivers generan una necesidad de coordinar el resultado del trabajo de cada participante en un proceso de desarrollo de software, para que los productos que se generan evolucionen en una forma organizada, minimizando conflictos y errores.

El término SCM se utiliza para abarcar todas las tareas, herramientas y técnicas que se definen para perseguir estos objetivos.


## Configuration items
No se refieren solamente a archivos de config. 

Es todo elemento que forma parte del producto, o incluso del proceso. 
Incluye código fuente (que incluye a los tests), recursos (como imágenes), config de varios tipos, y también documentación.

Dentro de estos, el que requiere de cuidados más precisos es el código fuente. 
Habría que explicar por qué, yo lo asocio a que cambia todo el tiempo y tiene muchas unidades.


## Elementos del proceso de SCM
(esto lo saco del Pressman)
- Identificación de items
- Control de versiones
- Manejo de cambios
- Auditoría de configuraciones


## Herramientas
Para organizar los items y el proceso definido sobre los mismos, hacen falta herramientas.

Seguro hay un repo de código, que resuelve la identificación, organización, y manejo de cambios del código fuente, permitiendo auditar los cambios y ayudando a resolver eventuales conflictos por cambios concurrentes.

Históricamente, el control de versiones, y el manejo de los otros items, se maneja utilizando otras herramientas.
Actualmente, existe una fuerte tendencia a integrar todas las responsabilidades de SCM en los repos de código, tal vez + plugins.
