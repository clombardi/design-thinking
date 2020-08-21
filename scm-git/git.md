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

Operaciones principales: add, commit, push, pull.

![Comandos básicos de Git](./images/git-comandos.png)
