# Ejemplo de programa con _visión desarrollador_ - un apéndice algorítmico

En esta sección, aprovechamos el programa descripto en [la sección anterior](./programar-y-desarrollar-ejemplo-dev.md) para realizar algunos comentarios, que nos ubican de lleno en el terreno de la Unidad 2, sobre razonamiento algorítmico.  
En concreto, analizaremos diferentes variantes de la obtención de los servicios que incluyen a un puerto determinado entre los host ports.  
Estas variantes surgieron naturalmente durante la preparación del material, por lo tanto son un ejemplo bien real de la evolución que puede hacerse sobre una sección de código.

Quienes no cuenten con conocimientos sobre Python, tal vez prefieran postergar la lectura hasta luego de introducidos los contenidos de la Unidad 2.


## Preludio - funciones auxiliares
Se definieron dos versiones auxiliares: la ya mencionada `parsePortRange`, y otra a la que se denominó `hostPortRange`, que extrae la parte de la definición de host ports de una especificación de puertos. O sea:

``` python
################################################
# given a port range spec like e.g. "7001-7005"
# returns an iterator for the range of port numbers
################################################
def parsePortRange(rangeSpec):
    sections = rangeSpec.split("-")
    if (len(sections) == 1):
        return [int(sections[0])]
    elif (len(sections) == 2):
        return range(int(sections[0]), int(sections[1]) + 1)
    else:
        raise f"Port range specification {rangeSpec} invalid"


################################################
# given a port spec like e.g. "7001-7005:8001-8005"
# returns the part that represent the host port range, 
# or None if such range is not specified
################################################
def hostPortRange(portSpec):
    sections = portSpec.split(":")
    if (len(sections) == 1):     # only container ports
        return None
    elif (len(sections) == 2 or len(sections) == 3):   # host:container or ip:host:container
        return sections[-2]         # in either case, is second-to-last
    else:
        raise f"Port specification {spec} invalid"
```


## Primera versión - algoritmo explícito
A partir de estas funciones, se construyó un algoritmo pensado como secuencia, en donde para cada línea de definición de ports:
- se extrae la sección de host ports.
- si hay tal sección (podría no haberla si se definen sólo container ports) se obtiene la lista o rango de números.
- si el puerto que nos interesa está en esa lista o rango, entonces se incluye al servicio entre los resultados del programa.
``` python
servicesForPort = []
for (serviceName, serviceSpec) in parsedContents['services'].items():
    if ('ports' in serviceSpec):
        # for each port range in the ports element in the service spec
        for portSpec in serviceSpec['ports']:
            # get the host port range spec that is part of the port spec
            hostPortRangeSpec = hostPortRange(portSpec) 
            if hostPortRangeSpec:
                # get the host port range, an iterator of numbers
                portNumberRange = parsePortRange(hostPortRangeSpec)
                if (portNumber in portNumberRange):
                    servicesForPort.append(serviceName)
```


## Un "pequeño" paso - se separa una función
En la versión anterior, queda bastante "escondido" el punto en que se efectivamente se agrega `serviceName` a la lista de `servicesForPort`.
Para entender cuál es la condición que cumple, hay que leer bastante código, que no tiene una identificación clara de qué está haciendo.

Para evitar eso, simplemente se encerró el código en una función se parada, y se simplificó el algoritmo principal llamando a la función. Queda así.
``` python
servicesForPort = []
for (serviceName, serviceSpec) in parsedContents['services'].items():
    if serviceIncludesHostPort(serviceSpec, portNumber):
        servicesForPort.append(serviceName)


################################################
# given a yaml-parsed service spec, and a port number,
# tells whether the spec includes that number among its host ports
################################################
def serviceIncludesHostPort(serviceSpec, portNumber):
    if not ('ports' in serviceSpec):
        return False

    # for each port range in the ports element in the service spec
    for portSpec in serviceSpec['ports']:
        # get the host port range spec that is part of the port spec
        hostPortRangeSpec = hostPortRange(portSpec)
        if hostPortRangeSpec:
            # get the host port range, an iterator of numbers
            portNumberRange = parsePortRange(hostPortRangeSpec)
            if (portNumber in portNumberRange):
                return True

    # no port range in the service spec includes the port number, hence ...
    return False
```
Ahora el nombre de la condición aparece explícitamente en el código, separándose el análisis de la misma. 
Esta separación también permite generar tests automáticos para la función `serviceIncludesHostPort`.


## Explicitar la condición
Un efecto notable de este paso es que al separar la definición de la condición que debe cumplir un servicio, se hace más fácil razonar sobre la misma.  
La condición es que el puerto en cuestión esté incluido en _alguna_ de las especificaciones de puertos del servicio.  
A partir de visualizarlo de esta forma, surge la conveniencia de usar la función `any`, que indica si algún elemento de una lista cumple una condición. Funciones de este estilo están presentes en Python y JavaScript entre otros lenguajes.

Por comodidad, se obtiene en un paso previo la lista de host ports de cada especificación. Para las especificaciones que no indiquen host ports, este valor será `None` (el equivalente en Python para `null`).
``` python
def serviceIncludesHostPort(serviceSpec, portNumber):
    if not ('ports' in serviceSpec):
        return False

    # obtain the host port ranges for each port spec, 
    # recall that hostPorRange yields None for port specs that do not include a host port range
    # (i.e. that  define a container port range))
    hostPortRanges = [hostPortRange(portSpec) for portSpec in serviceSpec['ports']]
    # check if any (actual) port range includes the given portNumber 
    return any(
        portNumber in parsePortRange(portRange) 
        for portRange in hostPortRanges
        if portRange is not None
    )
```
Ahora la condición está explícita en el código: el `portNumber` está en alguno de los `hostPortRanges`.

Tanto el paso anterior como este, están relacionado con lo que en programación se conoce como "intention revealing", o sea que el código exprese lo más claramente posible qué se está definiendo, sin que sea necesario perderse en detalles algorítmicos para entenderlo.


## Una variante más "Pythónica"
La separación hecha en el "pequeño" paso también ayudó a tener una mejor visualización de la parte principal; hizo evidente la posibilidad de usar list comprehensions. Esto llevó a la versión final
``` python
servicesForPort = [serviceName 
    for (serviceName, serviceSpec) in parsedContents['services'].items()
    if serviceIncludesHostPort(serviceSpec, portNumber)
]
```
que está más alineada con los patrones de codificación comunes en desarrolladores Python, lo que se conoce como "Pythonic code".
