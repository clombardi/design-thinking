# Definamos un algoritmo

En la [página anterior](./estrategia.md) diseñamos una estrategia para resolver el [desafío](../desafio-enunciado.md) que queremos resolver.

En esta página, vamos a definir un **algoritmo** que lleve la estrategia a algo más parecido a un programa. Pero antes, respondamos una pregunta que tal vez esté en el aire.

## ¿Por qué "algoritmo" y no "programa"?
La pregunta es muy buena, ¿por qué todos estos pasos, primero estrategia, después algoritmo, recién depués programa?  
Indiquemos primero, dos diferencias entre algoritmo y programa
1. Un _algoritmo_ no está "pegado" a un lenguaje de programación; un mismo algoritmo puede expresarse en distintos lenguajes. Un _programa_ consta de código, está escrito en un lenguaje específico.  
En nuestro caso, el algoritmo que vamos a plantear a continuación, lo vamos a plasmar después en los trs lenguajes en los que venimos trabajando: Python, bash y PowerShell. Mismo algoritmo, tres programas.
1. El _algoritmo_ se concentra en (justamente) la tarea algorítmica que se necesita resolver. Un _programa_ tiene que contemplar todos los aspectos, en nuestro caso el algorítmico y el técnico.

Digamos además que estamos haciendo una exposición muy "paso-a-paso". A medida que se adquiere experiencia, se va pensando al mismo tiempo en estrategia, algoritmo y programa en un lenguaje determinado.  
Preferimos contarlo de esta forma por el siguiente detalle:
si un problema se complica, una estrategia para buscarle una solución es ir más despacio, e ir a esta separación, pensar el algoritmo por separado, o incluso la estrategia.  
A partir de esta presentación paso a paso, en caso de emergencia pueden trabajar con cada concepto por separado.


## Manos a la obra
Por lo que acabamos de decir, podemos suponer que la tarea técnica está resuelta. Por decir algo, supongamos que tenemos una lista de números que tiene el tamaño de cada archivo, en el orden en que los tenemos que revisar. Si esto no es exactamente así, lo ajustaremos en el programa.


### Un reflejo de desarrollador - elección de nombre de variable
En los algoritmos, muchas veces se hace uso de [variables](../basicos/variables.md).  
En este caso, vamos a usar una variable para obtener el _resultado_. Recordemos que este resultado va a ser un booleano, o sea `true`  o `false`.  
Antes de seguir, pensemos en un _nombre_ para esta variable. Elegir nombres que ayuden a leer nuestros programas es una práctica que es muy saludable adquirir, eso lo mencionamos al hablar sobre [la diferencia entre programar y desarrollar](../../programacion-a-desarrollo/programar-y-desarrollar). En este caso podría ser `resultado`, pero busquemos una alternativa.  
Esta es una variable cuyo valor va a ser booleano, en breve es una _variable booleana_. Para darle nombre a una variable booleana, conviene pensar _qué representa que el valor de esa variable sea `true`. En este caso, la variable es true si cada archivo es más grande que el anterior. Ahí tenemos un nombre, un poco largo pero muy descriptivo: `cada_tamanio_es_mas_grande_que_el_anterior`. Me gustó.  
Si queremos ser un poco más breves, podemos recurrir a la idea de "creciente", p.ej. `tamanios_crecientes`. Pero vamos con el nombre largo, si queda demasiado engorroso lo cambiamos.

El mensaje principal que queremos dejar es la conveniencia de dedicarle unos momentos a la elección de nombres, no poner siempre `a`, `b`, `c`, `i`, etc..


### Estructura del algoritmo
Siguiente pregunta: ¿cuál es el valor inicial de la variable? Revisando la estrategia, observamos que estamos buscando una comparación "mala": si aparece, el resultado debe ser _false_. Entonces, conviene que el valor inicial sea _true_, si no aparece ninguna razón que haga cambiar este valor (o sea, una comparación "mala"), este es el resultado deseado.  
A su vez, para hacer las comparaciones, vamos a tener que recorrer la lista de tamaños.

