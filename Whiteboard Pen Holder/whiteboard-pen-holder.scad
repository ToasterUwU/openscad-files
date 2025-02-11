$fn = 150;

PEN_WIDTH = 17;
PEN_HOLE_TOLERANCE = 1.00;
PEN_HOLE_DEPTH = 70;
PEN_HOLE_BACKWALL_THICKNESS = 5;
PEN_HOLE_SPACER_WIDTH = 13;

PEN_HOLE_ROWS = 3;
PEN_HOLE_COLUMS = 3;

TISSUE_BOX_HEIGHT = 93;
TISSUE_BOX_WIDTH = 40;
TISSUE_BOX_WALL_THICKNESS = 2;

function PEN_HOLE_WIDTH_TOTAL() = PEN_WIDTH + PEN_HOLE_TOLERANCE;

render() {
  difference() {
    cube(size = [
      (PEN_HOLE_WIDTH_TOTAL() * PEN_HOLE_ROWS) + (PEN_HOLE_SPACER_WIDTH * PEN_HOLE_ROWS),
      PEN_HOLE_DEPTH + PEN_HOLE_BACKWALL_THICKNESS,
      (PEN_HOLE_WIDTH_TOTAL() * PEN_HOLE_COLUMS) + (PEN_HOLE_SPACER_WIDTH * PEN_HOLE_COLUMS)
    ]);

    // Cylinders in a Grid to cut out holes from the Cube
    translate(v = [
      (PEN_HOLE_WIDTH_TOTAL() / 2) + (PEN_HOLE_SPACER_WIDTH / 2),  // Move over by half the hole width to make it flush with the edges of the cube, and than half a spacer to make it usuable
      PEN_HOLE_DEPTH,                                              // Push the Cylinders back into the Cube
      (PEN_HOLE_WIDTH_TOTAL() / 2) + (PEN_HOLE_SPACER_WIDTH / 2)   // Same as the first of the 3
    ]) {
      rotate(a = 90, v = [ 1, 0, 0 ]) {           // Flop the Cylinders over
        for (xi = [0:1:PEN_HOLE_ROWS - 1]) {      // Make 3 rows
          for (yi = [0:1:PEN_HOLE_COLUMS - 1]) {  // Make 3 colums
            // Move each new cylinder cut over and up by the right amount to form the grid
            translate(v = [
              xi * (PEN_HOLE_SPACER_WIDTH + PEN_HOLE_WIDTH_TOTAL()),
              yi * (PEN_HOLE_SPACER_WIDTH + PEN_HOLE_WIDTH_TOTAL()),
              0
            ]) {
              cylinder(h = PEN_HOLE_DEPTH, r = (PEN_WIDTH + PEN_HOLE_TOLERANCE) / 2);  // Make the Cylinder used for cutting
            }
          }
        }
      }
    }
  }

  translate(v = [ (PEN_HOLE_WIDTH_TOTAL() * PEN_HOLE_ROWS) + (PEN_HOLE_SPACER_WIDTH * PEN_HOLE_ROWS), 0, 0 ]) {
    difference() {
      cube(size = [
        TISSUE_BOX_WIDTH + TISSUE_BOX_WALL_THICKNESS,
        PEN_HOLE_DEPTH + PEN_HOLE_BACKWALL_THICKNESS,
        TISSUE_BOX_HEIGHT
      ]);

      translate(v = [
        0,
        TISSUE_BOX_WALL_THICKNESS,
        TISSUE_BOX_WALL_THICKNESS
      ]) {
        cube(size = [
          TISSUE_BOX_WIDTH,
          PEN_HOLE_DEPTH + PEN_HOLE_BACKWALL_THICKNESS - (TISSUE_BOX_WALL_THICKNESS * 2),
          TISSUE_BOX_HEIGHT
        ]);
      }
    }
  }
}
