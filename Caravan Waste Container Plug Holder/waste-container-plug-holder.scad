$fn = 100;

// Variant 1
// HOLDER_DIAMETER = 24.6;
// HOLDER_HEIGHT = 26;
// HOLDER_WALL_THICKNESS = 4;

// Variant 2
HOLDER_DIAMETER = 32.6;
HOLDER_HEIGHT = 26;
HOLDER_WALL_THICKNESS = 4;

STABILITY_RING = true;
STABILITY_RING_HEIGHT = 5;
// Only the added diameter around the Holder Diameter
STABILITY_RING_DIAMETER = 10;

SCREW_HOLE = true;
SCREW_HOLE_DIAMETER = 4;

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
