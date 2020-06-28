# Repetición
La _alternativa_, que repasamos brevemente en la [sección anterior](./alternativa.md), es uno de los dos elementos básicos de la algoritmia. El otro es la _repetición_.

Como vimos, la alternativa permite la _ejecución condicional_ de una unidad de código. La repetición permite ejecutar una unidad de código _varias veces_. 

¿_Cuántas_ veces, _hasta cuándo_ se repite el código incluido en una repetición?  
La respuesta a esta pregunta distingue a los dos tipos principales de estructuras de repetición.
1. Se define la _cantidad de veces_ que se quiere repetir el código, 3 veces, 5, 80. El número puede ser conocido, o puede ser el resultado de una cuenta.  
Un ejemplo típico de lo segundo es cuando se quiere realizar una operación para cada elemento de una [lista](./arrays-listas.md), en este caso la cantidad de repeticiones coincide con la cantidad de elementos de una lista.  
Esta idea se suele asociar a la palabra `for`.
1. Se define una _condición_, la unidad de código se repite mientras se cumple una condición, o hasta que deja de cumplirse.  
Por ejemplo: hasta que se encuentre un usuario habilitado para una operación, mientras la suma del tamaño de ciertos archivos a copiar no supere el tamaño del dispositivo donde queremos copiarlos, mientras haya errores de carga.  
Esta idea se suele asociar a la palabra `while` (o menos frecuentemente, a `until`).

Aquí tenemos las dos variantes de alternativa: "el `for` y el `while`". Veamos algunos detalles de cada una.

## For, versión estructural
La forma de `for` más utilizada actualmente, está asociada a una estructura, p.ej.  una lista. En Python, la estructura
``` python
for <elem> in <lista>:
    # hacer algo con elem
```
permite ejecutar una unidad de código una vez para cada elemento de la lista. 

Por ejemplo, calculemos la cantidad de elementos por encima y por debajo de 20 en una lista de números
``` python
lista = [32,8,14,21,109,5,65]
cantidad_menores = 0
cantidad_mayores = 0
for numero in lista:
    if numero <= 20:
        cantidad_menores += 1
    else:
        cantidad_mayores += 1
```
la unidad (o _bloque_) de código interna al `for` se ejecuta una vez para cada elemento de la lista, y la variable `numero` toma, en cada repetición (o _iteración_) el valor de cada elemento en orden. En este ejemplo, el bloque se ejecuta 7 veces, en la primera la variable `numero` toma el valor 32, en la seguna el valor 8, etc..  
El resultado es el esperado: se calculan las cantidades de elementos hasta 20 y mayores a 20. El siguiente script toma los valores por línea de comandos y realiza el análisis indicado:
``` python
from sys import argv
lista = [int(arg) for arg in argv[1:]]

cantidad_menores = 0
cantidad_mayores = 0
for numero in lista:
    if numero <= 20:
        cantidad_menores += 1
    else:
        cantidad_mayores += 1

print(f"hay {cantidad_menores} números hasta 20")
print(f"hay {cantidad_mayores} números mayores a 20")
```
Esta es la salida del script para el ejemplo indicado arriba.
![uso number-loop](./images/number-loop.jpg) 

Notemos que la lógica es la misma, sólo cambió el lugar de donde se obtienen los números.

> Reconocemos que, para obtener los números ingresados por línea de comandos, estamos utilizando una estructura que ... veremos más adelante. Por ahora, concentrémonos en el `for`.

La estructura sobre la que trabajamos, puede ser muy distinta a una lista de números. Este script informa los nombres de los archivos en una carpeta cuyo tamaño supera 1 Mb.

``` python
from pathlib import Path
from sys import argv

one_mb = 1024 * 1024

p = Path(argv[1])
files = p.iterdir()

large_file_names = []

for file in files:
    this_file_size = file.stat().st_size
    if (this_file_size > one_mb):
        large_file_names.append(file.name)

print("Archivos mayores a 1Mb")
print(large_file_names)
```
Este es un ejemplo de la salida que genera.
![uso file-loop](./images/file-loop.jpg) 

En este caso, la estructura llamada `files` incluye información de cada archivo en una carpeta. Utilizando el `for`, accedemos sucesivamente a la información de cada archivo, utilizando la variable `file`. Mediante `file.stat().st_size` y `file.name` accedemos, respectivamente, al tamaño y nombre de cada archivo.

En este pequeño ejemplo, combinamos varios elementos básicos: lista, alternativa y repetición. Lo mostramos en los lenguajes de scripting, como ejemplo de for estructural.

Así es en PowerShell
``` PowerShell
$files = Get-ChildItem $args[0]
$one_mb = 1024 * 1024

$large_file_names = @()

foreach ($file in $files) {
    $this_file_length = $file.Length
    if ($this_file_length -gt $one_mb) {
        $large_file_names = $large_file_names + $file.Name
    }
}

Write-Host "Archivos mayores a 1Mb"
Write-Host $large_file_names
```

Y así, en Bash
``` bash
one_mb=$((1024 * 1024))

large_file_names=()

for f in $1/*
do
    file_size=$(wc -c < $f)
    if [ $file_size -gt $one_mb ]
    then
        strict_file_name=$(basename $f)
        large_file_names+=( $strict_file_name )
    fi
done

echo Archivos mayores a 1Mb
echo ${large_file_names[*]}
``` 

## Recorrido - el objetivo del "for"
En los dos ejemplos que mostramos, y en la gran mayoría de las situaciones que aparecen en el desarrollo de scripts, la repetición está relacionada con la necesidad de _recorrer_ una estructura, y realizar alguna acción o análisis para cada elemento.

