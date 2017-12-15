/*
# License

## Attribution-ShareAlike 4.0 International

*  License: CC BY-SA 4.0
*  Human Readable License: https://creativecommons.org/licenses/by-sa/4.0/
*  Complete Legal Terms: https://creativecommons.org/licenses/by-sa/4.0/legalcode

# Authors
*  Štěpán Škorpil (stopka@skorpils.cz)

*/

include <logo.lines.scad>;

module logo(h=10){
  difference(){
    e=0.01;
    poly_outline(h);
    translate([0,0,-e/2])
    union(){
      poly_rightEye(h+e);
      poly_leftEye(h+e);
      poly_mouth(h+e);
    }
  }
}

logo();