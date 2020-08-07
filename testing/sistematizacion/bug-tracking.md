---
layout: default
---

# Gestión de defectos: conceptos y herramientas
En esta página, describiremos brevemente algunos aspectos de la _gestión de defectos_ en proyectos de desarrollo.

Este proceso comienza con la detección de un defecto, que puede darse como consecuencia de una actividad de [testing](./tipos-documentacion), o bien por un reporte de un usuario de producción o de otro miembro del equipo de desarrollo. 
El reporte de un defecto debe incluir una descripción que permita entender el defecto, y las instrucciones necesarias para poder reproducirlo. 


## Acciones y _workflow_
A partir de este reporte inicial, se genera una serie de acciones relacionadas con el defecto, que forman un proceso, o _workflow_ de tratamiento del mismo. Entre las acciones más comunes, mencionamos:
- la [_clasificación_](./errores-defectos) de acuerdo a severidad, prioridad, componente/s afectado/s, tipo de defecto, etc..
- la _asignación_ de una persona o equipo, para que implementen las acciones necesarias para corregir el defecto.
- el registro de que se está _trabajando efectivamente_ en la resolución del defecto.
- la indicación, por parte de las personas designadas para trabajar sobre el defecto, de que existe una _posible resolución_.
- la _verificación de la resolución_, que forma parte de las actividades de testing.
- la _integración de la resolución_ dentro de versiones actualizadas de los componentes involucrados.

La definición precisa de acciones y del proceso de tratamiento de un defecto, varían de proyecto a proyecto. 
En particular, la adopción de [métodos de gestión ágiles](../../programacion-a-desarrollo/intro-agil) puede tener influencias en los workflows que se definan.

Destacamos que las acciones mencionadas involucran a varias de las [tareas](../../programacion-a-desarrollo/construccion-tareas-roles) principales de un proyecto de desarrollo, en particular la programación en sí, posiblemente la revisión de código, el test, y la generación de productos entregables. 
Este hecho provoca que la gestión de defectos resulte, en muchos casos, un aspecto particularmente complejo dentro de la gestión de un proyecto de desarrollo de software.


## Herramientas
El volumen de información asociada a los defectos en un proyecto de software, sumado a la complejidad de su gestión, hace _muy_ conveniente el uso de herramientas informáticas que permitan elevar el nivel de esta última.  
Estas herramientas se conocen con el nombre genérico de _bug trackers_ o _issue trackers_. La palabra "issue" designa cualquier evento que implique la modificación de una aplicación, ya sea por un defecto o por cambios en los requerimientos.

Los issue trackers permiten el registro inicial de un defecto, la indicación de las distintas acciones que se realizan sobre el mismo, y su seguimiento a partir de un workflow que puede definirse en forma específica para cada proyecto.  
Incluyen distintas vistas y estadísticas sobre los defectos registrados, y llevar cuenta del trabajo de cada integrante del equipo respecto de los mismos: qué defectos fueron asignados a cada integrante, y el estado de cada uno.  
También permiten documentar la relación entre los defectos y las sucesivas versiones de cada componente, indicándose para cada defecto en qué versión se encontró, y en qué versión se incorporó su resolución.

Mencionamos algunos de los issue trackers más conocidos:
- [JIRA](https://www.atlassian.com/software/jira)
- [RedMine](https://www.redmine.org/)
- [BugZilla](https://www.bugzilla.org/)

(screenshots y/o logos de JIRA/RedMine/BugZilla)  
![screenshots y/o logos de JIRA/RedMine/BugZilla](../../images/logoelevate.jpg) 

Actualmente, también se están integrando funcionalidades de issue tracking en los _repositorios de código_ más populares, tales como [GitHub](https://github.com/) o [GitLab](https://about.gitlab.com/).

(una imagen sobre "maridaje de issue tracker y repo", puede ser la imagen de un proyecto en GitHub señalando la parte de "issues")  
![una imagen sobre "maridaje de issue tracker y repo"](../../images/logoelevate.jpg) 

Estos productos, en particular JIRA, en realidad son más ambiciosos: se ofrecen para llevar la gestión de _todas las tareas_ relacionadas con un proyecto de desarrollo de software, no solamente la gestión de defectos.


