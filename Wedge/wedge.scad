/* [Wedge Dimensions] */
WEDGE_LENGTH = 130; // .1
WEDGE_WIDTH = 22.5; // .1
// Start height
WEDGE_COMMON_HEIGHT = 16; // .1
// Amount of height added over the length of the wedge
WEDGE_SLOPE_END_HEIGHT_ADDITION = 4; // .1

/* [Grip] */
GRIP = true;
GRIP_THICKNESS = 8; // .1
GRIP_LENTGTH = 30; // .1

union() {
  hull() {
    cube([WEDGE_LENGTH, WEDGE_WIDTH, WEDGE_COMMON_HEIGHT]);
    translate([WEDGE_LENGTH, 0, WEDGE_COMMON_HEIGHT + WEDGE_SLOPE_END_HEIGHT_ADDITION]) {
      cube([0.00000000001, WEDGE_WIDTH, 0.00000000001]);
    }
  }
  if (GRIP) {
    translate([WEDGE_LENGTH, 0, 0]) {
      cube([GRIP_THICKNESS, WEDGE_WIDTH, WEDGE_COMMON_HEIGHT + WEDGE_SLOPE_END_HEIGHT_ADDITION + GRIP_LENTGTH]);
    }
  }
}
