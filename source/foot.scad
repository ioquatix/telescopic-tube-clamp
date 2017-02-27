
include <parts.scad>;

module foot(height = 10) {
	render() difference() {
		cylinder_inner(height, outer_radius, 64);
		translate([0, 0, 3]) cylinder_outer(height, small_radius, 64);
	}
}

foot();