A grandes rasgos, esta es una posible forma del algoritmo
``` bash
cada_tamanio_es_mas_grande_que_el_anterior = true
for tamanio in tamanios
do
    # ... una comparacion
done
return cada_tamanio_es_mas_grande_que_el_anterior
```

> **Nota**  
Llamemos **identificador** a cualquier nombre que incluimos en un programa: nombre de variable, de función, etc..  
Aunque actualmente muchos lenguajes permiten incluir eñes, letras acentuadas, etc.. en los identificadores, se sigue recomendando fuertemente no hacerlo, circunscribirnos al juego de caracteres de 7 bits.


### ¿Cómo expresamos un algoritmo?
Recordemos que un algoritmo no es (todavía) un programa. Por lo tanto, no es necesario que sigamos la sintaxis de un lenguaje, podemos usar expresiones incorrectas sintácticamente si resultan más claras para la lectura, o mezclar elementos de distintos lenguajes.  
En resumen, somos libres de "tomar lo mejor de cada casa".

En este caso, elegimos mezclar elementos de bash y de Python.
- Delimitamos la repetición y el condicional como en bash, porque nos resulta claro que se indiquen explícitamente el `done` y el `fi`.
- Usamos la sintaxis para acceder a variables de Python, para ahorrarnos los signos-pesos `$`.


### El meollo del asunto - resolver las comparaciones
Aquí nos encontramos con la complejidad de este problema, el aspecto que hace difícil encuadrarlo en los esquemas más sencillos de recorrido: en cada comparación debo comparar el `tamanio` actual _con el anterior_. 
Recordemos además que debemos hacer, a lo sumo, _una comparación menos_ que la cantidad de archivos.  
Por lo tanto, vamos a tener que hacer ajustes y/o agregados sobre la estructura que planteamos.

Este problema tiene muchas soluciones. Elegimos una que, aunque se aleja de "la academia", creemos que está bien adaptada a un estilo de programación más actual. 

Empecemos diciendo que para comparar dos números, tengo que poder acceder a ambos. En cada comparación, el tamaño actual es el valor de la variable `tamanio` introducida en el `for`. Para el tamaño anterior, vamos a definir una variable adicional, `tamanio_anterior`.

Teniendo en cuenta que debemos realizar una comparación menos, vamos a "separar" el primer elemento de la lista del resto. El primer elemento lo vamos a asignar a `tamanio_anterior` _antes_ del recorrido. Y para el recorrido tomamos el "slice" que comienza con el segundo elemento, hablamos sobre slices en la [página sobre listas/arrays](../basicos/arrays-listas.md).

Con estos elementos, ya podemos proceder
``` bash
cada_tamanio_es_mas_grande_que_el_anterior = true
tamanio_anterior = tamanios[0]
for tamanio in tamanios[1:]           # recordar que [1:] significa "del segundo en adelante"
do
    if tamanio_anterior > tamanio
       cada_tamanio_es_mas_grande_que_el_anterior = false
    fi
    tamanio_anterior = tamanio        # importante!!
done
return cada_tamanio_es_mas_grande_que_el_anterior
```
La línea marcada como **importante** es, efectivamente, crucial: el valor que es el `tamanio` de una comparación, debe pasar a ser el `tamanio_anterior` en la siguiente.  
Les sugerimos que revisen el comportamiento de este algoritmo con los ejemplos que brindamos al describir la [estrategia](./estrategia.md), para seguir la mecánica. En el primero de esos ejemplos, la lista `tamanios` toma el valor `[3, 8, 5, 22]`; por lo tanto, `tamanios[1:]` será `[8, 5, 22]`.

