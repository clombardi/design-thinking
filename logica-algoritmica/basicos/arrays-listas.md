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
