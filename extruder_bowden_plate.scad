difference() {
	union(){
		cube([70, 27, 6], center=true);	// base plate
		hull() {	
			cube([27, 27, 6], center=true);	// bump for the tube fitting
			translate([0, 0, 6]) cylinder(r=6.5, h=7);
		}
	}

	translate([0, 0, 3]) cylinder(r1=1, r2=2.1, h=3, $fn=30);		// hole for the M5 push fitting
	translate([0, 0, 6]) cylinder(r=2.1, h=30, $fn=30);		// hole for the M5 push fitting
	translate([0, 0, -3]) cylinder(r1=3, r2=1, h=4.7, $fn=30);		// funnel for filament
	translate([25, 0, -4]) cylinder(r=3, h=10, $fn=10);	// mounting hole
	translate([-25, 0, -4]) cylinder(r=3, h=10, $fn=10);	// mounting hole

}

