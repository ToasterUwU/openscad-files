NUMBER_OF_COMPARTMENTS = 1;
DOUBLE_COMPARTMENTS = true;
USE_SUPPORT_WALLS_FOR_DOUBLE_COMPARTMENTS = true;
USE_TRIANGLE_SLANTS_FOR_DOUBLE_COMPARTMENTS = true;

WALL_THICKNESS = 5;
COMPARTMENT_WIDTH = 130;
COMPARTMENT_DEPTH = 100;
COMPARTMENT_HEIGHT = 150;

for (i = [0:1:NUMBER_OF_COMPARTMENTS - 1]) {
  // Move everything over next to each other for each compartment block
  translate(v = [ (i * COMPARTMENT_WIDTH) - (i * WALL_THICKNESS), 0, 0 ]) {
    compartment();

    if (DOUBLE_COMPARTMENTS) {
      // Move everything back while avoiding double walls
      translate(v = [ 0, COMPARTMENT_DEPTH - WALL_THICKNESS, 0 ]) {
        // Make the upper compartment, reuse part of the first ones wall for
        // lower height overall
        translate(v = [ 0, 0, 0.75 * COMPARTMENT_HEIGHT ]) compartment();

        // Support Walls below the top compartment
        if (USE_SUPPORT_WALLS_FOR_DOUBLE_COMPARTMENTS) {
          for (x = [0.25:0.50:0.75]) {
            translate(v = [ x * COMPARTMENT_WIDTH, 0, 0 ]) {
              cube(size = [
                WALL_THICKNESS, COMPARTMENT_DEPTH, 0.75 * COMPARTMENT_HEIGHT
              ]);
            }
          }
        }

        // Slants to prevent overhang issues while printing
        if (USE_TRIANGLE_SLANTS_FOR_DOUBLE_COMPARTMENTS) {
          hull() {
            cube(size = [ COMPARTMENT_WIDTH, WALL_THICKNESS, WALL_THICKNESS ]);

            translate(v = [ 0, 0, 0.75 * COMPARTMENT_HEIGHT ]) {
              cube(size =
                       [ COMPARTMENT_WIDTH, WALL_THICKNESS, WALL_THICKNESS ]);
            }

            translate(v = [
              0, COMPARTMENT_DEPTH - WALL_THICKNESS, 0.75 * COMPARTMENT_HEIGHT
            ]) {
              cube(size =
                       [ COMPARTMENT_WIDTH, WALL_THICKNESS, WALL_THICKNESS ]);
            }
          }
        }
      }
    }
  }
}

module compartment() {
  difference() {
    difference() {
      // Main Block
      cube(size = [ COMPARTMENT_WIDTH, COMPARTMENT_DEPTH, COMPARTMENT_HEIGHT ]);

      translate(v = [ WALL_THICKNESS, WALL_THICKNESS, WALL_THICKNESS ]) {
        cube( // Leave floor, side wall, and back front wall in peace
            size = [
              COMPARTMENT_WIDTH -
                  (2 * WALL_THICKNESS), // 1 * for overhang from moving, 1 * for
                                        // leaving the opposite wall intact
              COMPARTMENT_DEPTH - (2 * WALL_THICKNESS), // same here
              COMPARTMENT_HEIGHT -
                  WALL_THICKNESS // Only 1 * so that there is no ceiling
            ]);
      }
    }

    translate(v = [
      WALL_THICKNESS + (0.1 * COMPARTMENT_WIDTH), 0, (0.25 * COMPARTMENT_HEIGHT)
    ]) {
      cube( // Cutout of the fron wall for easy reading and access to packs
          size = [
            COMPARTMENT_WIDTH -
                ((2 * WALL_THICKNESS) +
                 (0.2 *
                  COMPARTMENT_WIDTH)), // Leave 10% of the width left on each
                                       // side, so the packs dont fall out
            WALL_THICKNESS, COMPARTMENT_HEIGHT - (0.25 * COMPARTMENT_HEIGHT)
          ]);
    }
  }
}