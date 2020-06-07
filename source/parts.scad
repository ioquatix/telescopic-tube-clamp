
$tolerance = 0.1;
$fn = $preview ? 12 : 32;

use <bolts.scad>;
use <zcube.scad>;

large_radius = 34.8/2;
small_radius = 32/2;

rf = 3;

thickness = 34+2;
sleve_thickness = 10;
outer_radius = large_radius + sleve_thickness;

outset = 16+2;

module block(height = 30) {
	translate([outer_radius, 0, 0]) zcube([outset, thickness, height]);
}

module cutout(height = 30, thickness = 2) {
	translate([0, -thickness/2, 0]) cube([(outer_radius*2+outset+$tolerance)/2, thickness, height]);
}

module sleve(height, hole_offset) {
	render() difference() {
		render() union() {
			cylinder_inner(height, outer_radius, 32*rf);
			block(height);
		}
		
		children();
		
		translate([outer_radius+1, thickness/2+1, hole_offset]) rotate(90, [1, 0, 0]) hole(8, thickness + 2, 0);
		
		cutout(height);
	}
}

module telescope_cutout(height) {
	tube_offset = height / 2;
	
	render() union() {
		cylinder_outer(tube_offset, small_radius, 32*rf);
		translate([0, 0, tube_offset]) cylinder_outer(height-tube_offset, large_radius, 32*rf);
	}
}
