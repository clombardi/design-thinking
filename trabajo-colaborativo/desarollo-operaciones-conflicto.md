---
layout: default
---

# Desarrollo sobre operaciones: factores de conflicto

A priori podríamos pensar que la transición a DevOps tiene que ver solamente con cuestiones técnicas, y que aprender una serie de herramientas sería suficiente para hacer la migración. Y si bien es cierto que este enfoque viene cargado de mucha tecnología nueva, es necesario destacar que el principal factor de cambio tiene que ver con la cultura organizacional: cómo las personas de un equipo se vinculan entre sí, cómo cada equipo se vincula con los demás equipos y como entre todos colaboran (o no) para lograr los objetivos que la organización se proponga.

Siguiendo este razonamiento, ir hacia un enfoque DevOps tiene mucho más que ver con cambios culturales y sociales que con innovaciones tecnológicas. Y es precisamente este camino el que puede presentar muchos más obstáculos e inconvenientes: es mucho más sencillo cambiar de herramientas que producir cambios en las actitudes de personas que vienen trabajando de manera distinta hace muchos años.

Enumeraremos a continuación una serie de _malas prácticas_ que suelen ocurrir en las organizaciones y que deben ser corregidas si efectivamente desean introducirse en la cultura DevOps.

## Equipos de Desarrollo y Operaciones sin interacción

Uno de los problemas más usuales en las organizaciones que se dedican a producir software, pero también en organizaciones que se dedican a otros rubros, es el de alentar la competencia, rivalidad y no-interacción entre equipos. Aunque no siempre la organización fomenta activamente estas actitudes, la decisión de no hacer nada al respecto termina oficiando de "fomento pasivo".

En el caso que nos concierne, esto se traduce en equipos de desarrollo y operaciones que no colaboran, o que lo hacen pero de muy mala gana. Por ejemplo: Desarrollo termina su trabajo y lo pasa a Operaciones, quienes lo reciben, lo prueban y lo devuelven a Desarrollo porque no cumple con sus expectativas. Desarrollo dice que "en nuestras máquinas funciona" y lo vuelve a pasar a Operaciones, y así sucesivamente.

Muchas veces también se oculta información entre los equipos, o alguno de los equipos toma decisiones que afectan al trabajo del otro sin consultarlo... o incluso sin siquiera comunicarlo. Si bien no es necesario que cada equipo conozca al detalle las tareas que el otro realiza, ni tenga acceso a todos los recursos, sí es imprescindible establecer acuerdos que construyan cooperación.

Establecer un plan de acción para transformar la cultura de la organización hacia el trabajo colaborativo es vital para el éxito del paradigma DevOps.

## Desarrollo puede hacer todo lo que hace Operaciones

Llevando al extremo lo enunciado en el punto anterior, podemos encontrarnos con equipos de Desarrollo que consideran que la labor de Operaciones no es importante, y dificulten aún más la interacción. 

Esta visión puede partir del desconocimiento de las tareas que Operaciones realiza, de una subestimación del esfuerzo que estas tareas conllevan y/o de un bajo nivel de involucramiento con el producto software que se está construyendo. Probablemente no haya una mirada integral sobre el trabajo que se lleva a cabo y en ese sentido las tareas de Operaciones parecieran no tener valor para Desarrollo, sino más bien resultar una molestia.

Nuevamente, alentar la comunicación entre los equipos puede ayudar a romper estos "silos funcionales", poniendo sobre la mesa las responsabilidades que cada parte tiene y demostrando cómo el aporte de cada equipo contribuye a elevar la calidad del software producido. Será importante también que Desarrollo conozca todas las tareas relacionadas a Operaciones: soporte técnico, elaboración de métricas, guardias, planificación y ejecución de planes de contingencia, mantenimiento de ambientes, respaldo de datos, y una larga lista de etcéteras.

## DevOps como equipo independiente

Otro patrón común al intentar implementar una visión DevOps es pensar que esto se logra creando un nuevo equipo, que no es ni Desarrollo ni Operaciones, que oficia de "puente" entre ambos. Suele ocurrir en organizaciones que no han recibido una formación adecuada sobre DevOps y deciden implementarlo de un día para el otro, sin tener en cuenta a las personas que están trabajando.

Este enfoque no solo potenciará las rivalidades sino que además incrementará los problemas de comunicación: ahora serán tres los equipos que tendrán que coordinar esfuerzos, a la vez que deberán lidiar con un nuevo equipo que de alguna forma estará realizando tareas que antes realizaban Operaciones y Desarrollo.

Si la organización decide que es necesaria la intervención de un equipo externo, sería conveniente que en vez de constituirse como equipo aislado se acople a la estructura existente, y trabaje para potenciar las capacidades de cada equipo. Un esquema así podría funcionar de manera temporal como capacitación en servicio, dejando luego de finalizada las habilidades necesarias para continuar trabajando bajo el paradigma DevOps.

## DevOps es solamente un conjunto de herramientas

El último de los _antipatrones_ que mencionaremos tiene que ver con entender a DevOps como un compendio de herramientas relacionadas al despliegue de aplicaciones, dejando de lado a todo lo que mencionamos sobre buscar la colaboración entre equipos.

Bajo esta mirada, "hacer DevOps" se trata únicamente de mover algunas configuraciones al repositorio de código, automatizar tareas y armar un _pipeline_ de integración y despliegue continuo. Esto responde en mayor o menor medida a una idea de _solucionismo tecnológico_, corriente de pensamiento que sostiene que todos los problemas pueden resolverse con la incorporación de tecnología, dejando de lado a las personas involucradas,

Además de esto, estas prácticas sobrecargan al equipo de Desarrollo al sumarles la responsabilidad de implementar las herramientas y dejan de lado a Operaciones, quienes no se involucran en absoluto en este proceso de cambio.
