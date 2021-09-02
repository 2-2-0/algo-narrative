/*
  Character Appearance 1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */
  
color [] skin_tones = {#FFE0BD, #FFCD94, #EAC086, #FFAD60, #FFE39F};
color [] hair_tones = {#F0E38E, #EAD068, #DAC586, #B29258, #8D6E37};

PImage [] shirts;
PImage [] pants;
PImage [] shoes;
PImage [] hats;
PImage [] hairs;

void setWardrobe () {
  shirts = new PImage [9];
  shirts [0] = loadImage ("shirt_FredPerry.png");
  shirts [1] = loadImage ("shirt_MAGA.png");
  shirts [2] = loadImage ("shirt_red.png");
  shirts [3] = loadImage ("shirt_black.png");
  shirts [4] = loadImage ("shirt_white.png");
  shirts [5] = loadImage ("shirt_blue.png");
  shirts [6] = loadImage ("shirt_green.png");
  shirts [7] = loadImage ("shirt_orange.png");
  shirts [8] = loadImage ("shirt_purple.png");

  pants = new PImage [5];
  pants [0] = loadImage ("pants_black.png");
  pants [1] = loadImage ("pants_jeans-1.png");
  pants [2] = loadImage ("pants_jeans-2.png");
  pants [3] = loadImage ("pants_jeans-3.png");
  pants [4] = loadImage ("pants_gray.png");

  shoes = new PImage [4];
  shoes [0] = loadImage ("shoes_black.png");
  shoes [1] = loadImage ("shoes_sneakers-red.png");
  shoes [2] = loadImage ("shoes_sneakers-1.png");
  shoes [3] = loadImage ("shoes_sneakers-2.png");
  
  hats = new PImage [8];
  hats [0] = loadImage ("hat_FredPerry.png");
  hats [1] = loadImage ("hat_MAGA.png");
  hats [2] = loadImage ("hat_red.png");
  hats [3] = loadImage ("hat_black.png");
  hats [4] = loadImage ("hat_jeans.png");
  hats [5] = loadImage ("hat_purple.png");
  hats [6] = loadImage ("hat_white.png");
  hats [7] = loadImage ("hat_lgray.png");
  
  hairs = new PImage [5];
  hairs [0] = loadImage ("hair_baseline.png");
  hairs [1] = loadImage ("hair_long.png");
  hairs [2] = loadImage ("hair_messy.png");
  hairs [3] = loadImage ("hair_premullet.png");
  hairs [4] = loadImage ("hair_recceding.png");
}

class Human {
  color skin_tone;
  PImage body;
  
  color hair_tone;
  PImage hair;
  
  ArrayList clothes;
  
  Human (PImage body, color skin_tone, PImage hair, color hair_tone) {
    this.body = body;
    this.skin_tone = skin_tone;
    
    this.hair = hair;
    this.hair_tone = hair_tone;
    
    this.clothes = new ArrayList ();

  }
  Human (PImage body, color skin_tone, PImage hair, color hair_tone, ArrayList clothes) {
    this.body = body;
    this.skin_tone = skin_tone;
    
    this.hair = hair;
    this.hair_tone = hair_tone;
    
    this.clothes = clothes;
  }
  void addClothes (ArrayList clothes) {
    this.clothes = clothes;
  }
  void draw (int x, int y) {
    tint (this.skin_tone);
    image (this.body, x, y);
    
    tint (this.hair_tone);
    image (this.hair, x, y);
    tint (255);
    
    
    for (int i=0; i<this.clothes.size (); i++) {
      image ((PImage)this.clothes.get (i), x, y);
    }
  }
}
