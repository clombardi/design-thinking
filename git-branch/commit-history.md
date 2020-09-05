---
layout: default
---

# Historia de commits, commit messages

## Historia de commits como recurso de documentación
Ya señalamos en esta unidad que cada rama define una _secuencia de commits_. Esta secuencia conforma lo que se conoce como **historia** de una rama.  
El comando `git log` permite visualizar esta historia. Esta imagen muestra el log de una rama, limitado a los últimos 20 commits, en una versión ultra-compacta.  
![log one-line](./images/log-one-line.jpg)  

En una versión con más información, los últimos 6 commits se ven como se muestra a continuación.  
![log graph](./images/log-graph.jpg)  

En ambos casos, la información que brinda el log incluye un **mensaje** que se asocia a cada commit, como se describió en la [introducción a Git](../scm-git/git).
En la visión más extendida, aparece la persona que realizó cada commit.

La secuencia de los mensajes asociados a cada commit constituye un _recurso adicional de documentación_, que ofrece una perspectiva histórica sobre un repositorio Git y el código que incluye. 
Esta perspectiva puede resultar útil para visualizar rápidamente cuándo se introdujo una característica, funcionalidad, o el código que generó un defecto; y qué desarrolladores estuvieron involucrados.

Por lo tanto, estos mensajes son un recurso valioso dentro de un proyecto de desarrollo.


