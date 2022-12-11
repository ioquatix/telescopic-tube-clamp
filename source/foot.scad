
include <parts.scad>;

module foot(height = 10, radius = small_radius) {
	render() difference() {
		cylinder_inner(height, outer_radius, 64);
		translate([0, 0, 3]) cylinder_outer(height, radius, 64);
	}
}

//foot();
foot(radius=large_radius);
