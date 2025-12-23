/* [Amount of Detail] */
SIDES_PER_OBJECT = 150; // [5:1000]

/* [Hidden] */
$fn = SIDES_PER_OBJECT;

/* [Cover Dimensions] */
RADIUS = 35; // .1
HEIGHT = 43; // .1
WALL_STRENGTH = 2; // .1

/* [Ear Dimensions] */
EAR_WIDTH = 10; // .1
EAR_HEIGHT = 4; // .1

render() {
  difference() {
    union() {
      cylinder(h=HEIGHT + WALL_STRENGTH, r=RADIUS + WALL_STRENGTH);
      translate(v=[0, 0, EAR_HEIGHT / 2]) {
        cube(size=[(RADIUS + WALL_STRENGTH + EAR_WIDTH) * 2, EAR_WIDTH, EAR_HEIGHT], center=true);
      }
    }
    cylinder(h=HEIGHT, r=RADIUS);
  }
}
