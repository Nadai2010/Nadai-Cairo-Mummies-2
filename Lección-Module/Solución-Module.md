## Lección Module Final

Resolver el módulo sin ayuda

### Descripción General

Para completar este módulo, deberá escribir tres funciones:

* `verify_slopes`, que tiene dos parámetros `slopes_arr` y `slopes_len` que devuelve un `felt is_valid` que es 1 si es verdadero o 0 si es falso. ¿Qué hace que una pirámide sea válida? Si una serie de pendientes de los lados de una pirámide están todas en el rango de [51, 52], entonces la pirámide es válida y está a la altura de los estándares arquitectónicos de las momias. (La gran pirámide de Giza tiene todos sus lados exactamente a 51,5 grados).

* `double_verify_slopes`, que tiene cuatro parámetros `first_arr`,`first_arr_len`,`second_arr`, `second_arr_len` y devuelve un  `felt` `res`. Ejecutará el método `verify_slopes` una vez en la primera matriz y luego una vez en la segunda matriz, devolviendo 1 si ambas pirámides son válidas y 0 en caso contrario.

* `is_silly_pyramid`, que tiene dos parámetros `slopes_arr` y `slopes_len` que devuelve dos `felts`, `is_negative_pyramid` y `is_never_ending_pyramid`, cada uno de los cuales es 1 si es verdadero o 0 si es falso. ¿Qué hace una pirámide negativa? Cada una de las pendientes de los lados de la pirámide debe estar en el rango [-89, -1], esto haría una pirámide que se cierra y queda al revés. ¿Qué hace una pirámide interminable? Cada una de las pendientes de los lados de la pirámide debe estar en el rango [90, 179], ya que esto haría que las paredes de la pirámide se extendieran hasta el cielo para siempre. 

## Solución

Su objetivo es hacer que el script se compile y se ejecute correctamente. ¡Buena suerte! Si comprende qué es una `local` variable, puede usarla en sus funciones, pero intente lograr esto solo usando `let` para construir su astucia en El Cairo

```bash
%builtins output range_check
from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*, range_check_ptr}() {

    alloc_locals;
    tempvar quad_pyramid_slope_angles : felt* = new (51,52,51,52);
    local quad_pyramid_slope_angles : felt* = quad_pyramid_slope_angles;
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

    let (double_verify_res : felt) = double_verify_slopes(quad_pyramid_slope_angles, 4, tri_pyramid_slope_angles, 3);
    assert double_verify_res = 0;

    tempvar valid_tri_pyramid_slope_angles : felt* = new (51,52,52);
    let (is_tri_negative_pyramid : felt, is_tri_never_ending_pyramid : felt) = is_silly_pyramid(valid_tri_pyramid_slope_angles, 3);
    assert is_tri_negative_pyramid = 0;
    assert is_tri_never_ending_pyramid = 0;

    tempvar quad_full_obtuse_slope_angles : felt* = new (90,92,105,105);
    let (is_full_obtuse_negative_pyramid : felt, is_full_obtuse_never_ending_pyramid : felt) = is_silly_pyramid(quad_full_obtuse_slope_angles, 4);
    assert is_full_obtuse_negative_pyramid = 0;
    assert is_full_obtuse_never_ending_pyramid = 1;

    tempvar quad_full_negative_slope_angles : felt* = new (-1,-5,-10,-45);
    let (is_full_negative_negative_pyramid : felt, is_full_negative_never_ending_pyramid : felt) = is_silly_pyramid(quad_full_negative_slope_angles, 4);
    assert is_full_negative_negative_pyramid = 1;
    assert is_full_negative_never_ending_pyramid = 0;

    tempvar quad_partial_obtuse_slope_angles : felt* = new (90,92,89,105);
    let (is_partial_obtuse_negative_pyramid : felt, is_partial_obtuse_never_ending_pyramid : felt) = is_silly_pyramid(quad_partial_obtuse_slope_angles, 4);
    assert is_partial_obtuse_negative_pyramid = 0;
    assert is_partial_obtuse_never_ending_pyramid = 0;

    tempvar quad_partial_negative_slope_angles : felt* = new (-1,-5,10,-45);
    let (is_partial_negative_negative_pyramid : felt, is_partial_negative_never_ending_pyramid : felt) = is_silly_pyramid(quad_partial_negative_slope_angles, 4);
    assert is_partial_negative_negative_pyramid = 0;
    assert is_partial_negative_never_ending_pyramid = 0;

    return();
}

//do not modify code on this line or above

func verify_slopes(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {
    if (slopes_len == 0) {
        return(is_valid=1);
    }
    if ((slopes_arr[0] - 51) * (slopes_arr[0] - 52) == 0) {
        return verify_slopes(slopes_arr+1, slopes_len-1);
    }
    return(is_valid=0);
}


func double_verify_slopes(first_arr : felt*, first_arr_len : felt, second_arr : felt*, second_arr_len : felt) -> (res : felt) {
    alloc_locals;
    let (local first_verify : felt) = verify_slopes(first_arr, first_arr_len);
    let (local second_verify : felt) = verify_slopes(second_arr, second_arr_len);
    if (first_verify+second_verify == 2) {
        return(res=1);
    }
    return (res=0);
}

func v_slopes{output_ptr : felt*, range_check_ptr}(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {
    if (slopes_len == 0) {
        return(is_valid=1);
    }
    if ((slopes_arr[0] - 51) * (slopes_arr[0] - 52) == 0) {
        return v_slopes(slopes_arr+1, slopes_len-1);
    }
    return(is_valid=0);
}
func never_ending{output_ptr : felt*, range_check_ptr}(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {
    if (slopes_len == 0) {
        return(is_valid=1);
    }
    if ( is_le(slopes_arr[0], 89) + is_le(slopes_arr[0], 179) == 1) {  
    return never_ending(slopes_arr+1, slopes_len-1);
    }
   return(is_valid=0);
}

func negative{output_ptr : felt*, range_check_ptr}(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {    
   if (slopes_len == 0) {
        return(is_valid=1);
    }
   if ((is_le(slopes_arr[0], -89)) + (is_le(slopes_arr[0], -1)) == 1) {
    return negative(slopes_arr+1, slopes_len-1);
     }
    return(is_valid=0);
}  
func is_silly_pyramid{output_ptr : felt*, range_check_ptr} (slopes_arr : felt*, slopes_len : felt) -> ( is_negative_pyramid : felt, is_never_ending_pyramid : felt) {
    alloc_locals;
    let (local first_verify : felt) = v_slopes(slopes_arr, slopes_len);
    let (local second_verify : felt) = negative(slopes_arr, slopes_len);
    let (local third_verify : felt) = never_ending(slopes_arr, slopes_len);
   
    if (first_verify == 1) {
        return(0,0);
    }
    if (second_verify == 1) {
        return(1,0);    
    }
    if (third_verify == 1) {
        return(0,1);
    }
    return (0,0);
}
```

##  Referencias

Para documentos oficiales de El Cairo:  https://www.cairo-lang.org/docs/

## FELICIDADES, Un pasito más en Cairo.

![Graph](FinalModule.png)