El _objetivo_ es realizar el recorrido, de una lista de números o de los archivos en una carpeta. El `for` es la _técnica_ que nos permite implementar el recorrido deseado.

Hacemos esta puntualización sobre la diferencia entre **objetivo** y **técnica**, porque si tenemos claro el objetivo, nos será más sencillo incorporar y entender nuevas técnicas que puedan surgir, que apunten al mismo objetivo.


## Recorrido simplificado en Python, código "Pythónico"
De hecho, la estructura que mencionamos brevemente en la descripción de [algoritmos standard](./algoritmos-standard.md):
``` python
[<que_quiero_extraer>
    for <elemento> in <secuencia_o_lista>
    if <condicion>
]
```
también tiene como objetivo implementar un recorrido.

Esta sintaxis se conoce como _list comprehension_ en el "mundo Python". Es un ejemplo de "código Pythónico" (en inglés, _Pythonic code_), o sea, un estilo de código que aprovecha características particulares de Python.

Utilicémosla para obtener los nombres de los archivos mayores a 1Mb en una carpeta.
``` python
large_file_names = [file.name
    for file in files
    if file.stat().st_size > one_mb
]
```


## For, versión "clásica" o "indexada"
En este material vamos a usar siempre la versión estructural de la repetición "for", porque entendemos que se adapta mejor a las necesidades de recorrido usuales en el desarrollo de scripts.

Por otro lado, señalamos que en muchas fuentes, la forma de `for` que va a aparecer es distinta. Está basada en un número que se va a utilizar para acceder a cada elemento de una lista mediante su _índice_. Esta variante está ligada al concepto de _repetición indexada_.  
Esta variante es históricamente anterior al for "estructural", por eso sigue siendo el primero que aparece en muchos materiales.

Python no tiene una sintaxis específica para este tipo de "for". Mostramos un ejemplo en PowerShell, retomando el ejemplo en el que se calcula la cantidad de números hasta 20 y mayores a 20 de una lista de números.

``` PowerShell
$lista = @(32, 8, 14, 21, 109, 5, 65)
$cantidad_menores = 0
$cantidad_mayores = 0
for ($i = 0; $i -lt $lista.Length; $i++) {
    $numero = $lista[$i]
    if ($numero -le 20) {
        $cantidad_menores += 1
    } else {
        $cantidad_mayores += 1
    }
}
```

Obsérvese que la repetición está asociada a la variable `$i`, que va a tomar sucesivamente los valores entre 0 y uno menos que la longitud de la lista. Para acceder al elemento correspondiente, utilizamos `$lista[$i]`.


## While
Hasta aquí, hemos estudiado la repetición de un bloque de código en el que se recorre una estructura ejecutando el bloque una vez para cada elemento, o bien se establece una cantidad fija de repeticiones.

Como lo indicamos al principio, existe un segundo tipo de repetición, en el que se establece una _condición_, y el bloque se repite mientras la condición sea cierta.

A título de ejemplo, definamos una función que calcula (de la forma más ineficiente posible) el primer múltiplo de un número determinado que sea menor a 100.

En Python:
``` python
def first_multiple_over_100(n):
    result = 0
    while (result <= 100):
        result += n
    return result
``` 

En PowerShell:
``` PowerShell
function first_multiple_over_100 {
    param($n)
    $result = 0
    while ($result -le 100) {
        $result += $n
    }
    return $result 
}
``` 

En Bash:
```
first_multiple_over_100 () {
    local result=0
    while [ $result -le 100 ] 
    do
        result=$(($result + $1))
    done
    return $result 
}
```

En algunos casos, puede convenir utilizar un `while` para implementar un recorrido sobre una lista. En estos casos debemos manejar un índice similar al del for "clásico".  
En particular, el `while` es útil cuando estemos buscando un elemento en particular, al encontrarlo ya podemos "cortar" el recorrido.  
Usémoslo para hallar, en Python, el primer archivo en una carpeta cuyo nombre termina de cierta forma. Presentamos el script completo.

``` Python
from pathlib import Path
from sys import argv

def first_file_that_ends_with(files, ending):
    i = 0
    found_file = None
    while (found_file is None and i < len(files)):
        file = files[i]
        if (file.stem.endswith(ending)):
            found_file = file
        else:
            i = i + 1
    return found_file

p = Path(argv[1])
ending = argv[2]
files = list(p.iterdir())
the_file = first_file_that_ends_with(files, ending)

if (the_file is None):
    print(f"No hay ningún archivo que termine con {ending}")
else:
    print(f"El primer archivo que termina con {ending} es {the_file.name}")
```

Y ejemplos de uso
![uso while-with-files](./images/while-with-files.jpg) 

El índice arranca en 0, y avanza de a una posición. Se accede al archivo mediante `files[i]`. Para avanzar en la lista, se "avanza" haciendo `i = i + 1`.   
Si se encuentra un archivo con la condición deseada, se "corta" la repetición. Para esto se utiliza el valor `None`, que es un valor especial presente en Python que se utiliza para indicar que una variable no tiene un contenido válido, es un "no-valor". En otros lenguajes, se usa en nombre `null` para este mismo concepto.  
Para indicar que no se ha encontrado un archivo, se asigna el valor `None` a la variable `found_file`. Si se encuentra un archivo que cumple la condición, se cambia el valor de `found_file`, que ya no va a ser `None`.  
Para lograr el "corte" de la repetición, se agrega la condición `found_file is None` al `while`. Al cambiarse el valor de la variable, ya no será `None`, y por lo tanto se interrumpirá la repetición.



