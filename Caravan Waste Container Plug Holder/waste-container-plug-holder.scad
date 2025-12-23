/* [Amount of Detail] */
SIDES_PER_OBJECT = 100; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [Holder Cylinder] */
HOLDER_DIAMETER = 24.6; // .1
// The Stability Ring Height will not be added to this, so this is the total height
HOLDER_HEIGHT = 26; // .1
HOLDER_WALL_THICKNESS = 4; // .1

/* [Stability Ring] */
STABILITY_RING = true;
STABILITY_RING_HEIGHT = 5; // .1
// Only the added diameter around the Holder Diameter
STABILITY_RING_DIAMETER = 10; // .1

/* [Screw Hole] */
SCREW_HOLE = true;
SCREW_HOLE_DIAMETER = 4; // .1

difference() {
  // Main Holder Body, with optional stability ring
  union() {
    if (STABILITY_RING) {
      cylinder(h=STABILITY_RING_HEIGHT, d=HOLDER_DIAMETER + STABILITY_RING_DIAMETER, center=false);
    }
    cylinder(h=HOLDER_HEIGHT, d=HOLDER_DIAMETER, center=false);
  }
  // Hollow out the inside
  translate(v=[0, 0, HOLDER_WALL_THICKNESS]) {
    cylinder(h=HOLDER_HEIGHT - HOLDER_WALL_THICKNESS, d=HOLDER_DIAMETER - 2 * HOLDER_WALL_THICKNESS, center=false);
  }

  if (SCREW_HOLE) {
    cylinder(h=HOLDER_WALL_THICKNESS, d=SCREW_HOLE_DIAMETER);
  }
}
