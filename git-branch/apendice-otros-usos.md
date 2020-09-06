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

## Tareas de mantenimiento

Durante el ciclo de vida de un producto software, es posible que sea necesario _separar_ un repositorio en otros más pequeños o _fusionar_ varios repositorios en uno solo. El primer caso podría ocurrir, por ejemplo, si se decide crear bibliotecas, dividir una aplicación monolítica en _backend_ y _frontend_ o separar un sistema en _microservicios_. Ejemplos del segundo podrían ser unificar dos componentes similares en uno solo, o la inversa de cualquiera de los ejemplos anteriores.

En estos casos (y en otros similares), deberemos tomar una decisión antes de comenzar: si nos interesa preservar la _historia_ de commits de Git o si preferimos comenzar como si fuese un repositorio nuevo. Sin dudas conservarla sería lo ideal, pero tiene un costo asociado: hay que acudir a comandos avanzados de Git y la operación se vuelve más compleja. 

Si decidimos que queremos preservar el historial de commits, lo que haremos en verdad será _reescribir_ esa historia para hacer "como si" el repositorio siempre hubiese estado separado desde el inicio - o unido, en el otro caso. Hay que aclarar que estas operaciones son _destructivas_, y que volver hacia atrás ya no será una opción, en todo caso lo mejor que puede hacerse es almacenar un backup de los repositorios originales. 

Si, en cambio, decidimos perder el historial, la operación constará únicamente de un movimiento de carpetas y archivos como lo haríamos normalmente sin utilizar Git.

### Reescribiendo la historia

Para la tarea de separar un repositorio, Git ofrece un poderoso comando llamado [`git filter-branch`](https://git-scm.com/docs/git-filter-branch), que básicamente sirve para reescribir la historia según criterios configurables. Para este caso, podríamos utilizar la opción `--subdirectory-filter` que reescribe _todos_ los commits que el repositorio tenga, modificando aquellos que interactúan con archivos del directorio especificado y eliminando los que no. Esta operación puede llegar a demorar bastante tiempo, dependiendo de cuántos commits tenga el repositorio.

Para el caso de unir dos (o más) repositorios separados podremos utilizar el comando `git merge`, con la salvedad de que deberemos ser explícitos en nuestra intención de unir dos repositorios que no comparten historia. Esto se logra simplemente agregando la opción `--allow-unrelated-histories`, luego el `merge` será como cualquier otro (con la chance de tener que resolver una larga lista de conflictos).
