/* [Amount of Detail] */
SIDES_PER_OBJECT = 100; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [Patch Dimensions] */
PATCH_HEIGHT = 3; // .1
PATCH_LENGTH = 145; // .1
END_CYLINDER_RADIUS = 14; // .1

hull() {
  for (
    x = [0:PATCH_LENGTH - (END_CYLINDER_RADIUS * 2):PATCH_LENGTH - (END_CYLINDER_RADIUS * 2)]
  ) {
    translate(v=[x, 0, 0]) {
      cylinder(h=PATCH_HEIGHT, r=END_CYLINDER_RADIUS);
    }
  }
}
