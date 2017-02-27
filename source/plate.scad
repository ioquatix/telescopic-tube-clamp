
use <zcube.scad>;
include <parts.scad>;

module base_cutout(height) {
	cylinder_outer(height, small_radius, 32*rf);
}

module support(size=80, height=30) {
	render() hull() {
		translate([size/2-20/2, 0, 0]) #zcube([20, 20, 10]);
		translate([size/2-18, 0, height]) #zcube([5, 20, 10]);
	}
}

module plate(height = 50, size = 80, thickness=10) {
	difference() {
		union() {
			sleve(height, height - 8);
			zcube([size, size, thickness]);
		}
		
		for (r = [0:90:360]) {
			rotate([0, 0, r]) {
				translate([size/2-10, size/2-10, 0]) countersunk_hole(4, thickness, 0);
			}
		}
		
		cylinder_outer(height, small_radius, 32*rf);
	}
	
	rotate([0, 0, 90]) support(size);
	rotate([0, 0, 180]) support(size);
	rotate([0, 0, 270]) support(size);
}

plate();
