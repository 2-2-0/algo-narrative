/*
  character_dialog_1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */

// If so humans were so easy...
class Human {
  String name;
  String race;
  
  int mood;
  
  String dialog = "";
  int dialog_step = 0;
  
  PImage view;
  
  Human (String name, String race, PImage appearance) {
    this.name = name;

    this.race = race;
    this.mood = (int)random (-50, 50);
    
    this.view = createImage (appearance.width, appearance.height, ARGB);
    appearance.loadPixels ();
    arrayCopy (appearance.pixels, this.view.pixels);
    this.view.updatePixels ();
  }
}

class HumanMaker {
  String [] pants_files = {"pants_long_loose.png", "pants_long_stretch.png", "pants_shorts.png", "pants_bermudas.png"};
  String [] shirts_files = {"shirt_jersey.png", "shirt_long_loose.png", "shirt_long_tucked.png", "shirt_short_loose.png", "shirt_short_tucked.png"};
  String [] shoes_files = {"shoes_wear.png", "shoes_boots.png", "shoes_sandals.png"};
  
  String [] insults = {};
  
  // Refs for names: https://abcnews.go.com/2020/top-20-whitest-blackest-names/story?id=2470131
  color [] caucasian_skin_tones = {#FFE0BD, #FFCD94, #EAC086, #FFAD60, #FFE39F};
  color [] caucasian_hair_tones = {#F0E38E, #EAD068, #DAC586, #B29258, #8D6E37};
  String [] caucasian_names = {"Jake", "Connor", "Tanner", "Wyatt", "Cody", "Dustin", "Luke", "Jack", "Scott", "Logan", "Cole", "Lucas", "Bradley", "Jacob", "Garrett", "Dylan", "Maxwell", "Hunter", "Brett", "Colin"};
  color [] caucasian_pants_colors = {#ffffff, #7CAAC6, #84BEEB, #425D8C, #313345, #1A224A, #161313, #c3b091};
  color [] caucasian_shirt_colors = {#ffffff, #dddddd, #303030, #ea2b0e, #fff80f, #4e871f, #2a871f, #040404};
  color [] caucasian_shoe_colors = {#000000, #101010, #201800};
  
  color [] afroamerican_skin_tones = {#260701, #3d0c02, #843722, #af6e51, #c69076};
  color [] afroamerican_hair_tones = {#F0E38E, #EAD068, #DAC586, #B29258, #8D6E37};
  String [] afroamerican_names = {"DeShawn", "DeAndre", "Marquis", "Darnell", "Terrell", "Malik", "Trevon", "Tyrone", "Willie", "Dominique", "Demetrius", "Reginald", "Jamal", "Maurice", "Jalen", "Darius", "Xavier", "Terrance", "Andre", "Darryl"};
  color [] afroamerican_pants_colors = {#8B3C2F, #CBCA50, #3E52B8, #3EB844, #161313, #7caac6, #425D8C, #313345};
  color [] afroamerican_shirt_colors = {#ffffff, #dddddd, #8B3C2F, #CBCA50, #3E52B8, #3EB844, #161313, #7a3975, #a3444d, #3c968a};
  color [] afroamerican_shoe_colors = {#000000, #101010, #201800};
  
  PImage body;
  PImage [] pants;
  PImage [] shirts;
  PImage [] shoes;
  
  PGraphics appearance;
  
  HumanMaker () {
    this.body = loadImage ("body.png");
    
    this.loadWardrobe ();
    this.appearance = createGraphics (this.body.width, this.body.height);
  }
  void loadWardrobe () {
    // load pants
    this.pants = new PImage [this.pants_files.length];
    for (int i=0; i<this.pants_files.length; i++) {
      this.pants [i] = loadImage (this.pants_files [i]);
    }
    
    // load shirts
    this.shirts = new PImage [this.shirts_files.length];
    for (int i=0; i<this.shirts_files.length; i++) {
      this.shirts [i] = loadImage (this.shirts_files [i]);
    }
    
    // load shoes
    this.shoes = new PImage [this.shoes_files.length];
    for (int i=0; i<this.shoes_files.length; i++) {
      this.shoes [i] = loadImage (this.shoes_files [i]);
    }
  }
  Human newHuman (String race) {
    Human new_human;
    String name = "";
    color skin_tone = color (255);
    color hair_tone = color (192);
    color pants_color = color (0);
    color shirt_color = color (0);
    color shoe_color = color (0);
    
    switch (race) {
      case "Caucasian":
        name = caucasian_names [(int)random (caucasian_names.length)];
        skin_tone = caucasian_skin_tones [(int)random (caucasian_skin_tones.length)];
        hair_tone = caucasian_hair_tones [(int)random (caucasian_hair_tones.length)];
        pants_color = caucasian_pants_colors [(int)random (caucasian_pants_colors.length)];
        shirt_color = caucasian_shirt_colors [(int)random (caucasian_shirt_colors.length)];
        shoe_color = caucasian_shoe_colors [(int)random (caucasian_shoe_colors.length)];
        break;
      case "AfroAmerican":
        name = afroamerican_names [(int)random (afroamerican_names.length)];
        skin_tone = afroamerican_skin_tones [(int)random (afroamerican_skin_tones.length)];
        hair_tone = afroamerican_hair_tones [(int)random (afroamerican_hair_tones.length)];
        pants_color = afroamerican_pants_colors [(int)random (afroamerican_pants_colors.length)];
        shirt_color = afroamerican_shirt_colors [(int)random (afroamerican_shirt_colors.length)];
        shoe_color = afroamerican_shoe_colors [(int)random (afroamerican_shoe_colors.length)];
        break;
    }
    
    this.appearance.beginDraw ();
    this.appearance.background (0, 0);
    this.appearance.tint (skin_tone);
    this.appearance.image (body, 0, 0);
    this.appearance.tint (hair_tone);

    this.appearance.tint (shoe_color);
    this.appearance.image (this.shoes [(int)random (this.shoes.length)], 0, 0);
    
    this.appearance.tint (pants_color);
    this.appearance.image (this.pants [(int)random (this.pants.length)], 0, 0);
    
    this.appearance.tint (shirt_color);
    this.appearance.image (this.shirts [(int)random (this.shirts.length)], 0, 0);
    
    this.appearance.endDraw ();
    
    new_human = new Human (name, race, this.appearance);
    
    return new_human;
  }
}
