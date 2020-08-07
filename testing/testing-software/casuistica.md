---
layout: default
---

# Casuística: análisis de los casos de test

Habiendo explicado ya el por qué y el funcionamiento de los tests automáticos, nos centraremos ahora en reflexionar sobre los casos elegidos para probar. Como adelantamos al hablar de [test cases](../sistematizacion/test-case), existen varias técnicas para elegir esos casos, algunas de las cuales comentaremos a continuación.

## ¿Dónde pongo el assert?

<!-- Análisis del test. Casos de borde. -->

<!-- - **Boundary Value**: se recomienda pensar en los valores límite de las variables involucradas en el test data. P.ej. un valor límite para la cantidad de productos es 0. Es lo que hicimos al [analizar el algoritmo](../../logica-algoritmica/elevando/casos-limite) desarrollado en la Unidad 2.
- **Equivalence Partitioning**: se analizan rangos o conjuntos de valores que tienen el mismo efecto en el test, a los que se llama _clases de equivalencia_. En el ejemplo del agregado de un producto a un carrito de compras, se pueden dividir los productos entre los que tienen stock suficiente para cubrir la cantidad a comprar, los que tienen stock insuficiente, y los que no tienen stock. El análisis de las clases de equivalencia generadas puede ayudar a armar combinaciones que cubran la mayor parte de los casos posibles, evitando la generación de una cantidad exagerada de test cases. -->

## Una versión superadora

<!-- Dejar un assert por cada clase de equivalencia. -->

## Variables independientes y dependientes

<!-- Explosión combinatoria. ¿Siempre tiene sentido? Forma automatizada de generar fixture. -->


<!--
Tal vez como cierre:
 
Es importante encontrar un buen balance entre la _cobertura_ del test, o sea qué posibles defectos puede detectar, y el _esfuerzo_ de redactar, ejecutar y mantener los test cases. La cobertura total es imposible en la mayor parte de los casos, debiéndose utilizar técnicas de _verificación formal_ en aquellas situaciones en las que la criticidad de los recursos controlados por una aplicación hace pertinente la búsqueda de estrategias que eliminen de raíz la posibilidad de defectos. -->