> Una observación antes de seguir: creemos que la **legibildad** del algoritmo es buena, a lo cual contribuye el (largo) nombre de la variable que registra el resultado.  
Este algoritmo discierne si `cada_tamanio_es_mas_grande_que_el_anterior`, lo que no ocurre si para algún elemento a partir del segundo, resulta que `tamanio_anterior > tamanio`. Todos estos elementos aparecen _explícitamente_ en el algoritmo. Más adelante, buscaremos alternativas que lleguen a programas más claros.

### ¿Hace comparaciones "de más"? - una nota sobre eficiencia
Del algoritmo que acabamos de armar, se puede cuestionar una cuestión de _eficiencia_. 

Supongamos que la serie de tamaños es `[35, 21, 84, 95, 72, 104, 29, 89, 57]`.  
Ya con la primer comparación podemos determinar que el resultado debe ser `false`. A pesar de ello, nuestro algoritmo _realiza todas las comparaciones_, aún en los casos donde una comparación resulta suficiente.

En principio, el cuestionamiento es correcto. Vamos a hacer tres comentarios sobre este punto.

**Primer comentario - dónde está el tiempo**  
OK, los programas generados a partir de este algoritmo van a ser más lentos de lo que podrían. Pero ¿_cuánto_ más lentos? 
¿Qué va a tardar más, la tarea técnica o la algorítmica?  
Creemos que en la mayor parte de las situaciones, la consulta a un file system para obtener la información sobre cada archivo en una carpeta va a tomar más tiempo, en _órdenes de magnitud_, que la ejecución del algoritmo. Si esto es cierto, entonces la pérdida de eficiencia es despreciable, y por lo tanto podemos ignorarla.

En casos extremos, p.ej. carpetas con miles de archivos, va a aportar más a la eficiencia la búsqueda de formas de leer la información progresivamente, que el corte del algoritmo por sí mismo.

En general, las cuestiones de eficiencia están muchas veces tratadas en formas no rigurosas, concentrándose la atención en cuestiones poco relevantes.  
Si vamos a trabajar sobre la eficiencia, debe mirarse el programa y no sólo el algoritmo, y hacer un análisis adecuado de "dónde está el tiempo", cuáles son las tareas que llevan la mayor parte del tiempo de ejecución.

**Segundo comentario - `break`**  
_Habiendo dicho lo anterior_, aclaremos ahora que la repetición se puede "cortar" utilizando el comando `break`, presente en [Python](https://docs.python.org/3.7/tutorial/controlflow.html), [PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_break?view=powershell-7), y [bash](https://linuxize.com/post/bash-break-continue/).

Nuestro algoritmo queda así.
``` bash
cada_tamanio_es_mas_grande_que_el_anterior = true
tamanio_anterior = tamanios[0]
for tamanio in tamanios[1:]           # recordar que [1:] significa "del segundo en adelante"
do
    if tamanio_anterior > tamanio
       cada_tamanio_es_mas_grande_que_el_anterior = false
       break
    fi
    tamanio_anterior = tamanio        # importante!!
done
return cada_tamanio_es_mas_grande_que_el_anterior
```

**Tercer comentario - alternativas superadoras**  
Más adelante en esta unidad, veremos alternativas en más de un lenguaje, que "se encargan" de realizar el corte sin que tengamos que preocuparnos.


### Una alternativa clásica - uso del `while`
Buceando en viejos libros de programación, es probable que la solución a este tipo de problemas se base en un `while` que trabaja con los índices de la lista de tamaños.  
Consignamos un algoritmo de este estilo que resuelve el problema al que estamos abocados, para dar un ejemplo de algoritmo "clásico", y también para mostrar dos algoritmos distintos que resuelven el mismo problema.






## Algunos tips
No perder de vista la _estructura general_ del algoritmo: cuál es el resultado esperado, cómo manejarlo, otras acciones que pudiera ser conveniente realizar al princpio o al final. Esto nos ayuda a llegar al punto de resolver el cuerpo del algoritmo con algunas ideas claras, evitando que nos mareemos por estar pensando en varias cuestiones al mismo tiempo.

Tener en cuenta la posibilidad de utilizar _variables_, y ponerles nombres descriptivos. 