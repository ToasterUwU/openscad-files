/* [Amount of Detail] */
SIDES_PER_OBJECT = 100; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [General] */
SIDE_LENGTH = 55; // .1
ROUND_EDGE_RADIUS = 3; // .1
WALL_THICKNESS = 3; // .1

/* [Inner Edge Rounding] */
ROUND_INNER_EDGES = false;
ROUND_INNER_EDGE_RADIUS = 1; // .1

/* [Angled Side Cutoffs] */
ANGLED_SIDE_CUTOFFS = true;

/* [Screw Holes] */
SCREW_HOLES = false; // TODO implement screw holes

include <../.lib/BOSL2/std.scad>

difference() {
  cuboid([SIDE_LENGTH, SIDE_LENGTH, SIDE_LENGTH], rounding=ROUND_EDGE_RADIUS); // Initial Cube to cut from
  // Move so the cut leaves the walls in tact
  translate(v=[WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS]) {
    if (ROUND_INNER_EDGES) {
      cuboid([SIDE_LENGTH, SIDE_LENGTH, SIDE_LENGTH], rounding=ROUND_INNER_EDGE_RADIUS); // Cube to cut from original, but with rounded corners
    } else {
      cube([SIDE_LENGTH, SIDE_LENGTH, SIDE_LENGTH], center=true); // Cube to cut from original
    }
  }
  if (ANGLED_SIDE_CUTOFFS) {
    // Left
    rotate([-45, 0, 90]) translate([-(SIDE_LENGTH / 2 - WALL_THICKNESS / 2), -(SIDE_LENGTH / 2), 0]) {
        cuboid([WALL_THICKNESS, SIDE_LENGTH / 2, SIDE_LENGTH - WALL_THICKNESS]);
      }
    // Right
    rotate([45, 0, 0]) translate([-(SIDE_LENGTH / 2 - WALL_THICKNESS / 2), SIDE_LENGTH / 2, 0]) {
        cuboid([WALL_THICKNESS, SIDE_LENGTH / 2, SIDE_LENGTH - WALL_THICKNESS]);
      }
    // Bottom
    rotate([0, 90, -45]) translate([SIDE_LENGTH / 2 - WALL_THICKNESS / 2, SIDE_LENGTH / 2, 0]) {
        cuboid([WALL_THICKNESS, SIDE_LENGTH / 2, SIDE_LENGTH - WALL_THICKNESS]);
      }
  }
}
