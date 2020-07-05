# Validación de datos de entrada

Analicemos la primera de las preguntas que nos realizamos [al cuestionar la calidad del programa generado](./cuestionar-calidad.md): ¿qué pasa si **no** se le suministra al programa lo que espera?  

Experimentemos con la versión en Python
![no hay chequeo de datos de entrada](./images/wrong-input-wrong-behavior.jpg)

Estamos mostrando tres posibles _problemas con los datos de entrada_
1. no se suministra un parámetro
1. el valor que se suministra no es el nombre de un elemento del file system
1. el valor que se sumnistra es el nombre de un archivo, se espera una carpeta.

En los tres casos, el programa responde con un mensaje de error ... generado por Python. Un programa de mayor calidad, prevé los posibles problemas, y genera mensajes más adecuados. 
O sea, realiza lo que se conoce como _validación de datos de entrada_.


## Las tareas técnicas involucradas
Tal como nos pasó con el programa, la validación de datos de entrada implica tareas técnicas y otras relacionadas con la estructura del programa.

Las tareas técnicas a resolver son: 
- saber si se suministró un parámetro por CLI al invocar al programa.
- verificar si el parámetro es o no un elemento del file system.
- en caso afirmativo, verificar que sea una carpeta.

Como cuando armamos el [programa](../resolvamos/primer-programa.md), resumimos en la siguiente tabla las expresiones para estas validaciones, en los tres lenguajes con los que estamos trabajando.

| Lenguaje | No se pasaron parámetros | `<valor>` está en el file system | `<valor>` es una carpeta |
| --- | --- | --- | --- | 
| Python | `len(argv) <= 1` | `Path(<valor>).exists()` | `Path(<valor>).is_dir()` |
| PowerShell | `($cliArgs.Count -lt 1)` | `Test-Path -Path <valor>` | `Test-Path -Path <valor> -PathType Container` |
| bash | `$# -lt 1` | `-e "<valor>"` | `-d "<valor>"` |


