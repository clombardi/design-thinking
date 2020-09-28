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

Adicionalmente, es habitual que en un proyecto se quiera **actualizar la versión de un paquete** que se está usando, para aprovechar agregados o la corrección de defectos incluidos en versiones previas.  
Por lo recién descripto, esto genera una _reacción en cadena_ de actualización de versiones: la nueva versión del paquete que incorporamos puede, a su vez, declarar dependencias sobre versiones distintas de los paquetes en los que confía, y así sucesivamente.

Finalmente, mencionamos que en proyectos que cuentan con una multiplicidad de [entornos](../scm-git/entornos), en particular entornos de desarrollo para cada desarrollador (o cada equipo reducido), puede resultar difícil **controlar las características de cada equipo** (hardware, SO, etc.) en el que debe montarse un entorno de ejecución del producto que se está desarrollando.  
Puede haber desarrolladoras que elijan Linux, otras que usen Windows, y otras que trabajen sobre Mac, resultando necesario que cada una de ellas pueda tener un entorno de desarrollo, que obviamente incluye las dependencias.  
Por otro lado, algunos paquetes sí cuentan con variantes de acuerdo, en particular, al SO del equipo en el que se instalen.


## Sistemas de gestión de paquetes
Las características recién descriptas, consideradas en conjunto, provocan que un esquema de gestión de dependencias que no cuente con un alto grado de automatización se vuelva prácticamente impracticable, salvo para proyectos de dimensiones muy reducidas.

Para remediar esta situación, se popularizó en el ámbito del desarrollo la utilización de **sistemas de gestión de paquetes**.
Estos sistemas comparten varias de sus características con aquellos que se utilizan para la instalación, configuración y actualización del SO y de las aplicaciones más populares, típicamente en entornos Linux.  
De hecho, pueden verse como la extensión del concepto de gestión de paquetes al ámbito del desarrollo.  

En particular, cada sistema se asocia a uno, o varios, _repositorios de paquetes_ accesibles globalmente. 
A su vez, estos repositorios cuentan con interfaces Web que permiten su exploración, y en particular la búsqueda de paquetes de acuerdo a las funcionalidades o características deseadas.

Los sistemas de gestión de paquetes más populares están asociados a un lenguaje de programación en particular (a pesar de la intención original de universalidad que subyace a la concepción de varios de ellos).  
Entre ellos mencionamos:
- **Maven**, asociado mayormente a Java.
- **npm**, asociado a JavaScript / TypeScript.
- **yarn**, alternativa a npm, también asociado a JavaScript / TypeScript. Utiliza los repositorios de npm.
- **pip**, asociado a Python.
- **Gradle**, que es entre los listados el que más mantiene la independencia del lenguaje, aunque se utiliza mayormente para el lenguaje Kotlin, y también para proyectos en Java.

(logos de Maven / npm / yarn / pip / Gradle)  
![logos de sistemas de gestión de paquetes](../images/logoelevate.jpg) 


### Esquema de utilización
A continuación, describimos suscintamente el esquema de funcionamiento de un sistema de gestión de paquetes en relación al desarrollo y despliegue de un producto.

**Declaración de dependencias directas**  
El código fuente incluye un archivo que lista las _dependencias directas_ de un producto, o sea, los paquetes explícitamente mencionados en su código fuente. 
Para cada paquete dentro de esta lista, se incluye una indicación de qué versión, o rango de versiones, se considera aceptable.
El formato de este archivo es compatible con el sistema de gestión de paquetes que se utilice.

**Ejecución de la gestión de dependencias automatizada**  
Un paso dentro del proceso de despliegue, consiste en invocar a un comando asociado al sistema de gestión de paquetes, que realiza todas las tareas necesarias para la gestión de dependencias a partir de la lista de dependencias directas.  
Cada sistema de gestión de paquetes incluye un comando de este estilo, que puede instalarse en equipos que corran cualquiera de los SO más populares.
Este comando:
- calcula la lista completa de dependencias del producto, teniendo en cuenta el carácter transitivo de las dependencias y las reglas sobre versiones de cada paquete, e incluyendo distintas versiones del mismo paquete de ser necesario.
- obtiene el código de cada dependencia en esta lista completa, a partir de uno de los repositorios de paquetes asociados al sistema de gestión.
- realiza las tareas de empaquetado, compilación, etc. que resultaran necesarias para que los paquetes obtenidos puedan funcionar en conjunto con el código fuente del producto. En este paso se tienen en cuenta características específicas del equipo en el que se estén instalando los paquetes, en particular su SO.
- finalmente, instala el código de los paquetes seleccionados de forma tal que pueda funcionar en conjunto con el código fuente del producto.

De esta forma, al desplegarse el producto, el código fuente puede interactuar sin problemas con sus dependencias.

**Versión en cada equipo de desarrollador**  
El mismo comando asociado al sistema de gestión de paquetes, o alguna variante del mismo, se ejecuta en el equipo de cada desarrollador, para obtener la información de interfaz de cada paquete. 
Esta información se integra con los editores de código, de forma tal que los desarrolladores puedan contar con información, y los editores con la capacidad de realizar validaciones, acerca del uso de los paquetes elegidos.

**Repositorio propio de una organización**  
Finalmente, mencionamos que las organizaciones que producen software pueden configurar repositorios de paquetes propios, en los que se sumen a los disponibles públicamente, los generados en la propia organización para uso de los proyectos que lleva a cabo.  
Al ejecutar el comando asociado al sistema de gestión de paquetes, se indica una referencia al repositorio que debe utilizar.


## En concreto - algunos rasgos de npm
Cerramos esta sección describiendo algunas de las características de npm, uno de los sistemas de gestión de paquetes más populares en la actualidad.

