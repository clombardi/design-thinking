# Configuraciones del entorno

> Ya compilamos, corrimos los tests, validamos. Ahora hay que subir el código a los distintos entornos, con la configuración correspondiente. Tradicionalmente esto lo haríamos accediendo (por SSH, o FTP) al servidor y configurando todo lo necesario: variables de entorno, parámetros de la base de datos, etc.
> 
> En un enfoque de CI / CD, buscaremos que todas esas configuraciones estén también versionadas, en el mismo repositorio o en otro. Una ventaja de esto es que podemos levantar nuevos entornos con relativa facilidad.

## Ejemplos

> Podría ir algo tipo docker-compose y una config de Travis. ¿Qué pasa si el repo está público o si no queremos que los devs vean el contenido? Se puede encriptar el archivo completo, o usar alguna estrategia que solo oculte los valores, para que puedan ver cómo se llama la variable. ¿Explicar brevemente el mecanismo de clave pública/privada? Por ejemplo, https://docs.travis-ci.com/user/encryption-keys/ o https://github.com/mozilla/sops hacen esto.
