/*
  parametric_model_1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Solar System model simulaton
  
  Features and methods:
  - Parametric models implementation around star model
 */

Star star;
PGraphics starfield;

PFont font_screen;

boolean draw_label = false;
String label, s;

void setup () {
  size (1280, 720);
  
  colorMode (HSB, 255, 100, 100);
  ellipseMode (RADIUS);
  font_screen = loadFont ("LilliputSteps-7.vlw");
  textFont (font_screen, 7);
  
  randomSystem2 ();
}
void draw () {
  background (0, 0, 0);
  image (starfield, 0, 0);
  
  // step and draw star
  star.step ();
  star.draw (draw_label);
  
  textAlign (RIGHT, TOP);
  fill (0, 100, 75);
  label = "Planets:"+str (star.planets.size ())+"\n";
  text (label, width-40, 20);
  for (int i=0; i<star.planets.size (); i++) {
    Planet p = (Planet)star.planets.get (i);
    label = p.id+"\n";

    label+= "O/R: "+str (p.orbital_radius)+"\n";
    label+= "O/S: "+str (p.orbital_speed)+"\n";
    label+= "Cx: "+p.composition+"\n";
    label+= "\n";
    
    fill (0, 100, 75);
    stroke (80, 100, 100, 32);
    line (width-60, 20+(i*40), width-80, 20+(i*40));
    
    line (width-80, 20+(i*40), width-200, p.o_y);
    line (width-200, p.o_y, p.o_x, p.o_y);
    text (label, width-40, 40+(i*40));
  }
  
  label = star.id+"\n";
  label+= "Mag: "+star.magnitude+"\n";
  
  textAlign (LEFT, TOP);
  text (label, 20, 20);
}
void keyTyped () {
  switch (key) {
    case '1':
      randomSystem1 ();
      break;
    case '2':
      randomSystem2 ();
      break;
    case 'l':
    case 'L':
      draw_label = !draw_label;
      break;
  }
}
