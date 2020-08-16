---
layout: default
---

# Entornos
Para que un producto de software pueda operar correctamente, necesita tener acceso a una cantidad de recursos. En particular, bases de datos configuradas de cierta forma, acceso a ciertos puertos de red, conexiones con otras aplicaciones internas o externas, posiblemente acceso a hardware (impresoras, scanners, etc.) y otros.

Todos estos elementos configuran lo que se llama un **entorno** de ejecución del producto de software.

En cada escenario en el que haya que tener una versión corriendo, debe generarse un entorno adecuado. Esto incluye, además de producción, los entornos en los cuales los usuarios y/o clientes tienen acceso a versiones de prueba (los llamados UAT), y otros que sirven para probar la integración entre componentes, y de nuestra aplicación con otras.

## Entornos de desarrollo
Por otro lado, cada desarrollador que forma parte del equipo de desarrollo de un componente, debe ser capaz de comprobar que el código que produce funcione correctamente, no sólo en forma aislada, sino en el contexto general del componente.

Esto trae aparejada la necesidad de configurar los llamados entornos de desarollo.


## Herramientas que simplifcan el manejo de entornos
Esta multiplicidad de entornos pide por herramientas. De aquí, Docker, Kubernetes, siguen las firmas.