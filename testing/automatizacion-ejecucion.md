<!-- 
[casos límite](../logica-algoritmica/elevando/casos-limite.md)
Esto no significa que hayamos “procedido mal” hasta ahora.

El mismo proceso de haber armado una primer versión del programa, nos permite pensar con mayor precisión en el comportamiento que necesitamos.

En casos más complejos, el descubrimiento de casos en los que las definiciones no resultan coincidir con lo que en realidad se necesita, se produce recién cuando el programa comienza a funcionar y se observan sus resultados. -->

<!-- Descubrir casos en que el comportamiento del programa no se ajusta a lo que se necesita, nos lleva a pensar con mayor precisión cuál es el comportamiento que queremos de un programa.  -->

<!-- La peor decisión es no tomar ninguna decisión
Se podrían analizar más situaciones ad infinitum.
Salvo en sistemas enormemente críticos (como podría ser el control de una central nuclear), es conveniente tomar una decisión, aplicarla, y observar el comportamiento del programa para definir si resulta conveniente efectuar ulteriores ajustes. La idea de desarrollo iterativo e incremental descripto al hablar de marcos de trabajo ágiles.

En este caso, tomamos las siguientes decisiones -->

## Un caso práctico

Al hablar de la visión de _desarrolladora_ en oposición a la de _programadora_, vimos dos posibles soluciones para un script que indica cuáles de los servicios incluidos en un archivo `docker-compose`, exponen como _host port_ un cierto puerto. Incluimos también una serie de _tests automáticos_ que validaban un subconjunto de las funcionalidades de nuestro programa:

``` python
from dockerComposeProcessing.checkPorts03_functions import parsePortRange

# Tests for parsePortRange
##############################################################################
def test_parse_port_range_single():
    rangeSpec = "7001"
    theRange = parsePortRange(rangeSpec)
    assert 7001 in theRange
    assert 7002 not in theRange

def test_parse_port_range_proper():
    rangeSpec = "7001-7010"
    theRange = parsePortRange(rangeSpec)
    assert 7000 not in theRange
    assert 7001 in theRange
    assert 7002 in theRange
    assert 7008 in theRange
    assert 7010 in theRange
    assert 7011 not in theRange
    assert 41 not in theRange
    assert 41904 not in theRange
```

Con un poco de dominio del inglés, podemos fácilmente darnos cuenta de que `assert 7010 in theRange` quiere decir algo así como _"afirmar que 7010 está dentro del rango"_, lo cual _describe_ qué esperamos de nuestra función. Queda en evidencia la primera función importante que cumplen estas pruebas: comunicarle a una persona (una progamadora, alguien de QA, nosotros dentro de unos meses...) qué es lo que _debería_ hacer nuestro código y, de paso, mostrar un ejemplo de cómo se usa.

¿Y _lo automático_ dónde está? Bueno, en efecto estos tests tienen una segunda función, que es igual o más importante que la ya mencionada: la computadora los puede ejecutar sin intervención humana, e indicar si nuestro código satisface las descripciones que escribimos o no. Dicho de otra manera, los tests **son programas** con un formato especial, cuyo propósito es verificar que otros programas funcionan correctamente. Vale entonces lo mismo que ya sabemos sobre los programas: se pueden ejecutar, es deseable utilizar nombres que expresen la intención que tuvimos al escribirlos, irán evolucionando con el tiempo en conjunto con el _código productivo_, probablemente nos interese hacer un adecuado manejo de versiones... En adelante, utilizaremos el término _código productivo_ para referirnos al código que efectivamente resuelve el problema (chequear los puertos de un YAML, comprimir una carpeta con imágenes, indicar si los logs vienen creciendo) y _código de tests_ o simplemente _tests_ para referirnos al código que se encarga de probar.

Hoy en día escribir este tipo de pruebas es bastante común para muchos equipos de desarrollo, y por lo tanto la mayoría de los lenguajes ofrecen bibliotecas o frameworks para ahorrarnos una gran parte del trabajo (y de los dolores de cabeza, claro). Entre las funcionalidades que en general dan estas bibliotecas podemos destacar: _descubrimiento_ de tests (es decir, "encuentran" qué archivos contienen tests), ejecución, reporte del resultado (muchas veces incluyendo tiempos y otras estadísticas), posibilidad de exportar los resultados a formatos como HTML o XML, y varias funciones más. 

