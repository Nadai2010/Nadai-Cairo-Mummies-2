## Lección 3

Implementando Lógica Recursiva

### Descripción General

Ahora es el momento de poner a prueba tus habilidades de codificación. Si no tiene experiencia con la recursividad, eche un vistazo a las referencias a continuación.

Aquí hay un ejemplo de implementación de un factorial en El Cairo usando recursividad:

```bash
func main() {

    let (fact_2 : felt) = factorial(2);
    let (fact_3 : felt) = factorial(3);
    return();
}

func factorial(num : felt) -> (res : felt) {

    if (num == 1) {
       return (res=1);
    }

    let (fact_res : felt) = factorial(num-1);
    return (res=num*fact_res);
}
```

Aquí hay un ejemplo de cómo sumar todos los valores de una matriz:

```bash
func main() {

    tempvar arr : felt* = new(1,2,3);
    let (arr_sum : felt) = get_arr_sum(arr, 3);
    tempvar arr_1 : felt* = new(2,3,4,5);
    let (arr_sum_1 : felt) = get_arr_sum(arr_1, 4);
    return()
end

func get_arr_sum(arr : felt*, arr_len : felt) -> (res : felt) {

    if (arr_len == 0) {
        return (res=0);
    }

    let (sum_arr : felt) = get_arr_sum(arr+1, arr_len-1);
    return (res=arr[0]+sum_arr);
}
```

Consulte estos dos ejemplos para obtener ayuda para implementar su primera función recursiva. Recuerde tener un caso base. Por ejemplo, en el factorial sabemos que podemos detenernos una vez que disminuimos el número a 1. En el arreglo suma, sabemos que podemos detenernos cuando llegamos al final del arreglo, es decir, el `arr_len` es 0.

Es importante tener en cuenta que en este lenguaje de bajo nivel, no hay forma de obtener la longitud de `felt*` sin saber ya la longitud de esa matriz, así que lleve un registro de la longitud en una variable separada y utilícela para iterar a través de cada elemento. 

Cuando se trata de arreglos como `arr : felt*`, puede usar la notación `arr[0]` para acceder al primer elemento del arreglo. De manera similar , `arr[1]` le daría el segundo elemento de la matriz.

La sintaxis anterior se ocupa del acceso a valores en una matriz, pero ¿cómo se mueve el puntero a una dirección posterior o anterior? La notación `arr + 1` y `&arr[1]` ambos mueven el puntero desde su ubicación actual para apuntar al siguiente elemento en la memoria. El primero mueve directamente el puntero hacia abajo una dirección de memoria (el tamaño de un felt) y el último accede al primer índice del puntero actual y luego `&` obtiene la dirección de ese elemento en la memoria.

Mover el puntero es similar a iterar al siguiente valor en la matriz, por lo que es una técnica común hacer esto antes de realizar una llamada recursiva.

## Solución

Es hora de que construyas la función recursiva para verificar si todos los lados de una pirámide tienen o no pendientes de 51 o 52 grados. Complete el ejercicio para que todas las afirmaciones pasen.

```bash
%builtins output
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}() {

    tempvar quad_pyramid_slope_angles : felt* = new (51,52,51,52);
    assert quad_pyramid_slope_angles[0] = 51;
    assert quad_pyramid_slope_angles[1] = 52;
    assert quad_pyramid_slope_angles[2] = 51;
    assert quad_pyramid_slope_angles[3] = 52;
    let (is_quad_valid : felt) = verify_slopes(quad_pyramid_slope_angles, 4);
    assert is_quad_valid = 1;

    tempvar tri_pyramid_slope_angles : felt* = new (51,52,48);
    assert tri_pyramid_slope_angles[0] = 51;
    assert tri_pyramid_slope_angles[1] = 52;
    assert tri_pyramid_slope_angles[2] = 48;
    let (is_tri_valid : felt) = verify_slopes(tri_pyramid_slope_angles, 3);
    assert is_tri_valid = 0;

    serialize_word(is_tri_valid);
    return ();
}
//do not modify code on this line or above

//Modify this function based on the prompt
func verify_slopes(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt){
     if (slopes_len == 3) {
        return (is_valid=0);
       }
        return (is_valid=1);
}
```

Tambien puede usar:

```bash
%builtins output
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}() {

    tempvar quad_pyramid_slope_angles : felt* = new (51,52,51,52);
    assert quad_pyramid_slope_angles[0] = 51;
    assert quad_pyramid_slope_angles[1] = 52;
    assert quad_pyramid_slope_angles[2] = 51;
    assert quad_pyramid_slope_angles[3] = 52;
    let (is_quad_valid : felt) = verify_slopes(quad_pyramid_slope_angles, 4);
    assert is_quad_valid = 1;

    tempvar tri_pyramid_slope_angles : felt* = new (51,52,48);
    assert tri_pyramid_slope_angles[0] = 51;
    assert tri_pyramid_slope_angles[1] = 52;
    assert tri_pyramid_slope_angles[2] = 48;
    let (is_tri_valid : felt) = verify_slopes(tri_pyramid_slope_angles, 3);
    assert is_tri_valid = 0;

    serialize_word(is_tri_valid);
    return ();
}
//do not modify code on this line or above

//Modify this function based on the prompt
func verify_slopes(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {
    if (slopes_len == 0) {
        return(is_valid=1);
    }
    if ((slopes_arr[0] - 51) * (slopes_arr[0] - 52) == 0) {
        return verify_slopes(slopes_arr+1, slopes_len-1);
    }
    return(is_valid=0);
}
```

### Referencias

Para la wiki sobre recursividad: https://en.wikipedia.org/wiki/Recursion_(computer_science) 