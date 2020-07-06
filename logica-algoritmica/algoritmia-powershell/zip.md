# zip - concebimos e implementamos una nueva función
Al [incorporar los pipelines en la función](./pipelines-intro.md), pasamos a esta variante
``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $cada_tamanio_es_mas_grande = $true
    $tamanios = $files | ForEach-Object Length
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
que trabaja sobre la lista de los tamaños.

El siguiente paso de simplificación que proyectamos es aplicar la operación `zip` para trabajar con una _lista de pares_, tal como [lo hicimos en Python](../algoritmia-python/zip.md).

Lamentablemente, PowerShell no incluye una función que realice la operación `zip`. Tomamos la decisión de _implementarla_, agregándola a nuestra librería. De esta forma, podremos ver cómo definir una función que puede integrarse en pipes de PowerShell.  

Antes de pensar cómo debe ser el código de la función que implementará la operación de `zip`, analicemos cómo _integrarla_ en nuestro programa.   
> **Nota**  
Por lo general, cuando implementemos un nuevo componente, debemos tener presente _cómo y dónde lo vamos a utilizar_, esto nos dará la pauta de qué características debe tener nuestra nueva creación.

En este caso, queremos incorporar una función a la que llamaremos `ZipPipe` en el pipeline, para que el resultado final del mismo sea una lista de pares. La función `LosTamaniosSonCrecientes` debería quedar de esta forma.
``` powershell
function LosTamaniosSonCrecientes {
    param($files)

    $cada_tamanio_es_mas_grande = $true
    $pares_de_tamanios = $files | ForEach-Object Length | ZipPipe

    foreach ($par in $pares_de_tamanios) {
        $tamanio_anterior, $tamanio = $par
        if ($tamanio_anterior -gt $tamanio) {
            $cada_tamanio_es_mas_grande = $false
        }
    }

    return $cada_tamanio_es_mas_grande
}
```
Observemos que estamos aprovechando la capacidad de _destructuring_ de PowerShell. Lamentablemente, debe hacerse en una sentencia separada, no puede integrarse dentro del `foreach` como hicimos [en Python](../algoritmia-python/solo-tamanios.md).


## Implementamos la función `ZipPipe`
Describimos brevemente cómo implementar una función que pueda incorporarse en un pipeline que maneja _colecciones_ (o sea listas/arrays/secuencias) de valores. Puede encontrarse más información en infinidad de links, como por ejemplo [este](https://codeandkeep.com/PowerShell-Begin-Process-End/) o [este](https://learn-powershell.net/2013/05/07/tips-on-implementing-pipeline-support/), donde se incluyen detalles que obviaremos aquí.

La función debe tener esta forma
``` powershell
function ZipList {
    param($list)
    begin { 
        # qué quiero que haga al principio
    }
    process {
        # qué quiero que haga para cada elemento, al que 
        # se accede mediante la referencia $_
    }
    end { 
        # qué hago después de procesar todos los elementos
        # aquí se retorna el valor de salida
    }
}
```

En cada uno de estos bloques pueden definirse variables, cuyo valor se conserva en los que se ejecutan luego. 

Para implementar la operación `zip`, hay que recordar el elemento "anterior" en una variable, tal como hicimos con las versiones anteriores de la función con la que estamos trabajando. Al procesar el primer elemento, no tenemos ningún "elemento anterior"; este problema se solventa mediante una variable adicional a la que bautizamos `$recien_comenzamos`.

Este es el código completo de la función `ZipPipe`.
``` powershell
function ZipPipe {
    param($list)
    begin { 
        $resultado = @()
        $recien_comenzamos = $true
    }
    process {
        if ($recien_comenzamos) {
            $recien_comenzamos = $false
        } else {
            $resultado += @(, @($elemento_anterior, $_))
        }
        $elemento_anterior = $_
    }
    end { return $resultado }
}
```
Notar la superpoblación de arrobas `@` al componer la lista. Esto es necesario porque le estamos concatenando a `$resultado` una lista _de un solo elemento_. Ver p.ej. [este post](https://superuser.com/questions/414650/why-does-powershell-silently-convert-a-string-array-with-one-item-to-a-string).

Más allá de los detalles de la definición, queremos ilustrar 
- cómo se concibió, a partir de un problema concreto que requiere el uso de una operación no implementada; 
- cómo se definió su comportamiento, pensando _cómo utilizar_ la función antes de definirla; y
- la estructura general de una función que puede ser incorporada en un pipeline de colecciones.



