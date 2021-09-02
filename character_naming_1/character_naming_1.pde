/*
  Character Naming 1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Character name generator
  
  Features and methods:
  - Random entries from an established data bank
 */

String [] first_names_list = {"Alex", "Tom", "Wesley", "John", "Thomas", "Ray", "Adam", "Tony", "Jeff", "Jeffrey", "Vincent", "Frank", "Roy", "Henry", "Herbert", "Nick", "Oscar", "Michael", "Kevin", "Jim", "Albert"};
String [] last_names_list = {"Smith", "Hammond", "Johnson", "Williams", "Brown", "Jones", "Garcia", "Miller", "Davis", "Wilson", "Anderson", "Thomas", "Taylor", "Moore", "Jackson", "Martin", "Thompson", "White", "Harris", "Clark", "Lewis", "Robinson", "Walker", "Young", "King", "Allen", "Scott"};

String name = "";

void setup () {
  size (280, 60);
  textAlign (CENTER, CENTER);
  
  name = buildName ();
}
void draw () {
  background (0);
  text (name, width/2, height/2);
}
void keyTyped () {
  name = buildName ();
}
void mouseClicked () {
  name = buildName ();
}
String buildName () {
  String name;

  // get two random item locations from the arrays
  int first_name_index = (int)random (0, first_names_list.length);
  int last_name_index = (int)random (0, last_names_list.length);
  
  // using the item locations, we simply get the name from the arrays
  String first_name = first_names_list [first_name_index];
  String last_name = last_names_list [last_name_index];
  
  // join them... that's it!
  name = first_name+" "+last_name;
  
  return name;
}
// Reality is totally incomprehensible for us. What we see is an illusion - a metareality
