---
layout: default
---

# Gestión de versiones
En el tiempo de vida de un producto de software, desde que comienza su desarrollo hasta que sale de operaciones, se genera una gran cantidad de versiones del mismo.

Además de las versiones que efectivamente son desplegadas, se generan otras de uso interno: para ciclos de testing de componentes, para testing de integración entre componentes, para pruebas no funcionales, para revisión con usuarios, para aceptación.

Esto implica la necesidad de llevar un manejo adecuado y cuidadoso de las versiones.
Cada versión de un producto incluye una cantidad de elementos: archivos de código fuente, de configuración, y otros recursos.
Introducir "baseline". Un baseline de un producto está formado por una versión específica de cada elemento que lo compone. A cada versión de un producto le corresponde un baseline del conjunto de elementos que lo componen.

En arquitecturas basadas en componentes, cada componente puede llevar una historia de versiones independientes. 
Cada versión del producto se corresponde con una determinada versión de cada componente.

Los repo de código incluyen conceptos que dan soporte al versionado: tag y release.


## Dependencias
Uso de librerías. Necesidad de registrar las versiones de las librerías que se usan.

Sistemas de manejo de librerías: Maven, npm, pip.

