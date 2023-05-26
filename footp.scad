$fn=120;

module rounded_cylinder(height, r) {
    hull() {
        translate([0, 0, r])
            sphere(r);
        translate([0, 0, height-r])
            sphere(r);
    }
}

module rib(r, width, height) {
    hull() {
        translate([r, r, 0])
            rounded_cylinder(height, r);
        translate([width-r, width-r, 0])
            rounded_cylinder(height, r);
    }

     hull() {
        translate([r, width-r, 0])
            rounded_cylinder(height, r);
        translate([width-r, r, 0])
            rounded_cylinder(height, r);
    }
}

module base(r, width, height) {
    hull() {
        translate([r, r, 0])
            rounded_cylinder(height, r);
        translate([width-r, r, 0])
            rounded_cylinder(height, r);
    }

    hull() {
        translate([r, width-r, 0])
            rounded_cylinder(height, r);
        translate([width-r, width-r, 0])
            rounded_cylinder(height, r);
    }

    hull() {
        translate([r, r, 0])
            rounded_cylinder(height, r);
        translate([r, width-r, 0])
            rounded_cylinder(height, r);
    }

    hull() {
        translate([width-r, r, 0])
            rounded_cylinder(height, r);
        translate([width-r, width-r, 0])
            rounded_cylinder(height, r);
    }

    rib(r, width, height);
}

module footp() {
    difference() {
        union() {
            /* Base */
            base(2, 50, 8);

            rib(2, 15, 18);
            translate([15+20, 0, 0])
                rib(2, 15, 18);
            translate([0, 15+20, 0])
                rib(2, 15, 18);
            translate([15+20, 15+20, 0])
                rib(2, 15, 18);
            translate([50/2-15/2, 50/2-15/2, 0])
                rib(2, 15, 18);

            translate([50/2, 50/2, 0]) {
                rotate([0, 0, 45]) {
                    hull() {
                        translate([-23/2, -28/2, 0])
                            cylinder(8, 6, 6);
                        translate([-23/2, 28/2, 0])
                            cylinder(8, 6, 6);
                    }
                    hull() {
                        translate([23/2, -28/2, 0])
                            cylinder(8, 6, 6);
                        translate([23/2, 28/2, 0])
                            cylinder(8, 6, 6);
                    }
                }
            }
        }

        translate([50/2, 50/2, 0]) {
            rotate([0, 0, 45]) {
                translate([-23/2, -28/2, 0]) {
                    cylinder(8, 4.5/2, 4.5/2);
                    translate([0, 0, 8-3.5])
                        rotate([0, 0, 30])
                            cylinder(8, 8.2/2, 8.2/2, $fn=6);
                }
                translate([-23/2, 28/2, 0]) {
                    cylinder(8, 4.5/2, 4.5/2);
                    translate([0, 0, 8-3.5])
                        rotate([0, 0, 30])
                            cylinder(8, 8.2/2, 8.2/2, $fn=6);
                }
                translate([23/2, -28/2, 0]) {
                    cylinder(8, 4.5/2, 4.5/2);
                    translate([0, 0, 8-3.5])
                        rotate([0, 0, 30])
                            cylinder(8, 8.2/2, 8.2/2, $fn=6);
                }
                translate([23/2, 28/2, 0]) {
                    cylinder(8, 4.5/2, 4.5/2);
                    translate([0, 0, 8-3.5])
                        rotate([0, 0, 30])
                            cylinder(8, 8.2/2, 8.2/2, $fn=6);
                }
            }
        }
    }
}

footp();
