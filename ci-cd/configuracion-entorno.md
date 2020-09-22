---
layout: default
---

# Configuraciones del entorno

Llegado este punto, podemos decir que el proyecto ya está listo para ser publicado (al menos) en algún ambiente previo a producción. 

En un enfoque tradicional, aquí se produciría el "pasaje a operaciones" y el equipo se encargaría de configurar el entorno con todo lo necesario para poder ejecutar la aplicación: valores inyectados desde variables de entorno, bases de datos, configuraciones de puertos y un largo etcétera. Dependiendo de la infraestructura de cada organización, estas tareas se harían de manera remota (por SSH, FTP o algún protocolo similar) y con una carga más o menos importante de trabajo manual.

En un enfoque de _integración continua_, buscaremos mejorar este proceso de dos formas: haciendo que todas las configuraciones necesarias estén también versionadas (en el mismo repositorio donde está el código o en otro) y que su ejecución esté automatizada. El escenario ideal sería poder preparar un nuevo entorno simplemente ejecutando una serie de _scripts_, llegando incluso esto a posibilitar la creación o destrucción de entornos a demanda que propone la infraestructura basada en contenedores.

Veremos a continuación algunos ejemplos de las facilidades que algunas herramientas ofrecen para automatizar esta configuración.

## Variables de entorno

Uno de los mecanismos más utilizado para proveer configuración a los sistemas son las **variables de entorno**. Presentes en todos los sistemas operativos, las variables nos permiten definir valores alfanuméricos asociados a una clave, para luego leerlos desde la aplicación y hacer algo con ellos.

Los usos de las variables son potencialmente infinitos, por lo cual solamente nombraremos algunos de los más comunes:
* puerto HTTP en el que debe ejecutarse una aplicación web,
* ruta en la que se encuentran los _assets_ o recursos multimedia de un sistema,
* modo en el que debe ejecutarse la aplicación (test, producción, debug, etc),
* nivel de _logging_ del sistema (trace, debug, info, warning, error),
* credenciales para conectarse a una base de datos,
* otros _tokens_ de acceso a sistemas externos.

Siguiendo el lineamiento que venimos enunciando, "todo lo necesario debe estar en el repositorio de código", deberíamos buscar una forma de incluir estas configuraciones en un archivo que podamos versionar, en conjunto con algún mecanismo que se encargue posteriormente de agregarlas en el entorno correspondiente. 

Esto podría ser tan sencillo como un script de Bash que configure cada una de las variables o tan "sofisticado" como la herramienta que utilicemos nos lo proponga. A modo de ejemplo de esto último, veamos una posible configuración de [Docker Compose](https://docs.docker.com/compose/) para un servicio web:

```yaml
version: '3'
services:
  web:
    image: 'webapp:v2.0'
    environment:
      PORT: 8080
      LOG_LEVEL: warn
      NODE_ENV: production
      SQL_URL: postgres://user:pass@example.com:5432/dbname
      GITHUB_PASSWORD: secreto12345
```

Si miramos con detenimiento esa configuración, probablemente nos daremos cuenta de que surge un gran problema de seguridad - estamos exponiendo en un archivo de texto plano valores que deberían ser secretos (las credenciales de un servidor SQL y una contraseña de GitHub en este ejemplo). Aún cuando el repositorio fuera privado, tener estos valores representa un riesgo: cualquier persona que tenga acceso al mismo podrá ver los valores que se utilizan en los distintos entornos ¡incluso en producción!

## Secretos

Para lidiar con estos casos, la mayoría de las herramientas contemplan la posibilidad de manejar **secretos** dentro de la configuración. A grandes rasgos, los secretos son porciones de la configuración que, de algún modo, están encriptados y solo pueden ser leídos en los contextos adecuados. De esa manera, juntamos lo mejor de ambos mundos: tenemos la configuración versionada, pero no exponemos ningún valor sensible.

Siguiendo con el ejemplo anterior, podríamos actualizar esa configuración utilizando un mecanismo llamado [Docker secrets](https://docs.docker.com/engine/swarm/secrets/). Lo que nos permite esto es almacenar texto en archivos encriptados, que luego Docker se encargará de encriptar e inyectar donde corresponda. Veamos entonces la configuración actualizada:

```yaml
version: '3'
secrets:
  github_password:
    external: true
  sql_url:
    external: true
services:
  web:
    image: 'webapp:v2.0'
    environment:
      PORT: 8080
      LOG_LEVEL: warn
      NODE_ENV: production
      SQL_URL: /run/secrets/sql_url
      GITHUB_PASSWORD: /run/secrets/github_password
```

Otro enfoque posible para el manejo de secretos es el que implementan [Mozilla SOPS](https://github.com/mozilla/sops) y [Travis](http://travis-ci.com/): el valor se almacena directamente en el archivo, pero encriptado de manera tal que solo pueden verse los valores si se tiene la clave adecuada. Utilizando SOPS sobre el archivo original, podríamos entonces obtener un archivo parcialmente encriptado como el siguiente:

```yaml
version: "3"
services:
  web:
    image: webapp:v2.0
    environment:
      PORT: 8080
      LOG_LEVEL: warn
      NODE_ENV: production
      SQL_URL: ENC[AES256_GCM,data:aXtN1xZj7IL0/jFsWcV54NPGFSg=,iv:BnCQuQ3YR1FFQ0MaA28q7nwT8tovlPeBLdnGVGBls7I=,tag:7hWh4Itq7D0RslQ+fHAVDw==,type:str]
      GITHUB_PASSWORD: ENC[AES256_GCM,data:NbrJEDLpnzvpxPFU4sHEh5g4ahXx0bXQcbO5mg==,iv:0dmH0ve/yn0FwGL4wTxBlAdsDKxAoPS/m+kL8nIrQ8U=,tag:G+vG+X4alEO2hOheUXfyaw==,type:str]
```

Para estos ejemplos hemos decidido solo modificar las variables sensibles, dejando expuestas aquellas que no consideramos riesgosas. La definición de "riesgoso" deberá ser construida en cada organización, teniendo en cuenta los estándares de la industria y sus propias políticas.
