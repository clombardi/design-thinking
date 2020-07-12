# Patrones de diseño

En esta página comenzaremos con la descripción de uno de los tópicos principales de esta unidad, los _patrones de diseño_.

Este concepto se aplica a varios ámbitos relacionados con el software. En este material cubriremos dos de estos ámbitos: el desarrollo de software, y la configuración de containers y pods.  
Para aplicar el concepto de patrones al desarrollo de software adoptaremos la perspectiva de la POO, que es donde este concepto se identificó originalmente (siendo descripto en el ya clásico [libro-de-patrones o "GoF book"](https://www.amazon.com/-/es/Erich-Gamma-ebook/dp/B000SEIBB8)) y sobre el que encontraremos más material. Esto no implica que el concepto no pueda aplicarse en otros paradigmas de programación.

Estos dos ámbitos, el de la POO y el de los sistemas de containers, pueden ser percibidos como muy distintos.  
Para comprender cómo un mismo concepto, el de patrón de diseño, puede aplicarse a ambos, comenzaremos realizando una descripción abstracta del modelo de programa que propone la POO, que nos permitirá resaltar sus similitudes con los sistemas formados por  containers (y de hecho, con toda estructura organizada como un sistema).

Luego de esto, daremos una visión de _diseño_ que puede aplicarse de igual manera a los dos ámbitos estudiados. Es a partir de esta visión unificada que, finalmente, describiremos la idea de patrón de diseño.


## Una visión abstracta de la POO
En el modelo de programa que propone la POO, se distinguen unidades bien definidas, que son los objetos.

Estas unidades se relacionan, formando una _estructura_. El principal medio para establecer esta estructura son las relaciones que se establecen mediante los valores de los atributos de cada objeto.

Por lo tanto, la _configuración_ de un programa construido según la POO, consistirá en la creación de los objetos necesarios, y la asignación de los valores de atributos que genere la estructura deseada.








<!-- Ejemplos en desarrollo de software:
- garantizar la existencia de un único elemento de un determinado tipo. En POO, que exista una única instancia de una clase.
- flexibilizar la configuración de una operación, tal que puedan generarse distintas combinaciones de características.  
P.ej. respecto de los permisos, habilitar distintas combinaciones de condiciones: exigir que el usuario sea administrador, cuotas de uso (límite de cantidad de usos por unidad de tiempo), intervalo entre usos, etc..  
En otro dominio, la operación involucrada podría ser calcular el precio de un servicio, al que pueden aplicarse distintos descuentos, recargos, etc..

Ejemplos en containers:
- definir un único punto de acceso para un recurso que está replicado en varios nodos.
- adaptar la información generada por distintos containers, a un formato unificado que pueda ser consumido por una herramienta de monitoreo. -->