El archivo en el que se detallan las dependencias directas de un proyecto es el llamado `package.json`. 
En rigor, este archivo define información general sobre el desarrollo de un producto, que incluye a las dependencias entre otros aspectos.

Este es un ejemplo abreviado del archivo `package.json` para un proyecto de backend HTTP en el que se utiliza [TypeScript](https://www.typescriptlang.org/) como lenguaje, y [NestJS](https://nestjs.com/) como framework principal.

``` json
{
  "name": "account-application",
  "version": "0.0.1",
  "description": "",
  "author": "",
  "license": "MIT",
  "scripts": {
    "build": "nest build",
    "format": "prettier --write \"src/**/*.ts\" \"test/**/*.ts\"",
    "start": "nest start",
    "test": "jest --verbose",
  },
  "dependencies": {
    "@nestjs/common": "^6.10.14",
    "@nestjs/core": "^6.10.14",
    "@nestjs/mongoose": "^6.4.0",
    "@nestjs/platform-express": "^6.10.14",
    "accepts": "^1.3.7",
    "axios": "^0.19.2",
    "class-transformer": "^0.2.3",
    "class-validator": "^0.12.2",
    "lodash": "^4.17.15",
    "moment": "^2.24.0",
    "mongoose": "^5.9.9",
    "swagger-ui-express": "^4.1.4"
  },
  "devDependencies": {
    "@nestjs/cli": "^6.13.2",
    "@nestjs/testing": "^6.10.14",
    "@types/mongoose": "^5.7.36",
    "@types/node": "^13.1.6",
    "@types/supertest": "^2.0.8",
    "jest": "^25.2.0",
    "mongodb": "3.6.0",
    "mongodb-memory-server": "^6.6.3",
    "ts-jest": "25.2.0",
    "ts-loader": "^6.2.1",
    "ts-node": "^8.6.0",
    "tsconfig-paths": "^3.9.0",
    "typescript": "^3.7.4",
    "webpack-node-externals": "^2.5.1"
  },
  "jest": {
    "testMatch": [
      "**/account-request-test-service/*oper*.spec.ts"
    ],
    "testPathIgnorePatterns": [
      "node_modules"
    ],
    "transform": {
      "^.+\\.(t|j)s$": "ts-jest"
    },
    "coverageDirectory": "../coverage",
    "testEnvironment": "node",
    "testTimeout": 20000
  }
}
```

Este archivo especifica, además de los datos generales del producto, varios scripts asociados a tareas rutinarias de desarrollo, información relativa a la ejecución de tests (en el elemento `jest`), y **dos** listas de paquetes llamadas `dependencies` y `devDependencies`.
La primera incluye las dependencias directas que deben estar presentes al desplegar el producto en un entorno productivo.
En la lista `devDependencies`, encontramos paquetes que se utilizan únicamente durante el desarrollo, ejecución de tests y/o proceso de despliegue, y que no es necesario incluir en entornos productivos.

Notamos que en la mayor parte de los casos, la indicación de versión está precedida por un _caret_ `^`, que indica que el rango aceptable de versiones incluye a la indicada, y a todas las posteriores mientras no cambie el número principal, que es que está a la izquierda. P.ej. la especificación `^2.5.3` acepta a las versiones `2.5.3`, `2.5.8` y `2.7.1`, pero no a `1.5.9`, `2.3.8` o `2.5.2` (por ser anteriores) ni `3.2.4` (por cambiar el número principal).

Al ejecutar el comando 
```
$ npm install
```
se realizan las tareas de gestión de dependencias descriptas más arriba. Destacamos que además de instalarse todas las dependencias, se genera un archivo llamado `package-lock.json` que contiene la lista completa, con la versión específica decidida para cada package.

Esta es una entrada en el archivo `package-lock.json` correspondiente al mismo proyecto, correspondiente a una _dependencia indirecta_ (o sea, es un paquete que no está especificado en el archivo `package.json`).
``` json
"depd": {
    "version": "1.1.2",
    "resolved": "https://registry.npmjs.org/depd/-/depd-1.1.2.tgz",
    "integrity": "sha1-m81S4UwJd2PnSbJ0xDRu0uVgtak="
},
```
Notamos que se indica una versión específica, la URL de donde se puede obtener el paquete, e información que permite verificar la integridad del paquete obtenido.

El comando `npm` cuenta con la variante 
```
$ npm ci
```
que evita el paso de cálculo de la lista completa de dependencias, realizando solamente las tareas de instalación. Esta variante obtiene la información de los paquetes a instalar leyendo el archivo `package-lock.json`, resultando su ejecución mucho más rápida que la del comando `npm install`.

Este comando cuenta con otras opciones, que resultan útiles durante el desarrollo. Una de ellas es
```
$ npm install <package> --save
```
que además de instalar el paquete indicado (junto con sus dependencias) en la versión más actual disponible, lo agrega en la lista `dependencies` del archivo `package.json`. Cambiando `--save` por `--save-dev`, se agrega en cambio en la lista `devDependencies`.

Otra opción útil es 
```
$ npm update
```
que actualiza las dependencias a la versión más actual que resulte compatible con la indicación de rango de versiones aceptables para cada paquete, incluida en el archivo `package.json` de acuerdo a lo ya descripto.


## Nota final - todo en el control de versiones
Finalmente, destacamos que los archivos `package.json` y `package-lock.json` se consideran parte integrante del código fuente, y por lo tanto se incluyen en el repositorio de código que implementa las funciones de [SCM](../scm-git/scm-intro) del proyecto.  
De esta forma, se da cumplimiento con el principio de _continuous delivery_ que indica que "todo debe estar bajo control de versiones", como se describió en la [introducción a esta unidad](./intro).
