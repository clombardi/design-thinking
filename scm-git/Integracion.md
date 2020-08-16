---
layout: default
---

# Integración
En todo proyecto donde participe más de una desarrolladora, se requiere la integración del código generado por cada una. 
Esto en dos niveles
- integración del código de los miembros del equipo de un componente, para generar las sucesivas versiones del componente.
- integración entre versiones de distintos componentes, para generar los baselines que dan lugar a las versiones del producto completo, o para comprobar que una nueva versión de un componente puede reemplazar a la actual en un determinado ambiente.

## Conflictos
En el nivel de un componente, pueden aparecer conflictos si hay modificación concurrente. Los repos de código incluyen herramientas para detectar y resolver estos conflictos. Buzzwords relacionados: merge, rebase.  

## Workflow de integración
En ambos niveles, pueden definirse criterios de validación automática, en particular la ejecución de baterías de test o el uso de herramientas de análisis estático de código (para chequear fallas que pueden encontrarse usando análisis estático y verificar cumplimiento de estándares de codificación).  
Por otro lado, los cambios en el código pueden ser sujetos a aprobación.
Esto da lugar a la definición de workflows, que pueden activarse a partir de eventos específicos, típicamente relacionados con el repositorio de código fuente.
Estos eventos disparan una serie de verificaciones y procesos de generación de entregables.

Actualmente hay una tendencia a la automatización y rutinización de estos procesos, que lleva a la movida conocida como CI.

(se podría integrar la noción de branch en este discurso, y creo que estamos todos)




