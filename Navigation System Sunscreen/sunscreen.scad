INSERTION_LENGTH = 12;
INSERTION_WALL_THICKNESS = 0.8;

WIDTH = 186;
LENGTH = 65;

SIDE_LENGTH = 110;
SIDE_END_WIDTH = 23;

ADD_BEZEL = true;
BEZEL_THICKNESS = 3;
BEZEL_DEPTH = 5;

WALL_THICKNESS = 3;

module prism(l, w, h)
{
    polyhedron(points = [ [ 0, 0, 0 ], [ l, 0, 0 ], [ l, w, 0 ], [ 0, w, 0 ], [ 0, w, h ], [ l, w, h ] ],
               faces = [ [ 0, 1, 2, 3 ], [ 5, 4, 3, 2 ], [ 0, 4, 5, 1 ], [ 0, 3, 4 ], [ 5, 2, 1 ] ]);
}

module sideFlap(isLeftSide = false, isRightSide = false)
{
    difference()
    {
        union()
        {
            cube(size = [ WALL_THICKNESS, SIDE_LENGTH, LENGTH - INSERTION_LENGTH ]);
            if (ADD_BEZEL)
            {
                if (isLeftSide)
                {
                    translate(v = [ -BEZEL_THICKNESS, 0, 0 ])
                    {
                        cube(size = [ BEZEL_THICKNESS, SIDE_LENGTH, BEZEL_DEPTH ]);
                    }
                }
                if (isRightSide)
                {
                    translate(v = [ WALL_THICKNESS, 0, 0 ])
                    {
                        cube(size = [ BEZEL_THICKNESS, SIDE_LENGTH, BEZEL_DEPTH ]);
                    }
                }
            }
            if (isLeftSide)
            {
                translate(v = [
                    WALL_THICKNESS - INSERTION_WALL_THICKNESS, WALL_THICKNESS - INSERTION_WALL_THICKNESS, LENGTH -
                    INSERTION_LENGTH
                ])
                {
                    cube(size = [
                        INSERTION_WALL_THICKNESS, SIDE_LENGTH - WALL_THICKNESS + INSERTION_WALL_THICKNESS,
                        INSERTION_LENGTH
                    ]);
                }
            }
            if (isRightSide)
            {
                translate(v = [ 0, WALL_THICKNESS - INSERTION_WALL_THICKNESS, LENGTH - INSERTION_LENGTH ])
                {
                    cube(size = [
                        INSERTION_WALL_THICKNESS, SIDE_LENGTH - WALL_THICKNESS + INSERTION_WALL_THICKNESS,
                        INSERTION_LENGTH
                    ]);
                }
            }
        }
        translate(v = [ -WALL_THICKNESS, SIDE_LENGTH - LENGTH, 0 ])
        {
            prism(l = BEZEL_DEPTH + BEZEL_DEPTH, w = LENGTH, h = LENGTH);
        }
    }
}

render()
{
    // Long Side
    union()
    {
        cube(size = [ WIDTH, WALL_THICKNESS, LENGTH - INSERTION_LENGTH ]);
        if (ADD_BEZEL)
        {
            translate(v = [ -BEZEL_THICKNESS - WALL_THICKNESS, -BEZEL_THICKNESS, 0 ])
            {
                cube(size = [ WIDTH + (WALL_THICKNESS + BEZEL_THICKNESS) * 2, BEZEL_THICKNESS, BEZEL_DEPTH ]);
            }
        }
        translate(v = [ 0, WALL_THICKNESS - INSERTION_WALL_THICKNESS, LENGTH - INSERTION_LENGTH ])
        {
            cube(size = [ WIDTH, INSERTION_WALL_THICKNESS, INSERTION_LENGTH ]);
        }
    }

    // Left Side
    translate(v = [ -WALL_THICKNESS, 0, 0 ])
    {
        sideFlap(isLeftSide = true);
    }

    // Right Side
    translate(v = [ WIDTH, 0, 0 ])
    {
        sideFlap(isRightSide = true);
    }
}