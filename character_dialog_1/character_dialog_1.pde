/*
  character_dialog_1, by 220  (2021@Kant)
  Examples on three different dialog models implementation
  
  Code and art distributed under MIT license
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Character creation and mood based dialog generation
  
  Features and methods:
  - Independent character wardrobe: 'sprites' and object classes
  - Fixed dialogs
  - Multiple responses
  - Dimensional dialogs
 */

HumanMaker human_maker;

Human person_a;
Human person_b;

PFont font_score;

DialogManager dm;

// Today is the day you become a better version of yourself
void setup () {
  size (800, 600);

  human_maker = new HumanMaker ();
  
  dm = new DialogManager ();

  font_score = loadFont ("LilliputSteps-16.vlw");
  imageMode (CENTER);
  textFont (font_score, 16);

  createPersons ();
}
void draw () {
  String label;
  
  background (80);
  image (person_a.view, width/4, height/2);
  label = person_a.name+"\n"+str (person_a.mood);
  textAlign (CENTER, TOP);
  text (label, width/4, height-50);

  pushMatrix ();
  translate ((width/4)*3, height/2);
  scale (-1, 1);
  image (person_b.view, 0, 0);
  popMatrix ();
  label = person_b.name+"\n"+str (person_b.mood);
  text (label, (width/4)*3, height-50);
  
  fill (0);
  textAlign (LEFT, TOP);
  text (person_a.dialog, width/3-(width/8), (height/5)-19);
  textAlign (RIGHT, TOP);
  text (person_b.dialog, ((width/3)*2)+(width/8), (height/5)+21);
  
  fill (255);
  textAlign (LEFT, TOP);
  text (person_a.dialog, width/3-(width/8), (height/5)-20);
  textAlign (RIGHT, TOP);
  text (person_b.dialog, ((width/3)*2)+(width/8), (height/5)+20);
}
void createPersons () {
  String race;
  
  race = random (100)>50?"Caucasian":"AfroAmerican";
  person_a = human_maker.newHuman (race);
  race = random (100)>50?"Caucasian":"AfroAmerican";
  person_b = human_maker.newHuman (race);
}
void keyTyped () {
  switch (key) {
    case 'r':
    case 'R':
      createPersons ();
      break;
    case '1':
      dm.fixedDialog (person_a, person_b);
      break;
    case '2':
      dm.multipleResponses (person_a, person_b);
      break;
    case '3':
      dm.dimensionalDialogs (person_a, person_b);
      break;
  }
}
