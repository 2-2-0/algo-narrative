/*
  text_generation_1, by 220  (2021@Kant)
  Michael Scott's Markov based meme generator
  Code distributed under MIT license
  Michael Scott images, character and show dialog property of NBCUniversal
  Please provide credit where it is due
  
  2-2-0.online
  github.com/2-2-0

  Algorithmic narrative lab resource
  Markov meme generator
  
  Features and methods:
  - Creation of text based on actual show dialog
  - Uses Markov/n-grams to predict new text
 */


import rita.*;

RiMarkov rm;
PImage [] images;

PImage img;
String line;

PFont font;

// the more you try to be free, the more restraints you confront
void setup () {
  size (1200, 675);
  // set Markov engine and load Michael's show's dialog lines into it
  rm = RiTa.markov (3);
  rm.addText (join (loadStrings ("/home/u220/DATA/text-data/quotes.txt"), ""));
  
  // load images
  images = new PImage [7];
  for (int i=0; i<images.length; i++) {
    images [i] = loadImage (str (i+1)+".jpg");
  }
  
  // set presentation parameters
  font = loadFont ("Impact-52.vlw");
  textFont (font, 52);
  textAlign (CENTER, BOTTOM);
  noStroke ();
  
  // produce first meme!
  generate ();
}
// no matter how hard, sometimes things seem impossible to free yourself...
void draw () {
  background (0);
  image (img, 0, 0, width, height);
  
  fill (0);
  text (line, 52, 0, width-100, height-18);
  fill (255);
  text (line, 50, 0, width-100, height-20);
}
// ...but obstacles are set only by yourself - you attach yourself to them!
void generate () {
  // use RiTa's Markov to produce a new line
  line = join (rm.generate (1), "\n");
  // pick any random image
  img = images [(int)random (0, images.length)];
}
void keyTyped () {
  generate ();
}
void mouseClicked () {
  generate ();
}
// so, in order to be free, just BECOME free! Also 1517
