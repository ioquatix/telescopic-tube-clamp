
use <bolts.scad>;

small_radius = 32/2;

height = 20;
sleve_thickness = 6;

outer_radius = small_radius + sleve_thickness;

module foot() {
	render() difference() {
		cylinder_inner(height, outer_radius, 64);
		translate([0, 0, sleve_thickness]) cylinder_outer(height, small_radius, 64);
	}
}

foot();
