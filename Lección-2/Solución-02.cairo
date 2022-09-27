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