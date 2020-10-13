---
layout: default
---

# DevSecOps: la seguridad como parte del desarrollo

El acrónimo DevSecOps responde a las palabras _development, security, operations_ y tiene que ver con incluir aspectos de seguridad desde el inicio del desarrollo. Este enfoque extiende el concepto de [_pipeline_ trabajado en la unidad 7](../ci-cd/intro) para incluir allí también los aspectos mencionados.

Así como decíamos que convertir a la integración en un paso más es fundamental para poder construir software de forma ágil, incluir a la seguridad es fundamental para poder garantizar la robustez de nuestros productos. El enfoque tradicional de preocuparse por la seguridad "al final" tiene los mismos problemas que mencionamos al hablar de [integración como una etapa](../scm-git/integracion): se incrementan los costos, se generan cuellos de botella, se retrasan los tiempos de entrega, se terminan resignando posibles mejoras, etcétera.

Como su propio lema lo dice, DevSecOps busca producir _software, safer, sooner_ (software, más seguro, más rápido), incluyendo a todos los actores involucrados en la producción y generando una responsabilidad compartida sobre la temática, sin por ello perjudicar el ritmo de desarrollo.

A continuación veremos algunas ventajas de este enfoque y un conjunto de prácticas que pueden ser de utilidad para comenzar a trabajar bajo esta modalidad.

## Ventajas 

Shannon Lietz, uno de los creadores del [Manifiesto DevSecOps](https://www.devsecops.org/) sostiene que:

> "El propósito y la intención de DevSecOps es construir una mentalidad en la cual todas las personas sean responsables de la seguridad, con el objetivo de poder distribuir rápidamente las decisiones de seguridad a quienes tienen el contexto necesario, sin sacrificar por ello la calidad."

En esa frase se expresan las dos principales ventajas del enfoque: velocidad y, obviamente, mayor seguridad. Mover la toma de decisiones de seguridad a quienes trabajan día a día con cada componente provoca que estas decisiones se tomen con mucha más agilidad y evitan tener que hacer retrabajo posterior para solucionar problemas. DevSecOps no propone de ninguna manera eliminar a los especialistas, sino modificar la forma en que trabajan para poder colaborar con las desarrolladoras en la cotidianidad de su labor, minimizando así el riesgo de encontrarse con una vulnerabilidad cuando ya sea demasiado costosa de revertir.

Al delegar estas decisiones en quienes están más cerca de cada pieza de código, ocurrirá también que se anticiparán problemas que serían muy difíciles de detectar para alguien que ocasionalmente inspeccione ese componente. Podemos decir entonces que DevSecOps hace una fuerte apuesta por un modelo descentralizado de manejo de la seguridad, en el que cada actor deberá hacerse responsable de la seguridad de su parte del trabajo.

## Prácticas habituales

Mencionaremos en esta sección tres ideas que toda organización que quiera interiorizarse en DevSecOps debería tener en cuenta, y que a su vez están alineadas con la visión de desarrollo bajo el marco de las metodologías ágiles.

### Shift left

Recuperando la metáfora de _pipeline_ o tubería que introdujimos en la unidad anterior, podemos pensar que lo que está más a la izquierda es lo primero que ocurre en la cadena de integración y despliegue, que termina cuando "el resultado" sale por la derecha de la tubería. En este sentido, el principio de _shift left_ ("mover a la izquierda") de DevSecOps propone que el manejo de la seguridad sea abordado lo más a la izquierda del _pipeline_ que se pueda.

Así se incluye a la seguridad desde la generación del código, garantizando que cada pieza de software cumple con ciertos estándares previamente establecidos.

### Automatización

Como venimos mencionando en todo el material, la tendencia a la automatización es muy fuerte en estos nuevos paradigmas, y DevSecOps no es la excepción. 

Al hablar de [validaciones automáticas](../ci-cd/validacion-automatica) mencionamos al análisis de las versiones de las dependencias como uno de los posibles chequeos estáticos. Otras validaciones estáticas podrían incluir la búsqueda de tokens o passwords registrados en el repositorio sin la encriptación adecuada, análisis de vulnerabilidades conocidas, actualización automática de dependencias obsoletas.

Podrían también incluirse chequeos dinámicos, como tests unitarios de funcionalidades ligadas a la seguridad, simulaciones de ataques, escaneo de puertos abiertos, cumplimiento de los protocolos. Y, por supuesto, el equipo de seguridad podría participar de las revisiones de código que ocurren en los [pull requests](../git-branch/pull-requests), brindando su mirada experta en relación al código que se va a integrar.

### Educación en seguridad

Siendo que DevSecOps se basa en la descentralización, nada tendría sentido si los equipos de Desarrollo y Operaciones no están familiarizados con ciertos principios básicos de seguridad. No se espera que sean expertos en la temática, pero sí que al menos conozcan la temática, para que puedan implementar las sugerencias del equipo de seguridad y acudir a ellos cuando algún tema los exceda.

En esta línea, será necesario promover capacitaciones sobre seguridad y llegar a ciertos acuerdos básicos que establezcan un marco para el trabajo. Todas las personas implicadas deberán familiarizarse con estándares de seguridad - [como el top ten de la Open Web Application Security Project (OWASP)](https://owasp.org/www-project-top-ten/) -, así como también con prácticas habituales como la detección y medición de riesgos, encriptación y la implementación de controles de seguridad.
