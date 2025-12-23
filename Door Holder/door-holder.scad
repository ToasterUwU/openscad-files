/* [Amount of Detail] */
SIDES_PER_OBJECT = 100; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [Door Holder Dimensions] */
LENGTH = 60; // .1
WIDTH = 22; // .1
HEIGHT = 8; // .1

/* [Screw Hole] */
HOLE_DISTANCE = 10; // .1
HOLE_DIAMETER = 4; // .1

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
