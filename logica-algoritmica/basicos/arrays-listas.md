---
layout: default
---

# Arrays - listas - secuencias
Prácticamente cualquier lenguaje de programación incluye alguna estructura que permita trabajar con listas ordenadas de elementos. Los conceptos más usuales son los de _array_ y _lista_.  
Para este material, vamos a tratar a estos dos conceptos como sinónimos salvo aclaración explícita.
Aunque sabemos que estamos realizando una gran simplificación, entendemos que concentrarnos en las diferencias presentes en algunos lenguajes (y en muchos textos sobre programación y estructuras de datos) nos aleja de los propósitos de este curso.

Una lista es una estructura que puede contener varios valores, en forma ordenada. Los valores que contiene se llaman _elementos_ del array. Vamos a poder obtener el primer elemento, el segundo, el último.

Los tres lenguajes que vamos a considerar (Python, PowerShell y bash) permiten construir listas fácilmente. P.ej. para crear una lista de números:

| Lenguaje | Expresión |
| --- | --- | 
| Python | [32, 5, 48, 21] |
| PowerShell | @(32, 5, 48, 21) |
| bash | (32 5 48 21) |

En esta lista, el primer elemento es el 32, el segundo 5, el tercero 48, el cuarto y último 21.

Las listas son valores, por lo tanto se pueden utilizar variables para memorizarlas.  
Veamos en Python un ejemplo, seguido de dos de las operaciones básicas sobre una lista: acceder al elemento que está en una posición determinada, y obtener la _longitud_, o sea, cuántos elementos tiene
``` python
>>> numeritos = [32, 5, 48, 21]
>>> numeritos[2]
48
>>> len(numeritos)
4
```

## "Base 0"
**¡¡Momento!!**  
Parece claro que `numeritos[2]` se refiere al _segundo_ elemento de la lista (que memorizamos en la variable) `numeritos`. Pero `48` ... ¡es el _tercer_ elemento!  
¿Hay algo mal?

