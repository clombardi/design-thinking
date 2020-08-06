---
layout: default
---

# Variables
Prácticamente todos los lenguajes de programación incorporan un concepto de _variable_.

En una definición tal vez muy poco académica, diremos que una variable es un dispositivo que tiene un nombre, y que puede memorizar un valor. Un valor puede ser cualquier cosa: un número, un string, una estructura de datos enormemente compleja.  
El nombre _variable_ indica que el valor que se memoriza puede cambiar.

Para memorizar un valor en una variable se utiliza la _asignación_, que se escribe así
```
<variable>=<valor>
```
en los tres lenguajes con los que vamos a trabajar (o sea, Python, PowerShell y bash).  

_Nota_:  
en rigor, tanto en Python como en PowerShell (y en la gran mayoría de los lenguajes) se estila poner un espacio a cada lado del signo igual, o sea:
```
<variable> = <valor>
```
Lamentablemente, bash no acepta esta variante; exige que el signo igual esté "pegado" a los otros elementos.

> _Convención_:   
> en los extractos de código, los paréntesis angulares `<...>` indican que debe incluirse una expresión de un determinado tipo.  
P.ej. en `<variable>=<valor>` se está indicando que a la izquierda del igual debe colocarse un nombre de variable, y a la derecha un valor.

Veamos un ejemplo en Python.
``` python
a = 4
```
aquí estamos asignando el valor 4 a la variable `a`. Si luego pedimos `a + 3`, obtendremos como resultado 7.  
Veamos algunas combinaciones posibles, como se puede experimentar en la consola interactiva. Lo que va detrás del numeral `#` son comentarios.
``` python
>>> a = 4
>>> a + 3
7
>>> a = 8              # se cambia el valor
>>> a + 3
11
>>> a + a              # dos referencias a la misma variable
16
>>> b = a + 6          # el valor de b se calcula a partir del valor _actual_ de a
>>> b 
14
>>> a = 21
>>> b                  # b no cambia su valor, tomó el valor de a cuando se asignó
14
>>> a                  # recordemos el valor actual de 1a
21 
>>> a = a + 9          # el nuevo valor se calcula a partir del valor actual
>>> a
30
>>> a + b              # se pueden combinar varias variables en una expresión
46
```

Los nombres de variable empiezan con una letra, pero pueden ser más largos
``` python 
>>> santaszambombasbatman = 28
>>> santaszambombasbatman * 2
56
```

En PowerShell, los nombres de variable empiezan con un signo pesos, `$`. 
``` powershell
> $a = 48
> $santaszambombasbatman = 28
> $a + 3
51
> $a + $santaszambombasbatman
76
```

En bash, la convención es más extraña: para _asignar_ se usa el nombre sin `$`, para _utilizar_ el valor se debe colocar el `$` adelante.
Y para hacer una operación aritmética, hay que encerrarla de esta forma `$((<expresion>))`.
``` bash
$ a = 48
$ echo $a
48
$ echo $a+3
48+3
$ echo $(($a+3))
51
$ santaszambombasbatman = 28
$ echo $(($a+$santaszambombasbatman))
76
```
ufff en rigor dentro de una expresión enmarcada por `$((...))`, se pueden obviar los `$` para referirnos a un nombre de variable.
``` bash
$ echo $((a+santaszambombasbatman))
76
```



