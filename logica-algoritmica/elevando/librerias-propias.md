---
layout: default
---

# Nuestras propias librerías, y el máximo de modularidad

En los últimos ejemplos de la sección sobre [validación de datos de entrada](./validacion-datos-entrada.md) se definen funciones separadas que implementan las validaciones.

Aparte de aumentar el grado de modularidad del programa, este enfoque nos brinda la posibilidad de definir _nuestras propias librerías_ donde podemos incluir funciones que pueden ser utilizadas en distintos scripts.

En los tres lenguajes que estamos estudiando, definir una librería, y utilizarla en un script, es muy sencillo. 

Una **librería** es, sencillamente, un archivo separado que incluye el código de las funciones que se quiere aprovechar en distintos scripts. 
En PowerShell, el archivo debe tener extensión `psm1` y hay que declarar explícitamente cuáles de las funciones definidas se disponibilizan. En Python y en bash, sencillamente se coloca el código en archivos con extensión `py` o `sh` respectivamente.

En los programas, se indica al principio qué librería/s se usa/n o _importa/n_. En Python, las librerías propias se agregan a las genéricas.

Veamos el ejemplo en cada lenguaje. Aprovechamos para definir el algoritmo en una función separada, tal como comentamos al hablar sobre [modularidad](../resolvamos/modularidad-primeras-ideas.md), y aprovechar esto para reducir al mínimo el programa principal.


## PowerShell
En Powershell definimos `scriptLibrary.psm1`.
``` powershell
##  Funciones de validación datos de entrada
function CheckArgCount {
    param ($minCount, $cliArgs)
    if ($cliArgs.Count -lt $minCount) {
        Write-Host Hay que incluir, al menos, $minCount argumento/s
        Exit
    }
}

function CheckFolder {
    param ($name)
    if (-not (Test-Path -Path $name)) {
        Write-Host El valor $name no se encuentra en el sistema de archivos
        Exit
    }
    if (-not (Test-Path -Path $name -PathType Container)) {
        Write-Host El valor $name no corresponde a una carpeta
        Exit
    }
}

Export-ModuleMember -Function CheckArgCount
Export-ModuleMember -Function CheckFolder
```

Este es nuestro programa, con el máximo de modularidad.
``` powershell
Import-Module .\scriptLibrary.psm1

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

#########################################################

CheckArgCount 1 $args
CheckFolder $args[0]

$files = Get-ChildItem $args[0]
if (LosTamaniosSonCrecientes ($files)) {
    Write-Host "los logs vienen creciendo, atención"
} else {
    Write-Host "no se detecta crecimiento sostenido de logs"
}
```


## Bash
Definimos `scriptLibrary.sh`.

``` bash
##  Funciones de validación datos de entrada
check_arg_count () {
    if [ $2 -lt $1 ]
    then
        echo Hay que incluir, al menos, $1 argumento/s
        exit 1
    fi
}

check_folder () {
    if ! [ -e "$1" ]
    then
        echo El valor $1 no se encuentra en el sistema de archivos
        exit 1
    fi
    if ! [ -d "$1" ]
    then
        echo El valor $1 no corresponde a una carpeta
        exit 1
    fi
}
``` 

Este es el programa 
``` bash
. ./scriptLibrary.sh

check_arg_count 1 $#
check_folder $1

los_tamanios_son_crecientes () {
    files=$1
    cada_tamanio_es_mas_grande_que_el_anterior=true
    tamanio_anterior=$(wc -c < ${files[0]})

    for f in ${files[*]:1}
    do
        tamanio=$(wc -c < $f)
        if [ $tamanio_anterior -gt $tamanio ]
        then
            cada_tamanio_es_mas_grande_que_el_anterior=false
        fi
        tamanio_anterior=$tamanio
    done
    echo $cada_tamanio_es_mas_grande_que_el_anterior
    $cada_tamanio_es_mas_grande_que_el_anterior
}

####################################################

files=($1/*)

if los_tamanios_son_crecientes $files  
then
    echo "los logs vienen creciendo, atención"
else
    echo "no se detecta crecimiento sostenido de logs"
fi
```
Debo reconocer que me fue difícil hacer funcionar una función cuyo resultado es un valor booleano. Me basé en [este post en Stack Overflow](https://stackoverflow.com/questions/5431909/returning-a-boolean-from-a-bash-function).


## Python
Terminando nuestra gira de lenguajes, definamos `scriptLibrary.py`.
``` python
from pathlib import Path
from sys import argv, exit

##  Funciones de validación datos de entrada
def check_arg_count(n):
    if (len(argv) <= n):
        exit(f"Hay que incluir, al menos, {n} argumento/s")

def check_folder(name):
    if (not Path(name).exists()):
        exit(f"El valor {name} no se encuentra en el sistema de archivos")    
    if (not Path(argv[1]).is_dir()):
        exit(f"El valor {name} no corresponde a una carpeta")

```

Y el programa totalmente modularizado
``` python
from pathlib import Path
from sys import argv
from scriptLibrary import check_arg_count, check_folder


def los_tamanios_son_crecientes(files):
    cada_tamanio_es_mas_grande_que_el_anterior = True
    tamanio_anterior = files[0].stat().st_size

    for file in files[1:]:          # a partir del segundo archivo
        tamanio = file.stat().st_size
        if tamanio_anterior > tamanio:
            cada_tamanio_es_mas_grande_que_el_anterior = False
        tamanio_anterior = tamanio

    return cada_tamanio_es_mas_grande_que_el_anterior

####################################################################


check_arg_count(1)
check_folder(argv[1])

files = list(Path(argv[1]).iterdir())

if (los_tamanios_son_crecientes(files)):
    print("los logs vienen creciendo, atención")
else:
    print("no se detecta crecimiento sostenido de logs")

```
