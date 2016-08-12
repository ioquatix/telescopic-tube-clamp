
use <bolts.scad>;

large_radius = 35/2;
small_radius = 32/2;

height = 40;
thickness = 30;
sleve_thickness = 6;

outset = 16;

outer_radius = large_radius + sleve_thickness;

module block() {
	translate([outer_radius, 0, height/2]) cube([outset, thickness, height], true);
}

module cutout() {
	translate([outer_radius, 0, height/2]) cube([outset, 5, height], true);
}

module sleve() {
	render() difference() {
		union() {
			cylinder_inner(height, outer_radius, 64);
			block();
		}
		
		cylinder_outer(height/2, large_radius, 64);
		translate([0, 0, height/2]) cylinder_outer(height/2, small_radius, 64);
		translate([outer_radius+1, thickness/2+1, height/2]) rotate(90, [1, 0, 0]) hole(6, thickness + 2, 0);
		
		cutout();
	}
}

sleve();

