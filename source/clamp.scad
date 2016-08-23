
use <bolts.scad>;

large_radius = 34.8/2;
small_radius = 32/2;

height = 20;
tube_offset = height / 2;
thickness = 34;
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
		
		cylinder_outer(tube_offset, small_radius, 64);
		translate([0, 0, tube_offset]) cylinder_outer(height-tube_offset, large_radius, 64);
		translate([outer_radius, thickness/2+1, height/2]) rotate(90, [1, 0, 0]) hole(6, thickness + 2, 0);
		
		cutout();
	}
}

sleve();

