---
layout: default
---

# Gestión de dependencias
Prácticamente todo desplegable de software reúne código escrito explícitamente para el mismo, con código genérico que resuelve cuestiones básicas, las llamadas (tradicionalmente) **bibliotecas** o (más actualmente) **paquetes**. 
Una gestión adecuada de este código externo resulta necesaria para poder transicionar hacia un esquema de CI / CD. 

El objetivo de esta página es presentar esta problemática, definiendo la noción de **dependencia**. También se describirán los **sistemas de gestión de paquetes**, herramientas que posibilitan una gestión automatizada y eficiente de las dependencias, que gozan actualmente de gran popularidad.


## De bibliotecas a paquetes
Desde el surgimiento del desarrollo de software como disciplina, los proyectos confían en código genérico para resolver una variedad de cuestiones básicas, tales como interacción con bases de datos, comunicación entre aplicaciones, soporte para interfaz de usuario, manejo de estructuras de datos, operaciones matemáticas, entre otras.  
Este código constituye las llamadas **bibliotecas** de software. 
Típicamente, las bibliotecas son desarrolladas y mantenidas por organizaciones dedicadas específicamente a ese fin, distintas por lo general de aquellas que desarrollan productos de software.

Tradicionalmente, cada proyecto confiaba en unos pocos proveedores, que proporcionaban gran parte de las bibliotecas necesarias para los productos a desarrollarse. A partir de este esquema básico, se podían sumar algunas bibliotecas de propósitos muy específicos.

Actualmente, en particular para varios de los lenguajes de programación más populares (como Java, Python, JavaScript/TypeScript, Ruby, etc.) encontramos un escenario distinto.  
Se han desarrollado potentes **ecosistemas** de código, en los cuales una multitud de organizaciones, equipos e incluso desarrolladores individuales publican código genérico que puede ser fácilmente integrado en un proyecto, en unidades que reciben actualmente el nombre de **paquetes**. En la gran mayoría de los casos, estos paquetes son de uso gratuito.  

Algunos de estos paquetes se utilizan extensamente, llegando a considerarse estándares de facto de la industria. Estos paquetes de gran popularidad, conviven en los ecosistemas mencionados, con otros de propósito más específico y/o utilización más restringida.  
Actualmente, es muy habitual que un proyecto incorpore paquetes de diverso origen, en cantidades que en muchos casos están en el orden de las decenas.  
Un factor que debe tenerse en cuenta es que _cada paquete confía, a su vez, en otros paquetes_ disponibles en el mismo ecosistema. 

Para completar el panorama, mencionemos la práctica actualmente extendida, de que organizaciones que cuentan con decenas o cientos de desarrolladoras, desarrollen _sus propios paquetes_ para ser utilizados en distintos proyectos de software.

## Dependencias
La problemática del código externo que debe integrarse en un producto de software, puede abarcarse a partir del concepto de _dependencia_.

Una **dependencia** de un producto desplegable, es cualquier unidad de código que no forma parte del código fuente del desplegable, y que debe integrarse junto con el mismo al generar el desplegable, o eventualmente en el mismo entorno.  
Por lo tanto, contar con una gestión adecuada de las dependencias es imprescindible para desplegar con éxito cualquier producto de software en un entorno determinado. 

En el estado del arte actual del desarrollo de software, que involucra la interacción con los ecosistemas de paquetes descriptos más arriba, la gestión de dependencias presenta varios desafíos.

Comencemos indicando que deben considerarse tanto los paquetes que se incorporan explícitamente en el código fuente, como las dependencias de cada uno de estos paquetes, las dependencias de estas dependencias, y así sucesivamente.  
P.ej. si en un proyecto se utiliza explícitamente el paquete `paq1`, y a su vez, este `paq1` utiliza `paq2` y `paq3`, a lo que sumamos que `paq2` utiliza `paq3` y `paq4`, entonces _los cuatro paquetes_ mencionados son dependencias del proyecto: debe incorporarse el código de todos ellos al código fuente para generar un desplegable.  
Dicho de otro modo, la gestión de dependencias debe contemplar el **carácter transitivo** de las mismas.

(acá puede incluirse una imagen que muestre la dependencia transitiva)  
![dependencia transitiva](../images/logoelevate.jpg) 

