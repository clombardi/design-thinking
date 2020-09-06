---
layout: default
---

# Apéndice: otros usos de Git

En este apéndice hemos elegido concentrar algunos casos de uso de Git que no son tan habituales pero aún así vale la pena mencionar.

## Fork workflow

Hasta ahora no lo habíamos mencionado, pero los flujos descriptos en la sección [Estrategias de branching](./estrategias-branching.md) asumen que quienes van a contribuir al repositorio tienen los permisos necesarios para hacer _push_ - o, dicho de otra forma, tienen permisos de lectura pero no de escritura. 

Para un caso así, Git propone una metodología de trabajo que se conoce como _fork workflow_. Esta estrategia se basa en la idea de que cada desarrollador tendrá, además de su propia copia local del repositorio, una copia remota sobre la cual sí tiene permisos de escritura. A esa copia remota se la conoce como _fork_, que viene del inglés "bifurcación" (y no de "tenedor", su otra acepción posible). El flujo sería así:

* Una desarrolladora quiere contribuir a un proyecto para el cual no tiene permiso de escritura pero sí de lectura.
* _Forkea_ el repositorio en una cuenta suya, idealmente alojada en el mismo servidor que el original (por ejemplo, en GitHub).
* Realiza las modificaciones necesarias, de la misma manera que lo haría si tuviera acceso al repositorio.
* Publica los cambios en **su** copia remota del repositorio.
* Abre un _pull request_ en la copia remota original, solicitando que se integren los cambios de su copia (o _fork_).

Tal vez esto parezca un sin sentido - ¿por qué alguien quisiera contribuir a un proyecto que no tiene permiso? - pero es mucho más común de lo que parece. No hay que olvidar que Git surgió como un proyecto lateral durante el desarrollo de Linux, proyecto de software libre que fue (y sigue siendo) desarrollado bajo este espíritu.

La [cuarta libertad del software libre](https://es.wikipedia.org/wiki/Software_libre#Las_cuatro_libertades_del_software_libre) enuncia que quien lo utiliza tiene _la libertad de mejorar el programa y hacer públicas esas mejoras a los demás, de modo que toda la comunidad se beneficie_. Traduciendo esto a terminología de Git, podríamos decir que cualquier persona podría hacer un _fork_ del repositorio, realizar cambios en su copia del repositorio y luego enviar un _pull request_ para que sus cambios sean integrados al repositorio original.

