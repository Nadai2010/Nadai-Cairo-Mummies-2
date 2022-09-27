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