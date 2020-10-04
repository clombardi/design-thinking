---
layout: default
---

# Desarrollo iterativo e incremental
En distintas secciones de este curso, presentamos ideas y conceptos ques e contraponen a la idea clásica de _desarrollo en cascada_, o por fases, en la que un producto de software emerge como resultado de una serie de tareas (análisis inical, definición de requerimientos, diseño de alto nivel, implementación, test entre otras) que se ejecutan en una secuencia estricta.

Al describirse la idea de [ciclo de vida](../programacion-a-desarrollo/ciclo-de-vida), mencionamos la conveniencia de organizar un proyecto de desarrollo en _ciclos cortos_, que idealmente pudieran medirse en semanas. Se mencionaron como motivaciones: mantener un mayor control del desarrollo previniendo los riesgos adecuadamente, y potenciar la capacidad de obtener feedback de clientes o usuarios que apunten a elevar la calidad del producto, señalando en forma temprana ajustes a realizar y defectos a ser corregidos. 

Estas ideas fueron reforzadas al presentar los [marcos de trabajo ágiles](../programacion-a-desarrollo/intro-agil), agregándose varios elementos relacionados.  
Uno es el carácter ilusiorio de la pretensión de que los requerimientos de un proyecto de desarrollo de software puedan preveerse completamente al principio del proyecto, y que permanezcan inalterados durante el mismo.  
También se mencionó la conveniencia de realizar varios ciclos o _iteraciones_ en el desarrollo de cada componente, a fin de aprovechar las enseñanzas obtenidas en cada ciclo para concebir e implementar mejoreas en los sucesivos.  
Finalmente, se señaló el énfasis en entregar valor mediante el software construido, en buscar la satisfacción de clientes y usuarios, y en generar productos de calidad, más que en el cumplimiento de planes elaborados con alto grado de precisión.

Ya en la unidad 7, describimos el concepto de [entrega continua](../ci-cd/entrega-continua), mediante el cual se obtiene una enorme agilidad en la generación y despliegue de productos, en la forma de _builds_ de generación periódica.
Cada build incluye un volumen acotado de agregados, mejoras y/o corrección de defectos, que puede someterse a revisión inmediata por parte de usuarios y/o clientes.
Esta dinámica alienta el surgimiento de nuevas ideas o indicaciones, que pueden repercutir rápidamente en el ciclo de desarrollo.

A su vez, una parte importante del material de las unidades 4 a 7, está abocada a conceptos y aspectos que deben considerarse para poder llegar a un esquema de desarrollo que facilite la generación y despliegue frecuente de productos entregables: testing, SCM, entornos, integración, etc..

En esta sección completaremos el panorama recién presentado, puntualizando algunos aspectos de la estrategia de _desarrollo iterativo e incremental_, que es la propuesta más difundida actualmente en la industria del software.