A su vez, al tener cada paquete un origen diverso, también tiene (al menos en principio) una **evolución independiente** del resto de los paquetes en el mismo ecosistema.  
Muchos paquetes lanzan regularmente versiones con agregados y/o corrección de defectos.
Las versiones se identifican, al menos en varios de los ecosistemas más populares, utilizando una secuencia de números (p.ej. 2.4.1) que sigue (con mayor o menor fidelidad) lo establecido en el protocolo llamado _versionado semántico_ o [SemVer](https://semver.org/).

(acá puede incluirse una imagen sobre SemVer, pongo el link a una que encontré)  
![dependencia transitiva](https://media.geeksforgeeks.org/wp-content/uploads/semver.png) 

Por lo tanto, las dependencias no son de paquetes, sino de _versiones específicas_ de cda paquete. A su vez, el carácter transitivo de las dependencias puede derivar en que un proyecto dependa de _varias versiones de un mismo paquete_.

(acá se puede hacer una variante del dibujo de dependencias transitivas, incluyendo las versiones)  
![dependencia transitiva con versiones](../images/logoelevate.jpg) 

Adicionalmente, es habitual que en un proyecto se quiera **actualizar la versión de un paquete** que se está usando, pra aprovechar agregados o la corrección de defectos incluidos en versiones previas.  
Por lo recién descripto, esto genera una _reacción en cadena_ de actualización de versiones: la nueva versión del paquete que incorporamos puede, a su vez, declarar dependencias sobre versiones distintas de los paquetes en los que confía, y así sucesivamente.

Finalmente, mencionamos que en proyectos que cuentan con una multiplicidad de [entornos](../scm-git/entornos), en particular entornos de desarrollo para cada desarrollador (o cada equipo reducido), puede resultar difícil **controlar las características de cada equipo** (hardware, SO, etc.) en el que debe montarse un entorno de ejecución del producto que se está desarrollando.  
Puede haber desarrolladoras que elijan Linux, otras que usen Windows, y otras que trabajen sobre Mac, resultando necesario que cada una de ellas pueda tener un entorno de desarrollo, que obviamente incluye las dependencias.  
Por otro lado, algunos paquetes sí cuentan con variantes de acuerdo, en particular, al SO del equipo en el que se instalen.


## Sistemas de gestión de paquetes
Las características recién decriptas, consideradas en conjunto, provocan que un esquema de gestión de dependencias que no cuente con un alto grado de automatización se vuelva prácticamente impracticable, salvo para proyectos de dimensiones muy reducidas.

Para remediar esta situación, se popularizó en el ámbito del desarrollo la utilización de **sistemas de gestión de paquetes**.
Estos sistemas comparten varias de sus características con aquellos que se utilizan para la gestión de paquetes que configuran el SO y las aplicaciones más populares, típicamente en entornos Linux. 
De hecho, pueden verse como la extensión del concepto de gestión de paquetes al ámbito del desarrollo.

A continuación, describimos suscintamente el esquema de funcionamiento de un sistema de gestión de paquetes en relación al despliegue de un producto.

El código fuente incluye un archivo que lista las _dependencias directas_ de un producto, o sea, los paquetes explícitamente mencionados en su código fuente. 
Para cada paquete dentro de esta lista, se incluye una indicación de qué versión, o rango de versiones, se considera aceptable.
El formato de este archivo es compatible con el sistema de gestión de paquetes que se utilice.

Un paso dentro del proceso de despliegue, consiste en invocar a un comando asociado al sistema de gestión de paquetes, que realiza todas las tareas necesarias para la gestión de dependencias a partir de la lista de dependencias directas.  
Cada sistema de gestión de paquetes incluye un comando de este estilo, que puede instalarse en equipos que corran cualquiera de los SO más populares.
Este comando:
- calcula la lista completa de dependencias del producto, teniendo en cuenta el carácter transitivo de las dependencias y las reglas sobre versiones de cada paquete, e incluyendo distintas versiones del mismo paquete de ser necesario.
- obtiene el código de cada dependencia en esta lista completa, a partir de _repositorios de paquetes_ accesibles globalmente, asociados a cada sistema de gestión.
- realiza las tareas de empaquetado, compilación, etc. que resultaran necesarias para que los paquetes obtenidos puedan funcionar en conjunto con el código fuente del producto. En este paso se tienen en cuenta características específicas del equipo en el que se estén instalando los paquetes, en particular su SO.
- finalmente, instala el código de los paquetes seleccionados de forma tal que pueda funcionar en conjunto con el código fuente del producto.







## Lo que dijo Fede
> Surgieron muchos gestores que solucionan esto, que usualmente están atados a la tecnología (aunque digan que no).

## Ejemplo

> Mencionar un par de los más famosos: Maven/Gradle, pip, npm.
> 
> Yo contaría, por ejemplo, cómo funciona esto en Node/NPM. Está buena también la distinción que hace entre dependencies y devDependencies, se puede mencionar como idea. Hacer énfasis en que este archivo va en el repo y seguimos en esta onda de "en el repo está todo lo que hace falta para desarrollar, compilar y desplegar".
> 
> En el `package.lock` se ve todo el laburo que NPM hizo por vos.
