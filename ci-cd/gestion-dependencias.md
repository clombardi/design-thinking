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





## Lo que dijo Fede
> Todo programa actual tiene dependencias con bibliotecas externas (interacción con la DB, framework de vista, alguna otra cosa perdida por ahí, bibliotecas de la propia organización - dependencias de las dependencias), que además pueden variar según el sistema operativo y deberán actualizarse con el tiempo. En producción se puede elegir el SO, pero en desarrollo eso es más complejo.
> 
> Gestionar eso a mano es una locura, nos aleja muchísimo de tener ambientes reproducibles. Muchas tecnologías ofrecen una solución para esto: herramientas para gestionar las dependencias. También resuelve el problema de que varias necesiten el mismo package, en distintas versiones.
> 
> Surgieron muchos gestores que solucionan esto, que usualmente están atados a la tecnología (aunque digan que no).

## Ejemplo

> Mencionar un par de los más famosos: Maven/Gradle, pip, npm.
> 
> Yo contaría, por ejemplo, cómo funciona esto en Node/NPM. Está buena también la distinción que hace entre dependencies y devDependencies, se puede mencionar como idea. Hacer énfasis en que este archivo va en el repo y seguimos en esta onda de "en el repo está todo lo que hace falta para desarrollar, compilar y desplegar".
> 
> En el `package.lock` se ve todo el laburo que NPM hizo por vos.
