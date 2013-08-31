module hotend_negative() {
  union() {
    //    translate([0, 0, -4]) cylinder(r=2, h=15, $fn=40);	// socket for the Ubis hot end

    //    translate([0, 0, -4]) cylinder(r=8.15, h=12, $fn=40);	// socket for the Ubis hot end
    translate([0, 0, 8.3]) cylinder(r=9.6/2, h=30, $fn=30);   // hole for the M5 push fitting
    rotate([90, 0, 0]) translate([7.5, 0, -15]) cylinder(r=1.8, h=40, $fn=10);	// hot end screw
    rotate([90, 0, 0]) translate([-7.5, 0, -15]) cylinder(r=1.8, h=40, $fn=10);	// hot end screw
  }

}


module hotend_with_feed() { // This needs a clear 27x27x6 footprint at the edge to work with.
  cubeside=24;


  rotate([0,0,90])
  translate([0,0,3])
  difference() {
    union(){
      hull() {	
	//	cube([cubeside, cubeside, 6], center=true);	// bump for the tube fitting
	//cylinder(r=12, h=6, $fn=20);
	cube([21,17,6], true);
	translate([0, 0, 6]) cylinder(r=8.75, h=8,$fn=20);
      }
    }

    hotend_negative();
    /*
    translate([0, 0, -4]) cylinder(r=2, h=15, $fn=40);	// socket for the Ubis hot end
    translate([0, 0, -4]) cylinder(r=8.15, h=12, $fn=40);	// socket for the Ubis hot end
    translate([0, 0, 8.3]) cylinder(r=9.6/2, h=30, $fn=30);   // hole for the M5 push fitting
    rotate([90, 0, 0]) translate([7.5, 0, -15]) cylinder(r=1.8, h=40, $fn=10);	// hot end screw
    rotate([90, 0, 0]) translate([-7.5, 0, -15]) cylinder(r=1.8, h=40, $fn=10);	// hot end screw
    */
  }
}


intersection() {
  difference() {
    union() {
      //      cylinder(r=12, h=6);
      hotend_with_feed();
    }
    translate([0,0,-5]) cylinder(r=2, h=40, $fn=40);

  rotate([0,0,90])
  translate([0,0,3])

    hotend_negative();
  }
  cube([17,100,100], true);
}
