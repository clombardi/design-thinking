# Repetición
La _alternativa_, que repasamos brevemente en la [sección anterior](./alternativa.md), es uno de los dos elementos básicos de la algoritmia. El otro es la _repetición_.

Como vimos, la alternativa permite la _ejecución condicional_ de una unidad de código. La repetición permite ejecutar una unidad de código _varias veces_. 

¿_Cuántas_ veces, _hasta cuándo_ se repite el código incluido en una repetición?  
La respuesta a esta pregunta distingue a las dos variantes principales de estructuras de repetición.
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

Notemos que la lógica es la misma, sólo cambió la fuente de los números.

> Reconocemos que, para obtener los números ingresados por línea de comandos, estamos utilizando una estructura que ... veremos más adelante. Por ahora, concentrémonos en el `for`.

La estructura a la que se aplica esta variante de `for` puede ser muy distinta a una lista de números. Este script informa los nombres de los archivos en una carpeta cuyo tamaño supera 1 Mb.

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

``` 



## Recorrido
Para qué sirve la repetición.