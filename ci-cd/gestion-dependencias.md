---
layout: default
---

# Gestión de dependencias

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
