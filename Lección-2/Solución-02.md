## Lección 2

Imprimiendo salidas y argumentos implícitos

La función `serialize_word` ejecuta una salida en pantalla a los parametros que le enviemos, esta función es similar a `print` en python o `console.log` en JS.

### Descripción General

Si está familiarizado con la impresión de resultados, puede omitir esta lección haciendo clic en 'Verificar respuesta' ya que no verificaremos ningún código aquí. Esta es simplemente una instrucción sobre cómo imprimir la salida con fines de depuración y visibilidad.

Si desea ver cuál es el valor de una variable en particular durante la ejecución, puede usar la función `serialize_word` como se ve a continuación.

```bash
%builtins output

from starkware.cairo.common.serialize import serialize_word

func main{output_ptr : felt*}() {

    let x : felt = 3;

    serialize_word(x);

}
```

Esto imprimirá 3 en la salida.

Nota importante: debe agregar `%builtins output`, la declaración de importación y las llaves onduladas funky con el argumento `output_ptr` para que esto funcione. Desglosemos cada una de estas partes:

* Los elementos integrados son unidades de ejecución de bajo nivel optimizadas predefinidas que se agregan a la placa de la CPU de Cairo para realizar cálculos predefinidos que son costosos de realizar en Vanilla Cairo . TL; DR : Son partes del código que no querrías escribir tú mismo en el nivel más bajo porque sería difícil y probablemente no escribirías el código de manera óptima.

* La declaración de importación solo trae la función `serialize_word` de la biblioteca común de StarkWare.

* Esos garabatos funky se conocen como argumentos implícitos. Recomendamos leer los documentos sobre ellos porque están un poco matizados. TL; DR : los argumentos implícitos permiten pasar fácilmente argumentos que sabe que eventualmente necesitará una función en una cadena de funciones. La función `serialize_word` necesita el `output_ptr` en este caso, por lo que este es un caso de uso común de tener el argumento implícito en la parte superior de la cadena de funciones (comenzando en principal), para que pueda propagarse hacia abajo en la cadena de llamadas a funciones.

## Solución

En este ejercicio, intente agregar una `serialize_word` declaración para imprimir alguna variable nueva que cree y asegúrese de que el código se compile.


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

    //do not modify code on this line or above
    //add serialize word function below here for exploration
    serialize_word(is_tri_valid);
    //do not modify code on this line or below

    return();
}

func verify_slopes(slopes_arr : felt*, slopes_len : felt) -> (is_valid : felt) {
    return(is_valid=1);
}
```

Dara un mensaje como el siguiente:

```bash
Exercise Passed!

Program output:

1
```

### Referencias

Para documentos oficiales sobre implícitos e incorporados: https://www.cairo-lang.org/docs/how_cairo_works/builtins.html