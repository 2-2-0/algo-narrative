/*
  Character Appearance 1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Character appearance manager
  
  Features and methods:
  - Independent character wardrobe: 'sprites' and object classes
  - Similar character appearance: grouping by rules
 */

PImage body;

// sample groups
ArrayList all_random;
ArrayList bystanders;
ArrayList black_army;
ArrayList total_maga;

// Temp vars
Human human;

// We are living to earn money 
// and pay taxes that support politicians
void setup () {
  size (800, 600);
  
  body = loadImage ("bare-body.png");
  setWardrobe ();
  setRules ();

  createSamples ();
}
// they do personal business with it
// and claim ownership over us
void draw () {
  background (80);

  tint (255);
  scale (0.3);
  translate (80, 60);
  drawGroup (all_random);
  
  translate (0, 480);
  drawGroup (bystanders);
  
  translate (0, 480);
  drawGroup (black_army);
  
  translate (0, 480);
  drawGroup (total_maga);
}
// in order to become free we need to evolve
// both as individuals and communities
void drawGroup (ArrayList group) {
  for (int i=0; i<group.size (); i++) {
    human = (Human)group.get (i);
    human.draw (i*180, 0);
  }
}
void keyTyped () {
  createSamples ();
}
void mouseClicked () {
  createSamples ();
}
// evolution starts with the mind and the mind only
