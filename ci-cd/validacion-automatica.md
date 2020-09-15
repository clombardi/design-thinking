# Validación automática

> Acá ya aparece la idea del server: se baja las dependencias, compila y ejecuta los tests. Para que esto funcione, hacer tests tiene que ser parte de la cultura del equipo.

## Chequeos estáticos

> Una serie de cosas que se pueden validar incluso antes de ejecutar el código: 
> * reglas de estilo
> * compilación / chequeo de tipos
> * versión de las dependencias (warnings de seguridad, deprecadas)

## Chequeos dinámicos

> Correr los tests, analizar la cobertura.

## Cuándo pasa y cómo nos enteramos si falla

> Todo depende de cómo se configure:
> * cada vez que alguien sube un commit, una branch o un pull request
> * todos los días a una cierta hora
> * manualmente, cuando alguien lo requiere

> Bots que comentan en el pull request, notificaciones por mail / Slack, etc.
