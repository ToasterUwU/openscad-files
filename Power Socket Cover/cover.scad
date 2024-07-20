$fn = 150;

RADIUS = 35;
HEIGHT = 43;
WALL_STRENGTH = 2;

EAR_WIDTH = 10;
EAR_HEIGHT = 4;

difference()
{
    union()
    {
        cylinder(h = HEIGHT + WALL_STRENGTH, r = RADIUS + WALL_STRENGTH);
        translate(v = [ 0, 0, EAR_HEIGHT / 2 ])
        {
            cube(size = [ (RADIUS + WALL_STRENGTH + EAR_WIDTH) * 2, EAR_WIDTH, EAR_HEIGHT ], center = true);
        }
    }
    cylinder(h = HEIGHT, r = RADIUS);
}