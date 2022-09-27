## Lección 1

Firmas de función de escritura para recurrir a través de matriz

### Descripción general 

Tomaremos un enfoque paso a paso para resolver nuestro primer problema de recursividad. Para este ejercicio, solo crearemos la firma de función para la función recursiva que llamaremos. 

La recursión es el acto de una funcion llamandose a si misma. En Cairo no conocemos la longitud de un array sin realizar un seguimiento de este en una variable separada, entonces el primer parametro es una referencia al elemento actual en el array y el segundo elemento representa cuantos elementos hay hasta que lleguemos al final del array.

A las momias les encanta que sus pirámides estén hechas a mano con precisión. Considere la Gran Pirámide de Giza, todos los lados tienen una pendiente perfecta de 51,5 grados. Estaremos creando una función que verifique que la pendiente de cada lado de nuestra pirámide esté en el rango de [51,52], de lo contrario, las momias no estarán complacidas.

## Solución

Cree una función llamada `verify_slopes` que tome  `slopes_arr` como `felt*` y  `slopes_len` como un `felt` y regrese `is_valid` como un `felt` . La razón por la que estamos configurando la función de esta manera es porque en Cairo no conocemos la longitud de una matriz sin realizar un seguimiento de ella en una variable separada. Entonces, el primer parámetro es una referencia al elemento actual en la matriz y el segundo parámetro representa cuántos elementos hay hasta que lleguemos al final de la matriz.verify_slopesslopes_arrfelt*slopes_lenfeltis_validfelt

Para este ejercicio, simplemente cree la función y regrese con `return(is_valid=1);`. Nota: Este es un ejercicio intermedio para configurar una firma de función para una función que le permite iterar a través de una matriz.

```bash
//Complete the main function and any other needed functions so that the program compiles and runs successfully
func main() {

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
    return();
}
//do not modify code on this line or above

func verify_slopes(slopes_arr: felt*, slopes_len: felt) -> (is_valid: felt) {
    return(is_valid = 1);
}
```

### Referencias

Para documentos oficiales sobre matrices: https://www.cairo-lang.org/docs/reference/syntax.html