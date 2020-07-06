# Comprimimos la función aprovechando el pipeline
Luego de [implementar la operación `zip`](./zip.md) llegamos a esta variante de la función que estamos estudiando
``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $cada_tamanio_es_mas_grande = $true
    $pares_de_tamanios = $files | ForEach-Object { $_.Length } | ZipPipe

    foreach ($par in $pares_de_tamanios) {
        $tamanio_anterior, $tamanio = $par
        if ($tamanio_anterior -gt $tamanio) {
            $cada_tamanio_es_mas_grande = $false
        }
    }

    return $cada_tamanio_es_mas_grande
}
```

Como lo indicamos al [introducir la idea de `all` en Python](../algoritmia-python/all.md), al llegar a este punto se ve claramente que la condición es que no haya ningún par que cumpla la condición `$tamanio_anterior -gt $tamanio`.

Tal como ocurre con `zip`, la idea de `all` no está implementada en PowerShell. En lugar de tomar el camino de implementarla, utilicemos un elemento que sí está presente en este lenguaje, que nos va a permitir llegar a la versión comprimida.  

En concreto, vamos a expresar exactamente la condición indicada más arriba. Si definimos (de acuerdo a lo expresado al [diseñar el algoritmo](../resolvamos/algoritmo.md)) como "par malo" aquel en el que el tamaño "anterior" es mayor al "actual", entonces la condición que queremos definir es que no haya pares malos. 
Para esto, obtendremos la lista de pares malos, y verificaremos que su tamaño sea 0. 

Para obtener la lista de "pares malos" a partir de la lista que contiene todos los pares, utilizaremos el cmdlet `Where-Object` que presentamos [al describir la analogía entre expresiones PowerShell y list comprehensions](./pipelines-intro.md).  
Obtenemos la forma final de la función.
``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $pares_de_tamanios = $files | ForEach-Object { $_.Length } | ZipPipe
    $pares_malos = $pares_de_tamanios | Where-Object { $_[0] -gt $_[1] }

    return $pares_malos.Length -eq 0
}
```
Además de lograr una gran compacidad, creemos que esta versión expresa con claridad la definición que elegimos: los tamaños son crecientes si no hay ningún par malo, donde un par es malo si el primer tamaño es mayor que el segundo.

