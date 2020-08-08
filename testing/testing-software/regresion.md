---
layout: default
---

# Regresión

Como ya hemos dicho en reiteradas oportunidades, el software cambia, y no hay nada que podamos hacer al respecto. Bajo esa premisa, lo único que podemos hacer es establecer mecanismos para asegurarnos de que luego de un cambio, _todo sigue funcionando_. A esta tarea la conocemos como _regression testing_ o _pruebas de regresión_ y su objetivo es garantizar que una nueva versión de un sistema no introdujo defectos nuevos.

Típicamente, este tipo de test consiste en volver a probar todo el sistema, incluso aquellos módulos que en teoría no estuvieron involucrados en los nuevos cambios introducidos. Como se puede deducir, esta tarea tiende a crecer hacia el infinito, porque lo habitual es que un sistema tenga cada vez más funcionalidades, y no menos. Para que sea sostenible, este tipo de test tiene que tender a la automatización: si solo se hace de manera manual, cada vez involucra más trabajo, y eventualmente se torna imposible.

## Algunas técnicas

Si bien desde aquí sostenemos que la automatización resulta imprescindible, hay algunas técnicas que históricamente se aplicaron y vale la pena mencionar:

* **Volver a probar todo:** la más básica, pero también la más confiable: probar absolutamente todas las funcionalidades nuevamente. En la práctica se vuelve imposible y altamente costosa, por lo que solo puede tener sentido en pequeñas aplicaciones con pocas funcionalidades.
* **Prueba selectiva:** consiste en hacer una selección de aquellos módulos o funcionalidades que creemos que podrían haberse visto afectados por la nueva versión y probar solamente ellos. Obviamente esto baja el costo de la prueba, pero aumenta también la incertidumbre.
* **Pruebas con prioridad:** un caso particular de la anterior, solo que esta vez se elige por algún esquema de prioridad. Este esquema puede estar dado por la importancia que tengan ciertas funcionalidades desde el punto de vista comercial, por la frecuencia en que se utilicen, su aspecto crítico o cualquier otra cosa que la organización decida.

Como veremos en el anexo sobre [TDD](./tdd), las técnicas de testing automático pueden colaborar en esta tarea, principalmente en el universo de las _pruebas ligadas al código_. 

La última palabra sobre qué automatizar y qué sostener de manera manual será de cada equipo de trabajo, que deberá evaluar los costos y beneficios de cada una, así como también las habilidades de desarrolladoras y testers para automatizar estas tareas.