Para el ejemplo, utilizamos [pytest](https://docs.pytest.org/en/latest/) como ya habíamos mencionado anteriormente. A continuación compartimos tres resultados de ejecución distintos, que son los tres estados posibles al ejecutar pruebas: 

**Ejecución exitosa, tests exitosos**
![pytest: ejecución exitosa](automatizacion/images/pytest-success.jpg)

Todas las pruebas pasaron satisfactoriamente, no hay mucho más que decir. En particular, la salida de `pytest` incluye algunos indicadores visuales interesantes:
* al lado del nombre de cada archivo que tiene tests, aparece un puntito por cada prueba ejecutada;
* va mostrando el progreso a medida que ejecuta (62% cuando terminó con el primer archivo, 100% cuando terminó el segundo);
* al final, ofrece un resumen que también indica cuánto tardó en completar la ejecución (unas pocas centésimas de segundo).

**Ejecución exitosa, tests fallidos**
![pytest: tests fallidos](automatizacion/images/pytest-failure.jpg)

En este caso, borramos un `not` de una prueba para que falle, y eso es lo que se ve en esta captura. Además de lo que vimos en la ejecución anterior, se suman aquí algunos reportes propios de la falla:
* uno de los puntitos que mencionamos antes se convirtió en una `F`, que indica que ese test falló;
* la sección `FAILURES` nos muestra el código del test que falló, con el agregado interesante de que reemplazó la expresión `theRange` por el valor que efectivamente tenía cuando se ejecutó (la lista `[7001]`). Esto nos ayuda a entender por qué no funcionó;
* un resumen, al final, de los tests que fallaron. Esto se vuelve especialmente útil cuando tenemos una suite extensa y no llegamos a ver cuando se ejecutó el test fallido.

Es importante destacar que tanto en este caso como en el anterior, el código productivo _no arrojó ningún error_: dicho de otra forma, en ambos casos la función pudo ejecutarse y devolvió _algo_. La diferencia es que en el caso anterior ese _algo_ era lo que las pruebas esperaban y en este caso no, por eso los tests aparece como fallido.

Esta comprobación de que el valor es adecuado es la que tradicionalmente haríamos mentalmente, anotando en un papel, o siguiendo un plan de pruebas en el mejor de los casos. Además de las ventajas que ya mencionamos, comprobamos empíricamente que hacer todas estas tareas insumen una mínima fracción de segundo. ¡Éxito!

**Ejecución fallida**
![pytest: ejecución fallida](automatizacion/images/pytest-error.jpg)

Para este último ejemplo, introdujimos un pequeño error en el script original: reemplazamos el código `rangeSpec.split("-")` por `rangeSpec.split(":")`, provocando que nuestro programa ahora espere que los rangos vengan con formato `7001:7010` en vez de `7001-7010`.

A diferencia de los dos casos anteriores, en este ejemplo _el código productivo_ falló y ni siquiera pudieron terminar de ejecutarse las pruebas. Si miramos atentamente la salida, veremos que esta vez se incluye la porción de código productivo que falló y el error correspondiente, además del test.

<!-- 
Creo que acá se podría:
* razonar sobre el hecho de que esto es efectivamente un programa que se puede ejecutar (HECHO)
* ejecución: mostrar success, failure y error. (HECHO)
* ¿quién ejecuta este programa? lxs devs, un servidor de CI, un qa
* casuística: ¿por qué se eligieron esos valores? ¿qué representan? ¿se puede mejorar?
* ¿qué se puede testear? costo/beneficio a medida que vamos alejándonos del código
 -->

**Para ir mechando en el relato:**

Algunas ventajas de la automatización:
* la obvia, ahorrar tiempo: la computadora tarda mucho menos que un humano en hacer tareas repetitivas;
* baja la tasa de errores propios de la prueba: las personas podemos equivocarnos, incluso cuando la tarea es monótona. Las computadoras, en cambio, nos garantizan que ante la misma entrada siempre se producirá la misma salida;
* nos da cierta seguridad de que el comportamiento de nuestro programa es el deseado;
* como corolario de lo anterior: perdemos el miedo a introducir cambios, porque tenemos una batería de pruebas que podemos ejecutar luego de modificar el código y así verificar que todo siga funcionando como esperábamos.

Desde la _visión de desarrollador_, aportan además las siguientes ventajas:
* documentar la forma esperada de utilizar los módulos (funciones, clases, etcétera);
* especificar con menor ambigüedad qué es lo que se espera de dicho módulo.
