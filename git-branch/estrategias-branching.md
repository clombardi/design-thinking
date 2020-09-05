---
layout: default
---

# Estrategias de branching

Hasta aquí hemos hablado sobre qué puede hacerse con _branches_ y cómo estas nos sirven para crear "pequeños ambientes aislados" que facilitan el desarrollo en paralelo. Pensando desde una visión de Operaciones, podríamos también tener branches que contengan el código de algún entorno de ejecución particular, en el sentido que le dimos en la [Unidad 5](../scm-git/entornos).

Las posibilidades de _branching_ o ramificación son infinitas, y para intentar darle orden a ese potencial caos surgen las _estrategias de branching_, que no son más que convenciones sobre cómo utilizar las branches. Cada una de estas estrategias responde a un flujo de trabajo que abarca desde el desarrollo hasta el despliegue, e indica ante qué eventos debería crearse una nueva rama o integrarse los cambios de una sobre otra. 

A medida que los proyectos de software evolucionan y los equipos que los sostienen crecen, gestionar el código y las distintas versiones que se van generando se vuelve cada vez más complejo. Tener una estrategia que sea adecuada para las características de cada proyecto, y velar por que todo el equipo la respete, resultará de vital importancia para el éxito o fracaso de este. 

Del sinfín de estrategias que existen, tomamos para este material las que más representativas resultan: _git flow_, _GitHub flow_ y _trunk based development_. Cada una de estas estrategias da soporte a una metodología de desarrollo, y está alineada a una visión de cómo gestionar las distintas versiones. Describiremos a continuación cada una de ellas.

## Git flow

Este flujo empezó a popularizarse en el año 2010 (poco después del surgimiento de Git), y fue diseñado especialmente para el software que más se construía en aquel entonces: aplicaciones de escritorio. En ese marco, era usual tener que dar soporte en paralelo para distintas versiones de la misma aplicación, y esta estrategia está organizada en torno a esta necesidad.

Pensando en este escenario, _git flow_ propone una rígida separación entre el código "listo para producción" y las versiones en desarrollo. Para esto, se vale de dos ramas o _branches_:

* `master` o `main`: la rama principal, donde eventualmente todo el código debería confluir.  Cada vez que se integra algo a esta rama, se le añade un [tag](../scm-git/gestion-de-versiones) que indica el nombre de la versión: `v1.2`, `3.7.245`, etc. Se asume que lo que llega aquí está listo para ser desplegado en producción (y podría incluso automatizarse este despliegue). 
* `develop`: aquí es donde sucede todo el desarrollo, y desde donde eventualmente se crearán nuevos _releases_ o versiones, que terminarán integrándose en `master`. Pensando desde el punto de vista de las versiones, esta branch siempre alojará al código de la **próxima versión**.

Esta estrategia determina también una serie de estados intermedios por los que debería pasar una cierta funcionalidad hasta llegar a producción, representados con branches con nombres especiales. Un flujo típico de desarrollo sería el siguiente:

* Al comenzar una nueva funcionalidad, una desarrolladora crea una nueva branch partiendo de `develop`. La convención es que el nombre de esta branch comience con `feature/`, por ejemplo: `feature/support-online-payments` o `feature/rol-based-access-control`.
* Una vez finalizada esta funcionalidad, se integra nuevamente en la branch `develop`. Como dijimos, en esta branch se irá armando la siguiente _release_.
* Cuando el conjunto de funcionalidades relacionadas a la _release_ se completan, se creará una nueva branch partiendo de `develop`, con el nombre de la release. En este caso la convención de nombre es utilizar el prefijo `release/`, resultando así en `release/v1.2` o `release/3.7.245`. En este punto convendría publicar la aplicación en algún ambiente pre-productivo (QA, testing, staging) y realizar pruebas más intensivas. Si surgieran bugs o pequeñas correcciones, se hacen directamente sobre la branch correspondiente al release.
* Finalizada esta etapa de prueba, se integran finalmente los cambios del `release` en `master` y se genera el tag correspondiente. Si en la _release branch_ hubo algún commit nuevo, se integra nuevamente a `develop` para que esté disponible en las siguientes versiones.
* Si surgiera algún defecto en producción que necesitara ser resuelto con urgencia, esta estrategia propone resolverlo en una branch que parte y se integra directamente en `master`. En la jerga, a este tipo de cambios se los suele llamar `hotfix` (arreglo en caliente), y ese es también el nombre que la estrategia le da a estas branches. Una vez corregido el defecto, será necesario integrar esos cambios en `develop`, para que también estén disponibles para la próxima versión

