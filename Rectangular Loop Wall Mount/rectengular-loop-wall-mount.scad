/* [Amount of Detail] */
SIDES_PER_OBJECT = 100; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [General Mount Dimensions] */
MOUNT_DEPTH = 20; // .1
MOUNT_WALL_THICKNESS = 4; // .1

/* [Rectangular Loop Dimensions] */
LOOP_WIDTH = 18.8; // .1
LOOP_HEIGHT = 23; // .1
LOOP_THICKNESS = 4; // .1

/* [Mounting Hole Dimensions] */
MOUNT_HOLE_DIAMETER = 3.8; // .1
MOUNT_HOLE_EAR_LENGTH = 15; // .1

/* [Derived Dimensions] */
MOUNT_WIDTH = 2 * MOUNT_HOLE_EAR_LENGTH + 2 * LOOP_THICKNESS + LOOP_WIDTH;
MOUNT_TOTAL_HEIGHT = LOOP_HEIGHT + LOOP_THICKNESS;

render() {
  difference() {
    cube([MOUNT_WIDTH, MOUNT_DEPTH, MOUNT_TOTAL_HEIGHT]); // Raw Block to cut from
    translate([0, 0, MOUNT_WALL_THICKNESS]) {
      // Left Screw Ear
      cube([MOUNT_HOLE_EAR_LENGTH, MOUNT_DEPTH, LOOP_HEIGHT + LOOP_THICKNESS]);
    }
    translate([MOUNT_HOLE_EAR_LENGTH / 2, MOUNT_DEPTH / 2, 0]) {
      // Left Screw Hole
      cylinder(h=MOUNT_WALL_THICKNESS, r=MOUNT_HOLE_DIAMETER/2);
    }
    translate([MOUNT_HOLE_EAR_LENGTH + LOOP_THICKNESS, 0, 0]) {
      // Loop Hole
      cube([LOOP_WIDTH, MOUNT_DEPTH, LOOP_HEIGHT]);
    }
    translate([MOUNT_WIDTH - MOUNT_HOLE_EAR_LENGTH, 0, MOUNT_WALL_THICKNESS]) {
      // Right Screw Ear
      cube([MOUNT_HOLE_EAR_LENGTH, MOUNT_DEPTH, LOOP_HEIGHT + LOOP_THICKNESS]);
    }
    translate([MOUNT_WIDTH-(MOUNT_HOLE_EAR_LENGTH / 2), MOUNT_DEPTH / 2, 0]) {
      // Right Screw Hole
      cylinder(h=MOUNT_WALL_THICKNESS, r=MOUNT_HOLE_DIAMETER/2);
    }
  }
}
