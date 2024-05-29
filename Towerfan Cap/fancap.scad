$fn = 250;

CUTOUT_RADIUS = 50;
INNER_WALL_RADIUS = 42;
WALL_THICKNESS = 5;
COVER_LENGTH = 70;
COVER_ANGLE = 90;
RIM_LENGTH = 10;

difference() {
  difference() {
    difference() {
      difference() {
        cylinder(h = COVER_LENGTH + WALL_THICKNESS, r = INNER_WALL_RADIUS + WALL_THICKNESS); // Base Cylinder that i cut everything out of

        translate(v = [ 0, 0, WALL_THICKNESS ]) {
          cylinder(h = COVER_LENGTH, r = INNER_WALL_RADIUS); // Inner Cylinder i cut out to leave only the walls and ceiling
        }
      }

      cylinder(h = WALL_THICKNESS, r = CUTOUT_RADIUS); // Cutout Hole for accessing buttons
    }

    // Big Cuboid that cuts half of the walls away
    translate(v = [ // Leave the Rim and the Ceiling in tact
      -INNER_WALL_RADIUS - WALL_THICKNESS,
      -INNER_WALL_RADIUS - WALL_THICKNESS,
      RIM_LENGTH + WALL_THICKNESS
    ]) {
      cube(size = [
        INNER_WALL_RADIUS + WALL_THICKNESS,
        INNER_WALL_RADIUS * 2 + WALL_THICKNESS * 2,
        (COVER_LENGTH + WALL_THICKNESS)
      ], center = false);
    }
  }

  // Smaller Cube that cuts one of two remaining quarters of the wall away, so that only 90° are left
  translate(v = [ // Leave the Rim and the Ceiling in tact
    0,
    -INNER_WALL_RADIUS - WALL_THICKNESS,
    RIM_LENGTH + WALL_THICKNESS
  ]) {
    cube(size = [
      INNER_WALL_RADIUS + WALL_THICKNESS,
      INNER_WALL_RADIUS + WALL_THICKNESS,
      (COVER_LENGTH + WALL_THICKNESS)
    ], center = false);
  }
}