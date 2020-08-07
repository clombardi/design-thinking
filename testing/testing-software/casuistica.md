---
layout: default
---

# Casuística: análisis de los casos de test

Habiendo explicado ya el por qué y el funcionamiento de los tests automáticos, nos centraremos ahora en reflexionar sobre los casos elegidos para probar. Como adelantamos al hablar de [test cases](../sistematizacion/test-case), existen varias técnicas para elegir esos casos, algunas de las cuales comentaremos a continuación.

## ¿Dónde pongo el assert?

Continuando con el ejemplo de la función que calcula el rango de puertos, hagamos foco esta vez en las aserciones que estaban presentes en el test:

```python
# theRange debería ser [7001, 7002, 7003, ..., 7010]
assert 7000 not in theRange
assert 7001 in theRange
assert 7002 in theRange
assert 7008 in theRange
assert 7010 in theRange
assert 7011 not in theRange
assert 41 not in theRange
assert 41904 not in theRange
```

Recordemos que estos tests prueban si ciertos puertos pertenecen o no al rango que la función generó. Tenemos entonces dos posibilidades para un puerto: que pertenezca o que no pertenezca al rango, lo cual también podemos dividir en dos: que sea menor que el valor inicial o que sea mayor que el valor final. Con todo esto, nuestras [_clases de equivalencia_](./../sistematizacion/test-case.md) nos quedarían así:

1. el conjunto de los valores menores al inicio del rango,
1. el conjunto de los valores incluidos dentro del rango,
1. el conjunto de los valores mayores al final del rango.

Desde un punto de vista matemático, eso sería suficiente. Pero como aquí estamos hablando de programación, vale la pena agregar pruebas adicionales para los _boundary values_ o _casos de borde_: el primer puerto del rango y el último. Reformulemos entonces nuestras clases de equivalencia con esta salvedad:

1. el conjunto de los valores menores al inicio del rango,
1. el primer valor del rango,
1. el conjunto de los valores incluidos dentro del rango,
1. el último valor del rango,
1. el conjunto de los valores mayores al final del rango.

Por último, clasifiquemos las aserciones que teníamos a partir de estas clases:

```python
assert 7000 not in theRange   # Clase 1
assert 7001 in theRange       # Clase 2
assert 7002 in theRange       # Clase 3
assert 7008 in theRange       # Clase 3
assert 7010 in theRange       # Clase 4
assert 7011 not in theRange   # Clase 5
assert 41 not in theRange     # Clase 1
assert 41904 not in theRange  # Clase 5
```

## Una versión superadora

Analizando la clasificación anterior, vemos que nos quedaron varios tests de la misma clase. Podríamos caer en la tentación de pensar que "mientras más tests, mejor", pero eso tiene varios problemas:

* la obvia, el código se vuelve más extenso y por lo tanto más difícil de leer,
* cuesta más interpretar qué valores son importantes,
* si el código cambia en un futuro, hay que reescribir más tests,
* si el código tiene algún defecto, es altamente probable todos los tests de la misma clase fallen "en bloque", lo cual nos da la misma información que si fallara uno solo de ellos (pero de una manera más complicada).

Teniendo esto en mente, podemos limpiar un poco las aserciones:

```python
assert 7000 not in theRange   # Clase 1
assert 7001 in theRange       # Clase 2
assert 7008 in theRange       # Clase 3
assert 7010 in theRange       # Clase 4
assert 41904 not in theRange  # Clase 5
```

Extender este análisis a otros tipos de datos queda fuera del alcance de este material, pero podría pensarse algo similar para valores booleanos (verdadero/falso), números, strings, etc.

## Evitando la combinación

Hasta ahora hablamos siempre de una función con un solo parámetro pero, ¿qué pasaría si tuviera varios?

La opción _naíf_ sería realizar el análisis de las clases de equivalencia de ambos parámetros y luego escribir todas las posibles combinaciones. Si por ejemplo agregáramos un parámetro booleano, que tiene dos clases de equivalencia, y lo combináramos con el parámetro anterior, tendríamos que hacer 10 aserciones para cubrir todos los casos: los cinco que ya vimos combinados con `true` más esos mismos cinco pero combinados con `false`.

Esto nos va a resultar en una _explosión combinatoria_ que tarde o temprano se va a volver problemática. Tales casos requerirán un análisis más detallado, en el que deberemos evaluar si efectivamente tiene sentido realizar la combinatoria o si alcanza con agregar solamente dos pruebas nuevas. La respuesta dependerá de qué represente ese valor para nuestro código.

En el caso de que detectemos que hacer esa explosión combinatoria efectivamente tiene sentido, muchos lenguajes tienen herramientas para ejecutar un mismo test con distintas combinaciones de parámetros. Por ejemplo, si estuviéramos programando en Javascript y testeando con la biblioteca [Jasmine](https://jasmine.github.io/tutorials/sharing_behaviors), podríamos escribir lo siguiente para probar una función que hace la suma aritmética entre dos números:

```js
[
  { a: 1, b: 1, result: 2 },
  { a: -10, b: 3, result: -7 },
  { a: 8, b: -4, result: 4 }
].forEach(({ a, b, result }) => {
  describe(`Suma de ${a} y ${b}`, () => {
    it(`devuelve ${result}`, () => {
      expect(sumar(a, b)).toEqual(result);
    });
  });
});
```

Como se ve en el ejemplo (y como se advierte en la documentación de la herramienta), utilizar este tipo de herramientas no es gratuito: vuelve más complejo el código de tests, y podría incluso llegar a introducir defectos en los tests, que son quienes deberían encargarse de detectarlos y no de producirlos. Ya lo decía el tío Ben, _un gran poder conlleva una gran responsabilidad_.