En el siguiente esquema puede verse una "foto" de un proyecto manejado con esta estrategia:

_(sería bueno volver a armar todos los esquemas de esta unidad para que tengan la misma estética)_
![Git flow](images/git-flow.png)

### Corolario

Podemos establecer cierto vínculo entre esta estrategia de ramificación y lo que en la [Unidad 1](../programacion-a-desarrollo/ciclo-de-vida) hemos llamado _desarrollo cerrado y en cascada_. Seguir una metodología rígida, con etapas bien aisladas y con mucha validación manual nos conduce inevitablemente a tener que seguir un flujo de trabajo complejo como este, donde posiblemente haya una persona o equipo que tenga que dedicarse a garantizar que la estrategia se respete.

Si, en cambio, decidimos trabajar bajo una metodología más ágil y hacer despliegues más seguido, la burocracia que propone _git flow_ nos terminará resultando molesta e innecesaria. Veremos cómo las próximas estrategias ofrecen una variante más _liviana_ y adecuada para un marco de desarrollo ágil. 

## GitHub flow

Esta estrategia es considerada por muchos como una versión superadora del _git flow_. Aunque la industria comenzó a adoptarla más intensivamente en los últimos años, cronológicamente es prácticamente contemporánea a la anterior. 

Como su nombre lo indica, este flujo fue popularizado por [GitHub](https://github.com/). En el año 2011, realizaron [una publicación](http://scottchacon.com/2011/08/31/github-flow.html) comentando las desventajas de _git flow_ y contando cómo utilizaban `git` para desarrollar su propia plataforma. De aquel momento a esta parte, cada vez más equipos han optado por seguir esta estrategia, que resulta mucho más sencilla de comprender y aplicar que su predecesora.

### Desplegar seguido, fallar rápido

La premisa principal de esta estrategia es que toda funcionalidad o corrección de defectos debería desplegarse en producción lo antes posible. Esta idea, que a _a priori_ puede sonar descabellada, persigue el objetivo de entregar valor al cliente lo más rápido posible y de, en caso de producirse defectos, encontrarlos lo antes posible. Desarrollaremos esto en profundidad al hablar de _integración continua_ y _despliegue continuo_ en la próxima unidad.

Bajo este enfoque, esta estrategia propone tener una única rama importante (`master` o `main`) e ir creando branches efímeras para cada funcionalidad, defecto o cualquier otro cambio que quiera introducirse en el código. A grandes rasgos, el flujo quedaría así:

* Al comenzar una nueva funcionalidad, un desarrollador crea una nueva branch partiendo de `master`. Se espera que el nombre de esta branch sea representativo del problema que resuelve, por ejemplo: `fix-missing-headers-error` o `new-login-page`.
* Terminado el trabajo se abre un [pull request](./pull-requests), donde el resto del equipo puede hacer sus comentarios sobre los cambios propuestos. Es muy usual que aquí también se ejecuten una serie de validaciones automatizadas.
* Una vez que los cambios se aceptan, se integran en la rama `master` - y deberían desplegarse de inmediato.

Al no haber ramas especiales, la "foto" de un proyecto que utiliza _GitHub flow_ se vuelve mucho más sencilla de entender:

_(sería bueno volver a armar todos los esquemas de esta unidad para que tengan la misma estética)_
![GitHub flow](images/github-flow.png)

### Corolario

Una estrategia simple, pero que aún así aprovecha el poder de las ramas de Git. En este caso no hay un tratamiento especial para las versiones, aunque muchos proyectos combinan este flujo con el sistema de _tags_ que propone _git flow_. 

Debe mencionarse también que estos flujos suelen estar sostenidos por herramientas automáticas que intentan impedir que el código defectuoso llegue a producción. Tal como lo mencionamos en la [Unidad 4](../testing/testing.index), en este tipo de proyectos será especialmente necesario contar con un elevado nivel de tests automatizados que garanticen la estabilidad del código.

