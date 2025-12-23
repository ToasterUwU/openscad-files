/* [Amount of Detail] */
SIDES_PER_OBJECT = 250; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [Stem Dimensions] */
STEM_HEIGHT = 29; // .1
STEM_RADIUS = 12; // .1

/* [Cap Dimensions] */
CAP_HEIGHT = 13; // .1
CAP_RADIUS = 25; // .1

/* [Hole Dimensions] */
HOLE_SIDE_LENGTH = 8.2; // .1

render() {
  translate(v=[0, 0, STEM_HEIGHT + CAP_HEIGHT]) {
    // Move up from below the 0 line
    rotate([180, 0, 0]) {
      // rotate on its head for easy printing
      difference() {
        difference() {
          union() {
            cylinder(h=STEM_HEIGHT, r=STEM_RADIUS); // Stem
            translate(v=[0, 0, STEM_HEIGHT]) {
              // above Stem
              cylinder(h=CAP_HEIGHT, r=CAP_RADIUS); // Cap
            }
          }
          translate(v=[0, 0, STEM_HEIGHT / 2]) {
            cube(size=[HOLE_SIDE_LENGTH, HOLE_SIDE_LENGTH, STEM_HEIGHT], center=true); // this makes the 4 sided hole
          }
        }
        translate(v=[CAP_RADIUS, 0, STEM_HEIGHT + (CAP_HEIGHT / 2)]) {
          // Move cutoff cube up to where it needs to be
          cube(size=[CAP_RADIUS, CAP_RADIUS * 2, CAP_HEIGHT], center=true); // This cuts the cap off at one side
        }
      }
    }
  }
}
