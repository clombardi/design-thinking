---
layout: default
---

# Introducción a Git

Como adelantamos en la introducción de esta unidad, hoy en día [Git](https://git-scm.com/) es el _repositorio de código_ más utilizado en la industria. Si bien en la Unidad 6 hablaremos en profundidad de esta herramienta, brindaremos a continuación una pequeña introducción necesaria para poder comprender algunos de los conceptos de esta unidad.
 
Este sistema surge en 2005, momento en que el equipo de desarrollo de Linux dejó de tener acceso a la herramienta que utilizaba para versionar su código. Al ser un proyecto colaborativo, se necesitaba de un repositorio poderoso que permitiera que muchas personas pudieran trabajar a la vez desde distintas partes del mundo y que fuese veloz a la hora de integrar los cambios. En ausencia de un producto que cumpliera con esas características, Linus Torvalds (el creador de Linux) decidió desarrollarlo y tres meses después Git ya se convertía en la herramienta oficial para gestionar el código de Linux.

Desde ese momento a esta parte, cada vez más proyectos fueron abandonando los repositorios que utilizaban y migrando a Git. Entre las razones que hacen de Git una herramienta superadora de sus predecesoras, podemos nombrar las siguientes:
* es _distribuido_, lo cual significa que cada persona involucrada en el desarrollo tiene una copia local de todo el repositorio en su computadora. Esto permite trabajar sin tener conexión a internet, y en algún momento posterior conectarse para sincronizar los cambios con el repositorio central;
* tiene un manejo muy cómodo de _ramas_ o _branches_, herramienta que permite trabajar en distintas versiones del mismo código en simultáneo y eventualmente integrar los cambios de manera sencilla. Esto es útil, por ejemplo, para tener versiones distintas según el ambiente (desarrollo, QA, producción) y también para desarrollar funcionalidades nuevas sin afectar al código existente;
* como corolario de las dos anteriores, el _trabajo colaborativo_ se vuelve mucho más sencillo de llevar adelante: podemos darle acceso de solo lectura a quienes deseemos (inclusive, ¡a todo el mundo!) y luego decidir, cambio por cambio, si queremos o no integrarlo a nuestro repositorio. 

_(pienso que algún esquema como este, tal vez sumando forks, puede sumar)_
![Branches en Git](./images/git-branches.png)

## Flujo básico de trabajo

Si bien existe un sinfín de tutoriales en internet sobre cómo usar Git, describiremos aquí un flujo de trabajo básico que servirá para tener una noción de cómo funciona la herramienta. 

La unidad de trabajo es el _commit_, que no tiene una traducción directa al español... podríamos llamarlo "compromiso" o "registro". En esencia, un _commit_ consta de dos partes:

1. Una _serie de cambios_ asociados a los archivos del repositorio. Esos cambios pueden ser edición (se agregaron o quitaron líneas de un archivo), creación (de un archivo nuevo) o borrado (de un archivo preexistente).
1. Un mensaje, que explica qué representan esos cambios en términos de la aplicación. Algunos ejemplos podrían ser `"Agregada validación de correo electrónico en la pantalla de registro"` o `"Corregido error de conexión al guardar nuevos productos en la base de datos"`. La posibilidad de escribir un mensaje también existía en herramientas anteriores (como SVN), pero en Git es obligatorio. Estos mensajes no solo servirán para mantener un historial de qué cambió en cada versión, sino que también pueden ser utilizados en herramientas automatizadas que generan documentación asociada a las nuevas versiones (_changelog_, _release notes_, etc.).

Podemos decir entonces que al trabajar con Git tenemos dos tipos de interacción, una con el _repositorio remoto_, en el que colaboran todas las personas involucradas en el proyecto, y otra con el _repositorio local_, que inicialmente es un _clon_ del remoto y luego va evolucionando a medida que cada desarrollador trabaja. 

El siguiente esquema da un panorama de ambos tipos de interacción:

![Comandos básicos de Git](./images/git-comandos.png)

Haciendo foco primero en la interacción con el repositorio local, una posible metodología de trabajo sería la siguiente:

1. La desarrolladora realiza su trabajo sobre el código, editando, creando y eliminando archivos. 
1. Cuando finaliza una tarea, se dispone a hacer un _commit_ (o _commitear_, como se dice en la jerga). Para ello, decide cuáles de los archivos que modificó va a incluir, utilizando el comando `git add` para "marcar" cada uno de ellos.
1. Una vez que seleccionó todos los archivos, realiza el _commit_ con el comando `git commit`, incluyendo el mensaje que explica qué cambios realizó.
1. Toma otra tarea y vuelve a empezar este ciclo desde el paso 1.

En algún momento de su jornada laboral (al menos al comienzo y al final, aunque podría ser en cualquier momento), la desarrolladora querrá _sincronizar_ sus cambios con el repositorio remoto, en alguno de los dos sentidos posibles: 

* `git push`: publicar o _subir_ sus cambios para que sus compañeras puedan verlos.
* `git pull`: descargar o _bajar_ los cambios de las demás para tener la última versión.

En la sección sobre [integración](./integracion) veremos cómo lidiar con los _conflictos_ que pueden ocurrir al interactuar con el repositorio remoto y en la Unidad 6 hablaremos más en profundidad sobre distintos modos de organizar el trabajo en equipo utilizando _ramas_ o _branches_.
