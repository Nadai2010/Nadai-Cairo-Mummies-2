## Lección 0

Crear una matriz (Array)

### Descripción general matrices (Array)

Las Listas o Arreglos son necesarios en cualquier lenguaje de programación, en Cairo podemos pensar en los arreglos como espacios de memoria contiguos las cuales forman el tamaño del arrgelo y las direcciones de esos espacios de memoria contienen el valor guardado en la posicion del arreglo. Podemos crear una matriz de `felt*` de varias maneras:

```bash
from starkware.cairo.common.alloc import alloc
...

let felt_array : felt* = alloc();
assert [felt_array] = 1;
assert [felt_array+1] = 2;
assert [felt_array+2] = 3;
```
También podria usar:

```bash
tempvar felt_array : felt* = new (1, 2, 3);
```

¡Ambos funcionarán! El primero es más dinámico ya que puede continuar agregando a la matriz, mientras que el segundo está hecho para una matriz de tamaño fijo pero también es mucho más fácil de escribir. Para usar el primer ejemplo anterior, asegúrese de que la declaración de importación esté incluida en la parte superior de su secuencia de comandos.

### Descripción General (tempvar)

Ahora puede que sienta curiosidad por saber qué es una `tempvar` y en qué se diferencia de la palabra clave `let`. Esto es algo para consultar en los documentos oficiales para obtener información más detallada, pero las variables temporales reservan un lugar en la memoria de forma temporal como lo indica su nombre, una vez ejecutada las instrucciones estas variables no estan disponibles para acceder desde otras funciones de nuestro programa de Cairo, almacena la expresión en sí misma desde el lado derecho del signo igual a la variable en lugar del valor de la expresión. Por otro lado, en realidad `tempvar` evalúa la expresión y almacena el valor en la variable.

Así que si tienes:

```bash
let x = 3;
let y = x * x * x;
let z = y * y * y;
```

`z` En realidad está almacenando la expresión `y` , que está almacenando tres veces y que está almacenando `x` tres veces. Lo mismo ocurre con la computación (x^9).`x*x*x*x*x*x*x*x*x`.

Mientras tanto si tienes:

```bash
tempvar x = 3;
tempvar y = x * x * x;
tempvar z = y * y * y;
```

* Luego `x = 3`, `y = 27` y luego `z = 19683` (27^3).

Basta de charlas variables, las momias quieren asegurarse de que puedas analizar las pendientes de las paredes de sus pirámides, así que ahí es donde comenzaremos.

## Solución

Cree matrices llamadas `quad_pyramid_slope_angles` y `tri_pyramid_slope_angles` que sean del tipo `felt*` que permita el paso de las aserciones. Para este ejercicio utilice la notación `tempvar`.

```bash
//Complete the main function and any other needed functions so that the program compiles and runs successfully
func main() {
    //do not modify code on this line or above
tempvar quad_pyramid_slope_angles : felt* = new (51, 52, 51, 52);
tempvar tri_pyramid_slope_angles : felt* = new (51, 52, 48);


    //do not modify code on this line or below
    assert quad_pyramid_slope_angles[0] = 51;
    assert quad_pyramid_slope_angles[1] = 52;
    assert quad_pyramid_slope_angles[2] = 51;
    assert quad_pyramid_slope_angles[3] = 52;

    assert tri_pyramid_slope_angles[0] = 51;
    assert tri_pyramid_slope_angles[1] = 52;
    assert tri_pyramid_slope_angles[2] = 48;
    return();
}
```

### Referencias

Para documentos oficiales sobre matrices:  https://www.cairo-lang.org/docs/reference/syntax.html 

Para documentos oficiales sobre tempvar vs let: https://www.cairo-lang.org/docs/how_cairo_works/consts.html 