  outerD = 24;
  extruderD = 16;

  sideLong = 47;
  sideShort = 42;
  width=40;



module hotend_mounting(d) { // The Printrbot Simple's mounting plate,
			   // minus mounting slots.


  difference() {

    // The overall baseplate
    union() {
      cube([10,sideLong,d]);
      cube([width, sideShort,d]);
      translate([outerD/2,sideLong,0]) cylinder(r=outerD/2, h=d, $fn=20);
      difference() {
	linear_extrude(height=d) polygon(points=[ [outerD/2, sideLong+outerD/2], [width,sideShort], [0,sideShort]]);
#	translate([outerD/2, sideLong, 0]) cylinder(r=extruderD/2, h=d);
      }
    }


    // Extruder cutout
    translate([outerD/2, sideLong, 0]) cylinder(r=extruderD/2, h=d);

    // mounting holes
    translate([2.15, 32,0]) cube([5.9,5.75,6]);
    translate([28.3, 32,0]) cube([5.9,5.75,6]);

    // screw for mounting
    translate([18,35,0]) cylinder(r=3/2,h=6, $fn=20);
    

    // I have no idea what this is
    translate([12,18,0])
    union() {
      translate([0,2,0]) cube([12,4,6]);
      translate([2,0,0]) cube([8,8,6]);
      for (i = [0,1]) {
	for (j = [0,1]) {
	  translate([2+i*8, 2+j*4,0]) cylinder(r=2,h=6);
	}
      }
    }
  }
}


module hotend_negative() {
  union() {
    translate([0, 0, -4]) cylinder(r=2, h=15, $fn=40);	// socket for the Ubis hot end
    translate([0, 0, -4]) cylinder(r=8.15, h=12, $fn=40);	// socket for the Ubis hot end
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
	cylinder(r=12, h=6, $fn=20);
	translate([0, 0, 6]) cylinder(r=8.5, h=8, $fn=20);
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

difference() {
  union() {
    hotend_mounting(6);
    translate([outerD/2,sideLong,0]) hotend_with_feed();
  }

  translate([outerD/2,sideLong,0]) 
    rotate([0,0,90])
    translate([0,0,3])
    hotend_negative();

  // give a slot for the nut to hold the thing down
  // screw for mounting
  translate([18,35,6]) cylinder(r=3,h=6, $fn=20);

}
