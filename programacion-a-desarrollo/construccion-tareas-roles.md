# Desarrollo de software - ¿de qué se trata?
Tal vez, la versión popular sobre el desarrollo es ... como lo muestra (p.ej.) la serie "Silicon Valley": un grupo (o un montón, si la aplicación es grande) de nerds sentados en sus computadoras codeando sin parar, hablando de tecnologías, comiendo en el escritorio, y explotando de alegría cuando resuelven un problema aplicando una genialidad. De todo ese código que escribe este grupo de nerds, mágicamente surge una aplicación que se puede instalar.

(esta intro la hice medio a propósito para meter alguna imagen)

Esta imagen es muy pobre ... en varios sentidos.  
En este material, vamos a referirnos a uno: la visión reducida que se da del rango de _tareas necesarias_, y de perfiles/roles de las _personas que intervienen_, en el desarrollo de una aplicación; la imagen que se da de "les nerds" queda para otro material.


## Programadores y desarrolladores - un primer acercamiento 
Es cierto que hay personas que pasan tiempo programando ... a quienes por lo general ya no llamamos _programadores_ sino _desarrolladores_ (o _devs_ para abreviar).  
¿Por qué _dev_ y no _programador_, hay alguna diferencia?  
Sí, hay una diferencia, sobre cómo encara su trabajo: no produce programas, sino componentes que se van a ir integrando para formar una aplicación, que es algo mucho más complejo. 
Este punto va a quedar un poco más claro (esperemos) después de hablar un poco sobre las tareas involucradas en el desarrollo. Más adelante en esta unidad, volveremos sobre esta diferencia.


## Tareas y roles
Está claro, entonces, que _una_ de las tareas involucradas en el desarrollo es la programación de componentes. Y por lo que venimos diciendo, también está claro que no es _la única_ tarea relevante.

Haciendo un listado de otras tareas necesarias, observamos que dan lugar al surgimiento de distintos roles, y además, que varias involucran la asistencia de operaciones. Veamos.


### Gestión del código fuente
El código que escriben les devs (por razones cada vez más de tradición, llamado _código fuente_), es un recurso ultra-valioso, que debe ser resguardado.  
En este punto entran en escena los **repositorios de código**; donde `git` es hoy el formato abrumadoramente más popular.  
Un repositorio está bien preparado para el trabajo colaborativo de varios devs en un mismo componente, ayudando a incorporar las modificaciones hechas por colegas, y a resolver los conflictos que se presentan cuando aparecen modificaciones incompatibles.   
También tiene incorporados conceptos (tal vez hayan escuchado sobre _branches_ y _tags_) que facilitan manejar la multiplicidad de _versiones_: la que está probando QA, la que está a punto de instalarse, la que está actualmente productiva, la que estaba productiva cuando ocurrió aquel error que tenemos que reproducir.

El contenido de estos repositorios debe alojarse en algún lado, esto implica la instalación de servidores, procesos para generar copias de resguardo, la configuración y monitoreo de espacios de almacenamiento ... tareas de _operaciones para-el-desarrollo_.


### Revisión de código
Cada vez más, se suele incluir una etapa de _revisión_ del código que se produce, antes de integrarlo en versiones desplegables. Este paso también está previsto en el `git` mediante el concepto de _pull request_.  
Esta tarea la realizan devs con mayor seniority y una visión más amplia del desarrollo.


### Determinación de componentes y mecanismos de comunicación
Si una aplicación se concibe (como pasa cada vez más habitualmente) como una colmena de componentes, un aspecto importante del desarrollo es definir con qué criterios se van a definir los componentes, y cómo se van a comunicar entre sí.

En una aplicación Web, típicamente se distingue entre componentes _front-end_ (que van a ejecutarse en el browser) y _back-end_ (que se ejecutan en servidores), esto implica una dimensión de comunicación que debe tenerse en cuenta. A su vez, los componentes back-end muy probablemente tengan que colaborar para generar la respuesta que espera "el front", esto nos da una segunda dimensión de comunicación.

Esta problemática entra en el dominio de lo que se conoce como _arquitectura de software_, con el rol aparejado de _arquitecto_.


### Documentación de componentes

### Test

### Gestión de errores

### Generación de los productos a desplegar
CI/CD

### Diseño de interfaces y de interacción
UI/UX

### Determinación de requerimientos

### Gestión de los equipos de trabajo
