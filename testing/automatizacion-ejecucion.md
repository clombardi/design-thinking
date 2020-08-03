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

Al hablar de la visión de _desarrolladora_ en oposición a la de _programadora_, vimos dos posibles soluciones para un script que indica cuál/es de los servicios incluidos en un archivo `docker-compose`, exponen como _host port_ un cierto puerto. Incluimos también una serie de _tests automáticos_ que validaban un subconjunto de las funcionalidades de nuestro programa:

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

<!-- 
Creo que acá se podría:
* razonar sobre el hecho de que esto es efectivamente un programa que se puede ejecutar
* ejecución: mostrar success, failure y error. ¿quién ejecuta este programa? lxs devs, un servidor de CI, un qa
* casuística: ¿por qué se eligieron esos valores? ¿qué representan? ¿se puede mejorar?
* ¿qué se puede testear? costo/beneficio a medida que vamos alejándonos del código
 -->

**Para ir mechando en el relato:**

Algunas ventajas de la automatización:
* la obvia, ahorrar tiempo: la computadora tarda mucho menos que un humano en hacer tareas repetitivas;
* baja la tasa de errores propios de la prueba: las personas podemos equivocarnos, incluso cuando la tarea es monótona. Las computadoras, en cambio, nos garantizan que ante la misma entrada siempre se producirá la misma salida;
* nos da cierta seguridad de que el comportamiento de nuestro programa es el deseado;
* como corolario de lo anterior: perdemos el miedo a introducir cambios, porque tenemos una batería de pruebas que podemos ejecutar luego de modificar el código y así verificar que todo siga funcionando como esperábamos.

Desde la visión de _desarrollador_, aportan además las siguientes ventajas:
* documentar la forma esperada de utilizar los módulos (funciones, clases, etcétera);
* especificar con menor ambigüedad qué es lo que se espera de dicho módulo.
