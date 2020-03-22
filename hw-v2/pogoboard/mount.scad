// Note: For best results, slice with:
// Fill pattern - Hilbert curve
// Avoid crossing perimeters
// Seam position - Random
// 3mm exterior brim

$fn=100;

module holes(r=1.6, h=10) {
     translate([9.75, 27, 0]) cylinder(h, r, r);
     translate([9.25, 96, 0]) cylinder(h, r, r);
     translate([89.25, 11.25, 0]) cylinder(h, r, r);
}

/*difference() {
  cube([100, 100, 1.6]);
  holes();
  }*/

module pogoboard(h=1.6) {
     translate([38.990-3.700, 46.610-34.260, 0])
	  cube([37.5, 60+1, h]); // +1 for manually-determined offset
}

//translate([0, 0, -2.5-1.6]) pogoboard();

difference() {
     translate([0, 0, -5]) union() {
	  hull() {
	       holes(3, 5);
	       translate([75, 73, 0]) cylinder(5, 3, 3);
	  }
	  holes(3, 6);
     }
     translate([39, -10, -5]) union() {
	  difference() {
	       cube([33.75, 50, 10]);

	       // The difference is to cut down on warping
	       translate([-20, -45, 0]) rotate([0, 0, -10]) cube([80, 80, 10]);

	  }
	  translate([0, 40, 0]) cube([25, 28, 10]);
	  translate([0, 0, 1]) cube([33.75, 60, 10]);
     }
     translate([0, 0, -5]) holes(2);

     // Bump in Y to make holes line up,
     // Widen to make fit easier.
     translate([0, -0.5, -2.5-1.6]) minkowski() {
	  pogoboard(5);
	  cube([0.25, 0.5, 0.1], center=true);
     }

     // Make a notch to fit the board itself in
     translate([0, -0.5, -2.5-1.6]) minkowski() {
	  pogoboard(1.8);
	  cube([1.5, 0.5, 0.1], center=true);
     }

     // Cut the corner off to fit the buttons
     translate([70, 0, -4]) cube([10, 35, 10]);

     translate([37, 72, -4.1]) cylinder(5, 3, 3);
     translate([72, 72, -4.1]) cylinder(5, 3, 3);

     translate([0, 0, -5]) hull() {
	  translate([15, 32, 0]) cylinder(5, 3, 3);
	  translate([15, 90, 0]) cylinder(5, 3, 3);
	  translate([28, 87, 0]) cylinder(5, 3, 3);
	  translate([28, 30, 0]) cylinder(5, 3, 3);
     }
}
