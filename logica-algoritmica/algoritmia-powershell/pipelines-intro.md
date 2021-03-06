---
layout: default
---

# Incorporamos pipelines en nuestra función
En esta página, comenzamos con el estudio de técnicas más específicas de lenguajes de scripting, utilizando la implementación en PowerShell. 
Tal como hicimos al analizar técnicas más generales sobre Python, vamos a trabajar con la función que implementa el [algoritmo](../resolvamos/algoritmo).

Partimos del código de dicha función en la [última versión](../elevando/casos-limite-correcciones) del programa, generada en la etapa en la que trabajamos sobre la calidad.

``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $cada_tamanio_es_mas_grande = $true
    $tamanio_anterior = $files[0].Length

    foreach ($file in ($files | Select-Object -Skip 1)) {
        $tamanio = $file.Length
        if ($tamanio_anterior -gt $tamanio) {
            $cada_tamanio_es_mas_grande = $false
        }
        $tamanio_anterior = $tamanio
    }

    return $cada_tamanio_es_mas_grande
}
```

## Pipelines en PowerShell
PowerShell incorpora el concepto de _pipeline_, presente en Unix, sus derivados y otros sistemas operativos. 
Se utiliza para encadenar distintas unidades de procesamiento, donde la salida de cada unidad es la entrada del siguiente.  
Muchos cmdlets incluidos en PowerShell están preparados para integrar pipelines.

Podemos aprovechar los pipelines en nuestros scripts. En tal caso, lo que cada expresión le suministrará a la siguiente, son los _datos_ que genera.  
En la función que transcribimos ya hay un ejemplo: en 
``` powershell
$files | Select-Object -Skip 1
```
la entrada del cmdlet `Select-Object` es el _valor_ de la variable `$files`, una lista. 

## Extracción de los tamaños
Como primer paso de simplificación de la función, vamos a generar la lista conformada por _el tamaño_ de cada archivo al principio, tal como lo hicimos [al utilizar list comprehensions](../algoritmia-python/solo-tamanios) en Python.  
Para esto, vamos a usar el [cmdlet `ForEach-Object`](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/foreach-object?view=powershell-7), que sirve para extraer datos de cada elemento de una lista o secuencia.  
La especificación de qué dato extraer se realiza mediante una expresión entre llaves, en la que el elemento de la lista se referencia mediante `$_`.

En concreto, para extraer el tamaño de cada archivo en `$files`, la expresión es.
``` powershell
$files | ForEach-Object {$_.Length}
```

Como resultado, obtenemos la siguiente variante.
``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $cada_tamanio_es_mas_grande = $true
    $tamanios = $files | ForEach-Object { $_.Length }
    $tamanio_anterior = $tamanios[0]

    foreach ($tamanio in ($tamanios | Select-Object -Skip 1)) {
        if ($tamanio_anterior -gt $tamanio) {
            $cada_tamanio_es_mas_grande = $false
        }
        $tamanio_anterior = $tamanio
    }

    return $cada_tamanio_es_mas_grande
}
```
Hasta ahora, no parece mucho más sencilla que la anterior. Al igual que en la evolución que realizamos sobre el código Python, cada paso nos hará más sencillo aplicar los siguientes, para llegar a una versión sensiblemente más compacta y sencilla.


## Analogía entre pipelines de PowerShell y list comprehension en Python
Notemos que el propósito del cmdlet `ForEach-Object` es similar al de las list comprehension de Python, que presentamos al [repasar conceptos básicos sobre repetición](../basicos/repeticion). 

Por ejemplo, la expresión de PowerShell
``` powershell
$files | ForEach-Object {$_.Length}
```
realiza la misma operación que la siguiente list comprehension de Python.
``` python
[file.Length for file in files]
```

Aunque no lo utilizaremos en este material, destacamos que la _condición_ que en las list comprehension puede agregarse con la cláusula `if`, también puede incoporarse en las expresiones PowerShell basadas en `ForEach-Object`.  
Para esto, la expresión que indica qué dato extraer debe tener la forma de una alternativa: 
`if (<condicion>) { <dato_a_extraer> }`

Por ejemplo, para extraer la longitud de los archivos cuyo nombre termine con "3", en Python podemos utilizar la siguiente list comprehension.
``` python
[file.Length for file in files if file.BaseName[-1] == "3"]
```
La expresión análoga en PowerShell es
``` powershell 
$files | ForEach-Object { if ($_.BaseName[-1] -eq '3') { $_.Length } }
```  

También puede obtenerse una expresión con este objetivo combinando el cmdlet `ForEach-Object` con `Where-Object`, que "filtra" la entrada de acuerdo a una condición. Siguiendo con el mismo ejemplo, la siguiente expresión PowerShell 
``` powershell 
$files | Where-Object { $_.Basename[-1] -eq '3' } | ForEach-Object {$_.Length}
```  
es equivalente a la anterior.

Esta analogía representa un ejemplo de cómo un mismo concepto se puede expresar en distintos lenguajes, aunque la técnica y sintaxis utilizadas puedan variar grandemente de lenguaje en lenguaje.
