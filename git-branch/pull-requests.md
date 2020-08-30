---
layout: default
---

# Pull requests

## Una herramienta para la integración
Un rasgo significativo dentro de la concepción actual del desarrollo de software, es la importancia que se brinda al acto de **integrar** el trabajo hecho por una persona o equipo, al código que recoge todas las contribuciones al código de un componente o producto.

Este proceso puede disparar distintas tareas, entre ellas la revisión de código (para validar la calidad del código a ser integrado), la ejecución de tests (para minimizar el riesgo de la aparición de defectos como consecuencia de la integración), y la posibilidad de establecer debates dentro del equipo de desarrollo, en relación a las técnicas de codificación reflejadas en el código sujeto de la integración.  
De esta forma, la integración se torna un paso que contribuye a elevar la estabilidad, la robustez y la calidad del código.

El concepto de **pull request** fue concebido para dar un soporte adecuado, desde el repositorio de código, a esta forma de concebir los eventos de integración.

## Qué es un pull request
Un pull request (conocido por sus siglas PR) es la formalización, dentro de un repositorio de código, del pedido de integrar el código presente en un branch _origen_, dentro de otro branch _destino_. 
En el caso más común, el branch origen corresponde al desarrollo de una tarea o resolución de un defecto, y el branch destino es aquel en el que se recolecta el código de un componente o producto.  
Los principales servidores de Git, entre ellos GitHub, GitLab y Bitbucket, incorporan el concepto de pull request. Señalamos que en GitLab, este concepto se conoce como **merge request**, o sea MR.

Típicamente, un PR es iniciado por el equipo o persona responsable por la rama origen. Además de las ramas origen y destino, se puede especificar información adicional. Entre ellos destacamos una propuesta de _reviewers_, o sea desarrolladores a quienes se invita a que revisen el código a ser integrado. También se puede indicar un número de versión, que será el primero en el que se incorpore el código a ser integrado; y la identificación de una tarea o defecto que dicho código permite completar o resolver. 

La siguiente pantalla muestra los datos de carga para un nuevo pull request en GitHub. 