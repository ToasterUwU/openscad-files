$fn = 150;

PEN_WIDTH = 18;
PEN_HOLE_TOLERANCE = 2;
PEN_HOLE_DEPTH = 70;
PEN_HOLE_WALL_THICKNESS = 2;

module pen_hole()
{
    difference()
    {
        cylinder(h = PEN_HOLE_DEPTH + PEN_HOLE_WALL_THICKNESS,
                 r = (PEN_WIDTH / 2) + PEN_HOLE_WALL_THICKNESS + PEN_HOLE_TOLERANCE);
        translate(v = [ 0, 0, PEN_HOLE_WALL_THICKNESS ])
        {
            cylinder(h = PEN_HOLE_DEPTH, r = PEN_WIDTH / 2 + PEN_HOLE_TOLERANCE);
        }
    }
}

render()
{
    pen_hole();
}