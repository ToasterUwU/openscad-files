$fn = 100;

LENGTH = 60;
WIDTH = 22;
HEIGHT = 8;

HOLE_DISTANCE = 10;
HOLE_DIAMETER = 4;

include <../.lib/BOSL2/std.scad>

difference() {
  cuboid(size=[LENGTH, WIDTH, HEIGHT], rounding=HEIGHT / 2);
  // Hole for screw
  translate([LENGTH / 2 - HOLE_DISTANCE, 0, 0]) {
    translate([0, 0, HEIGHT / 2]) {
      cylinder(HOLE_DIAMETER * 2.5, 0, HOLE_DIAMETER * 1.8, center=true);
    }
    cylinder(h=HEIGHT + 1, d=HOLE_DIAMETER, center=true);
  }
}
