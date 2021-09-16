/*
  basic_states_1, by 220  (2021@Kant)
  Code distributed under MIT license
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Basic states demonstration
  
  Features and methods:
  - Basic states
  - RGB and room descriptions catalogs
 */

String [] descriptions_catalog = {"You can't see anything, the room is shrouded by darkness...", "It's a big room, with an awful landscape painting on the wall"};
color  [] colors_catalog = {0, #A08427};

int light_state = 0;

void setup () {
  size (640, 200);
  textAlign (CENTER, CENTER);
  textSize (20);
}
void draw () {
  
  background (colors_catalog [light_state]);
  text (descriptions_catalog [light_state], width/2, height/2);
}
void keyTyped () {
  light_state = light_state==0?1:0;
  println (colors_catalog [light_state]);
}
