---
layout: default
---

# Tipos de test, documentación de testing
La diversidad de los defectos que pueden aparecer en un producto de software, implica la existencia de una amplia variedad de actividades que pueden incluirse en un proyecto de desarrollo, con el fin de detectar dichos defectos.
Mencionamos algunas de estas actividades en la [introducción de esta unidad](../testing-panorama).

Se utiliza el término **test** para referirnos a cualquiera de estas actividades.

## Tipos de test
La diversidad en las actividades de testing da lugar a la caracterización de distintos tipos de test. En la literatura publicada y online se pueden encontrar distintos criterios para clasificar las actividades de test. A continuación, brindaremos una posible organización que integra varias de las denominaciones más utilizadas.

Distinguiremos primariamente entre _tests ligados al código_, _tests funcionales_ y _tests no funcionales_. 
Dentro de cada una de estas categorías se pueden distinguir distintas variantes, o "tipos", de test.


### Tests ligados al código
Son tests que apuntan a verificar el funcionamiento de las unidades que componen el código de un componente de software.  
En estos tests, se invoca específicamente a una unidad (función, clase, objeto,etc.) de código, y se verifican los resultados obtenidos.  

Se asocian al término "test de caja blanca", o _White-Box Testing_, pues su definición requiere de conocimiento sobre detalles del código.

Las dos categorías, o tipos, mencionados más asiduamente son.

**Test unitario**  
Apuntan a verificar el correcto funcionamiento de una unidad individual de software, en forma aislada de los otras unidades con las que se integra para conformar un componente de software.

**Test de integración**  
Su objetivo es comprobar la integración entre distintas unidades, verificándose que exhiban un comportamiento adecuado consideradas en conjunto. Involucra la configuración de las unidades involucradas en el test.


### Test funcionales
Estos tests apuntan a verificar que pueden realizarse las distintas funciones especificadas para un producto de software, con el comportamiento definido y sin que ocurran errores, en condiciones de operación normales.  
En otras palabras, que los usuarios puedan realizar las operaciones habilitadas según sus roles y perfiles, y que cada operación tenga el resultado y el efecto previstos.

Por ejemplo, para una aplicación de home banking, un posible test funcional consiste en verificar que un usuario que tiene varias cuentas abiertas, puede efectuar una transferencia entre dos de esas cuentas, verificándose la variación del saldo de ambas de acuerdo a lo esperado, y quedando registrada la transferencia en el resumen de ambas cuentas.

A diferencia de los anteriores, los tests funcionales se asocian a la idea de "Tests de caja negra", o _Black-box testing_, pues son independientes de las estructuras o detalles de codificación.

Para ejecutar estos tests, se accede a las distintas interfaces que ofrece una aplicación: la interfaz gráfica mediante distintos canales (aplicaciones desktop, sitios Web, acceso a través de celulares, etc.), y las API que exhibe un backend para ser accedido desde el frontend o desde otras aplicaciones.

Para ejecutar los tests funcionales, se suelen destinar ambientes llamados **de integración** o **de test**.

Algunos tests funcionales analizan un único flujo de interacción (p.ej. una compra en un sitio de comercio online) verificando su coherencia interna, mientras que otros verifican la integración entre distintas funcionalidades de una aplicación, e incluso con otras aplicaciones. Estos últimos están asociados a los conceptos de _tests de integración_, _tests de sistema_ o _end-to-end tests_.


### Tests no funcionales
Son tests que apuntan a condiciones y características generales de operación, que por lo general no están ligadas a una funcionalidad en particular.
Entre ellas, mencionamos: seguridad, performance, tolerancia a fallos, concurrencia, experiencia de usuario.  
Varios de estos aspectos coinciden con las cuestiones independientes del dominio, o _cross-cutting concerns_, mencionados al presentar la [arquitectura de software](../programacion-a-desarrollo/arquitectura-de-software) en la Unidad 1.