No, no hay nada mal, estamos viendo el efecto de que los _índices_ de una lista (o sea, el número que indica la posición del elemento que nos interesa) no comienzan desde 1, sino desde 0. Se dice que las listas tienen "base 0".  
La gran mayoría de los lenguajes, entre ellos los tres que utilizamos en este material, trabajan "base 0". Hay algunos, entre ellos Matlab y también el venerable FORTRAN, que trabajan "base 1", o sea, que los índices comienzan desde 0. Pero son pocos.  
En [este link](http://xahlee.info/comp/comp_lang_array_index_start_0_or_1.html) se habla del tema.

Con esto en claro, sigamos experimentando
``` python
>>> numeritos[0]
32
>>> numeritos[0] + numeritos[1]
37
>>> numeritos[1+1]
48
>>> a = 1
>>> numeritos[a]                        # segundo elemento, porque a tiene valor 1
5
>>> numeritos[a-1]                      # segundo elemento; 1-1 = 0
32
>>> numeritos[a+1]-numeritos[a-1]       # o sea, el tercer elemento menos el primero
16
>>> a = 3
>>> numeritos[a]                        # ahora la variable a tiene valor 3
21
>>> numeritos[a-1]
48
```
En estos ejemplos, queremos mostrar que el índice puede no ser un valor fijo. Se puede utilizar cualquier expresión (cuyo resultado sea un número, claro), incluyendo operaciones y variables.

¿Cómo acceder al _último_ elemento? Está relacionado con lo que llamamos "longitud". Pero si los índices comienzan en 0, entonces terminan en ...
``` python
>>> numeritos[len(numeritos)-1]
21
```
para obtener el índice del último elemento, hay que restarle uno a la longitud.

<div>
Lo que viene es un "truco de código", me gustaría marcar este tipo de elementos con algún recurso gráfico, como un recuadro con un fondo de color o algo. Obviamente, lo dejo a criterio de la diagramadora.
</div>{: style="color: Crimson"}  

**Truco**  
En Python (y también en PowerShell y bash), se admiten _índices negativos_ para acceder a los elementos de una lista "de atrás hacia adelante": el `-1` es el último, el `-2` el penúltimo, etc.. Por ejemplo
``` python
>>> numeritos[-1]                  # puede ser útil
21
>>> numeritos[-2]                  # también
48
>>> numeritos[-(len(numeritos))]   # sólo una forma retorcida de acceder al primer elemento
32
```

_fin del truco_{: style="color: Crimson"}  

Cerramos con algunos de estos ejemplos en PowerShell
``` PowerShell
> $numeritos = @(32, 5, 48, 21)
> $numeritos[2]
48
> $numeritos.Length
4
> $a = 1
> $numeritos[$a]
5
> $numeritos[$a-1]
32
> $numeritos[-1]
21
```

y en bash
``` bash
$ numeritos=(32 5 48 21)
$ echo ${numeritos[2]}
48
$ a=1
$ echo ${numeritos[a]}
5
$ echo ${numeritos[a-1]}
32
$ echo ${numeritos[-1]}
21
```


## Acceder a secciones - slice
Otra operación usual sobre listas es acceder a una _sección_, p.ej. del segundo elemento en adelante, entre el tercero y el quinto, etc.. En el argot técnico, se conocen como _slice_ a estas secciones, y también a la operación que permite obtenerlas.  
Varios lenguajes modernos, entre ellos los tres que estamos trabajando en esta unidad, incluyen una sintaxis especial para el _slicing_. Veámoslo con ejemplos sobre una lista más grande.

Empecemos por Python:
``` python
>>> muchos_numeritos = [32, 5, 48, 21, 94, 4, 104, 72]
>>> muchos_numeritos[2:5]              # del tercero al quinto
[48, 21, 94]
>>> muchos_numeritos[1:]               # del segundo en adelante
[5, 48, 21, 94, 4, 104, 72]
>>> muchos_numeritos[-3:]              # los últimos tres
[4, 104, 72]
```

Vamos a PowerShell. Se incluye el `Write-Host` para que muestre todos los números en una misma línea, obviamente si se quiere asignar el _slice_ a una variable, o utilizarlo de otra forma dentro de un programa, debe obviarse esta indicación.  
Brindamos dos alternativas para "del segundo en adelante", porque la idea es que no sea necesario referirse explícitamente al `Length`, pero ... PowerShell lo hace largo. 
``` powershell
> $muchos_numeritos = @(32, 5, 48, 21, 94, 4, 104, 72)
> Write-Host $muchos_numeritos[2..4]                             # del tercero al quinto
48 21 94
> Write-Host $muchos_numeritos[1..$muchos_numeritos.Length]      # del segundo en adelante
5 48 21 94 4 104 72
>  Write-Host ($muchos_numeritos | Select-Object -Skip 1)        # del segundo en adelante, otra forma
5 48 21 94 4 104 72
> Write-Host $muchos_numeritos[-3..-1]                           # los últimos tres
4 104 72
```

Finalmente, en bash
``` bash
$ muchos_numeritos=(32 5 48 21 94 4 104 72)
$ echo ${muchos_numeritos[*]:2:3}                   # del tercero al quinto
48 21 94
$ echo ${muchos_numeritos[*]:1}                      # del segundo en adelante
5 48 21 94 4 104 72
$ echo ${muchos_numeritos[*]: -3}                   # los últimos tres
4 104 72
```
**Atención**: en la expresión para obtener los últimos tres elementos, el espacio antes del -3 es _obligatorio_. Bash es así, lo apreciamos como es.  

Uf, tres lenguajes, tres formas distintas para indicar la sección "del tercero al quinto". Lo explicamos brevemente
- _Python_: `[2:5]` se interpreta como "del tercero al sexto, pero sin incluir el sexto". Más precisamente "del elemento 2 al elemento 5, incluyendo el 2 pero excluyendo el 5".
- _PowerShell_: `[2..4]` se interpreta como "del elemento 2 al elemento 4, en ambos casos inclusive".
- _bash_: `:2:3` se interpreta como "a partir del elemento 2, tres elementos".



## Modificar una lista
Hasta ahora hemos _accedido_ a los elementos de una lista. Pero también podemos _modificarla_. Van algunos ejemplos en Python.
``` python
>>> numeritos = [32, 5, 48, 21]
>>> numeritos[2] = 107
>>> numeritos.append(12)
>>> len(numeritos)
5
>>> numeritos
[32, 5, 107, 21, 12]
```
Realizamos dos operaciones: primero _modificamos_ un elemento, el tercero, asignando como nuevo valor 107; y luego _agregamos_ un elemento, en este caso el número 12.

Así es en PowerShell.
``` PowerShell
> $numeritos = @(32,5,48,21)
> $numeritos[2] = 107
> $numeritos = $numeritos + 12
> $numeritos.Length
5
> $numeritos
32
5
107
21
12
```

Así es en Bash.
``` bash
$ numeritos=(32 5 48 21)
$ numeritos[2]=107
$ numeritos+=( 12 )
$ echo ${#numeritos[*]}
5
$ echo ${numeritos[*]}
32 5 107 21 12
```
Obsérvese la sintaxis para obtener la longitud de una lista, y para referirnos a la lista completa.
