---
layout: default
---

# Configuraciones del entorno

Llegado este punto, podemos decir que el proyecto ya está listo para ser publicado (al menos) en algún ambiente previo a producción. 

En un enfoque tradicional, aquí se produciría el "pasaje a operaciones" y el equipo se encargaría de configurar el entorno con todo lo necesario para poder ejecutar la aplicación: valores inyectados desde variables de entorno, bases de datos, configuraciones de puertos y un largo etcétera. Dependiendo de la infraestructura de cada organización, estas tareas se harían de manera remota (por SSH, FTP o algún protocolo similar) y con una carga más o menos importante de trabajo manual.

En un enfoque de _integración continua_, buscaremos mejorar este proceso de dos formas: haciendo que todas las configuraciones necesarias estén también versionadas (en el mismo repositorio donde está el código o en otro) y que su ejecución esté automatizada. El escenario ideal sería poder preparar un nuevo entorno simplemente ejecutando una serie de _scripts_, llegando incluso esto a posibilitar la creación o destrucción de entornos a demanda que propone la infraestructura basada en contenedores.

Veremos a continuación algunos ejemplos de las facilidades que algunas herramientas ofrecen para automatizar esta configuración.

## Ejemplos

> Podría ir algo tipo docker-compose y una config de Travis. ¿Qué pasa si el repo está público o si no queremos que los devs vean el contenido? Se puede encriptar el archivo completo, o usar alguna estrategia que solo oculte los valores, para que puedan ver cómo se llama la variable. ¿Explicar brevemente el mecanismo de clave pública/privada? Por ejemplo, https://docs.travis-ci.com/user/encryption-keys/ o https://github.com/mozilla/sops hacen esto.