Existe una gran variedad de tests no funcionales, mencionamos algunos que son particularmente conocidos.
- **Tests de penetración**: se verifica que una aplicación presenta un grado adecuado de seguridad, mediante la simulación de ataques por parte de entidades maliciosas.
- **Tests de carga**: se verifica que el sistema brinde prestaciones a distintos niveles de concurrencia de usuarios, midiéndose la robustez y la performance.
- **Tests de volumen**: similar al anterior, pero respecto del volumen de datos que maneja la aplicación.
- **Tests de stress**: se verifica el comportamiento de una aplicación o componente, en condiciones que excedan los límites especificados. Por lo general los tests de stress apuntan al nivel de concurrencia, pero también pueden referirse a otras condiciones, p.ej. tamaños de archivos o peticiones que excedan los límites definidos de operación.  
Se espera que la aplicación se mantenga operativa, o bien que rechace sólo algunas peticiones, informando correctamente de la razón por la que no presta servicios. En cualquier caso, no debe funcionar en modo incorrecto, o dar una sensación falsa de estar operativa cuando no es así.
- **Tests de usabilidad**: se analiza la facilidad de uso de la interfaz gráfica de una aplicación para distintos perfiles de usuario.
- **Benchmarks de performance**: se mide el tiempo de respuesta de la aplicación ante un pedido o acción de usuario, en distintas condiciones.

La ejecución de estos tests suele involucrar la configuración de recursos y ambientes ad-hoc, que muchas veces requiere del concurso de personal ligado a operaciones.


## Más vocabulario sobre tests
Hay otras palabras asociadas a las actividades de tests, que a veces se asocian a la idea de "tipo" de test. Mencionamos algunas entre las más comunes en el ámbito del desarrollo de software.

Tal vez el término más relevante es el de **tests de aceptación**. Son los tests mediante los cuales un producto de software es habilitado a entrar en operaciones.  
En muchos proyectos se establece un ambiente de _User Acceptance Test_ (UAT) para ejecutar estos tests.

Mencionemos también los **alpha tests** y **beta tests** que son tests de una aplicación funcionando en condiciones similares a las operativas, o incluso en ambientes operativos (en particular este suele ser el caso de los **beta test**), como último estadío antes de ser considerados productos maduros.

Mencionemos finalmente varios vocablos que se refieren a estrategias para llevar a cabo las actividades de testeo, más que a actividades en particular. A este respecto, encontramos entre otras, las nociones siguientes:
- **Smoke test**: un subconjunto de tests iniciales, de forma tal que se considera que tiene sentido ejecutar el resto de los tests sólo si el resultado de los _smoke tests_ es satisfactorio.
- **Regression testing**: se refiere a la ejecución de tests para verificar que la implementación de modificaciones o agregados, no compromete el correcto comportamiento de unidades, componentes o funcionalidades operativas.
- **Test exploratorio**: consiste en un testeo inicial sin un plan predefinido.
- **Gorilla testing**: se refiere a concentrar los esfuerzos de testeo sobre cierta funcionalidad que se estima particularmente relevante en un determinado momento.
- **Sanity test**: es un conjunto de tests que garantiza que una aplicación está en condiciones mínimas de operación. 

Algunas de estas nociones serán retomadas más adelante en esta Unidad.


## Documentación de test
No todas las actividades posibles de test tienen sentido en cualquier proyecto de desarrollo. Debe considerarse que el testeo es una actividad costosa en tiempos y dinero, por lo tanto debe establecerse una relación positiva de costo/beneficio para decidir la adopción de una determinada actividad de testeo.

Por otro lado, en particular para proyectos de gran envergadura, es probable que se deba realizar una cantidad importante de actividades de test. 
Esto trae aparejada la necesidad de establecer cierta documentación en la que se registre qué actividades deben desarrollarse, cómo se justifican en base a los requerimientos del proyecto, y provean criterios de organización y estimación del esfuerzo de testing.

Entre los varios artefactos de documentación que suelen utilizarse, destacamos:
- **Test plan**: documento que establece los parámetros generales de testing para un componente o aplicación.
- **Matriz de trazabilidad de requerimientos**, o _Requirements Traceability Matrix (RTM)_: establece la relación entre las actividades de test planificadas y los requerimientos de una aplicación.
- **Test case** o **Test script**: define las características de una actividad de test puntual. Se utiliza en particular para tests funcionales.

En las páginas siguientes, daremos algunos detalles sobre test plans y test cases.
