---
layout: default
---

# Entornos
Para que un producto de software pueda operar correctamente, necesita tener acceso a una cantidad de recursos. En particular, bases de datos configuradas de cierta forma, acceso a ciertos puertos de red, conexiones con otras aplicaciones internas o externas, posiblemente acceso a hardware (impresoras, scanners, etc.) y otros.

Todos estos elementos configuran lo que se llama un **entorno** de ejecución del producto de software.

En cada escenario en el que haya que tener una versión corriendo, debe generarse un entorno adecuado. Esto incluye, además de producción, los entornos en los cuales los usuarios y/o clientes tienen acceso a versiones de prueba (los llamados UAT), y otros que sirven para probar la integración entre componentes, y de nuestra aplicación con otras.

## Entornos de desarrollo
Por otro lado, cada desarrollador que forma parte del equipo de desarrollo de un componente, debe ser capaz de comprobar que el código que produce funcione correctamente, no sólo en forma aislada, sino en el contexto general del componente.

Esto trae aparejada la necesidad de configurar los llamados _entornos de desarrollo_. A priori, podríamos pensar en simplemente sumar un entorno más a nuestro "paquete de entornos", pero eso ocasionaría algunas dificultades en el trabajo del equipo de desarrollo. Pensemos en un hipotético escenario donde se trabaja de esta forma: 

> Un equipo de tres desarrolladoras está trabajando en distintas funcionalidades sobre un mismo módulo y quisieran probar su código nuevo en el ambiente de desarrollo. 
> 
> Rocío integra sus cambios, los despliega y comienza a probar. Unos minutos más tarde Julieta intenta hacer lo mismo, pero al comenzar a probar su nuevo código se da cuenta de que los cambios de Rocío introdujeron defectos que impiden que ella pueda continuar. Como ese es el único ambiente de desarrollo que hay, Julieta pasa el resto del día esperando que Rocío arregle sus errores.
>
> Mientras tanto Aimé, que trabaja de forma remota, está teniendo problemas de conectividad y ni siquiera puede acceder al servidor de desarrollo. Su jornada estará dedicada a discutir por teléfono con la empresa de telecomunicaciones que contrató.

En este pequeño ejemplo vemos al menos dos problemas de esta estrategia: la dificultad para trabajar en simultáneo y los problemas derivados de una mala conectividad. Podríamos mencionar otros, pero ya vemos que este esquema no funciona bien ni siquiera en equipos pequeños.

Una alternativa muy utilizada hoy en día es la de tener el entorno de desarrollo configurado en la computadora personal de _cada miembro_ del equipo. Esto sin dudas resuelve los problemas del ejemplo anterior, pero también trae ciertos desafíos adicionales. Mencionamos a continuación algunos de ellos:

* en la mayoría de los casos, este entorno será configurado y mantenido por cada desarrollador de manera autónoma, lo cual impide (o al menos dificulta) la administración por parte del equipo de operaciones;
* muy probablemente, deba funcionar en distintas versiones de un sistema operativo o incluso en sistemas operativos diferentes: alguien podría usar Debian Linux, otra persona macOS y alguien más Windows;
* si es necesario que el desarrollador acceda a recursos externos, aparecerán configuraciones relacionadas a la _seguridad_. Ejemplos de esto podrían ser el manejo de claves SSH, configuración de una VPN, etc.

Dependiendo de la complejidad del software que se esté construyendo, es posible que este pequeño entorno personal no reemplace a un entorno de desarrollo centralizado, pero sí lo complemente: como mínimo debería servir para poder compilar el código, ejecutar las pruebas automatizadas y eventualmente inspeccionar la ejecución en busca de defectos. También es común que se incluyan las bases de datos utilizadas, en conjunto con herramientas para crear una serie de datos de prueba.

## Herramientas que simplifican el manejo de entornos
Esta multiplicidad de entornos, que potencialmente evolucionan en conjunto con el software, requieren de herramientas que van pareciéndose cada vez más a las utilizadas para el desarrollo. En particular, se vuelve necesario contar con distintas versiones de estos entornos, tener la posibilidad de replicarlos sin demasiado esfuerzo, automatizar su configuración y todas las otros aspectos que venimos contando sobre el desarrollo.

En este marco surge lo que conocemos como _DevOps_, que se refiere a esta idea de encarar las tareas de operaciones con herramientas que típicamente se asociaban al desarrollo. Esta tendencia suele venir acompañada de una fuerte inclinación hacia la _virtualización_ de los entornos y su posterior _orquestación_ mediante herramientas automatizadas.

Bajo esta visión, podríamos construir un esquema de desarrollo-integración-despliegue como el siguiente:
* además del código fuente, cada componente incluye un [Dockerfile](https://docs.docker.com/engine/reference/builder/) que contiene lo necesario para compilar y ejecutar el código;
* el equipo de operaciones (o el de desarrollo) elabora una configuración de [Docker Compose](https://docs.docker.com/compose/) que le sirve a las desarrolladoras para tener un entorno personal funcionando en sus computadoras;
* utilizando [Kubernetes](https://kubernetes.io/), los equipos de operaciones y desarrollo colaboran para proveer a las aplicaciones de la configuración necesaria para cada ambiente. Usando esta misma tecnología, se definen reglas para aumentar la cantidad de instancias de cada servicio en función de la carga que tengan; 
* con la ayuda de [Terraform](https://www.terraform.io/), el equipo de operaciones define la infraestructura que va a utilizar cada uno de los ambientes.
