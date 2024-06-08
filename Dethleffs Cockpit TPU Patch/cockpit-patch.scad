$fn = 100;
PATCH_HEIGHT = 3;
PATCH_LENGTH = 145;
END_CYLINDER_RADIUS = 14;

hull() {
  for (x = [0:PATCH_LENGTH - (END_CYLINDER_RADIUS * 2):PATCH_LENGTH -
              (END_CYLINDER_RADIUS * 2)]) {
    translate(v = [ x, 0, 0 ]) {
      cylinder(h = PATCH_HEIGHT, r = END_CYLINDER_RADIUS);
    }
  }
}