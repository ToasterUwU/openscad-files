$fn = 100;

hull() {
  for (x = [0:145 - 28:145 - 28]) {
    translate(v = [ x, 0, 0 ]) { cylinder(h = 3, r = 14); }
  }
}