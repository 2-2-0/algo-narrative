/*
  Character Appearance 1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */

Human createHuman () {
  int skin_tone_index = (int)random (skin_tones.length);
  color skin_tone = skin_tones [skin_tone_index];
  
  PImage hair = hairs [(int)random (hairs.length)];
  int hair_tone_index = (int)random (hair_tones.length);
  color hair_tone = hair_tones [hair_tone_index];
  
  return new Human (body, skin_tone, hair, hair_tone);
}
Human createRandom () {
  Human new_human = createHuman ();
  
  ArrayList clothes = new ArrayList ();
  clothes.add (shirts [(int)random (shirts.length)]);
  clothes.add (pants [(int)random (pants.length)]);
  clothes.add (shoes [(int)random (shoes.length)]);
  
  if (random (100)>50) clothes.add (hats [(int)random (hats.length)]);
  
  new_human.addClothes (clothes);
  return new_human;
}

Human createWithRules (int [] rules_shirts, int [] rules_pants, int [] rules_shoes, int [] rules_hats, int hats_probability) {
  Human new_human = createHuman ();
  
  ArrayList clothes = new ArrayList ();
  clothes.add (shirts [rules_shirts [(int)random (rules_shirts.length)]]);
  clothes.add (pants [rules_pants [(int)random (rules_pants.length)]]);
  clothes.add (shoes [rules_shoes [(int)random (rules_shoes.length)]]);
  if (random (100)<hats_probability) clothes.add (hats [rules_hats [(int)random (rules_hats.length)]]);
 
  new_human.addClothes (clothes);
  return new_human;
}
ArrayList createGroup () {
  ArrayList group = new ArrayList ();
  
  for (int i=0; i<14; i++) {
    group.add (createRandom ());
  }
  
  return group;
}
ArrayList createGroup (int [] rules_shirts, int [] rules_pants, int [] rules_shoes, int [] rules_hats, int hats_probability) {
  ArrayList group = new ArrayList ();
  
  for (int i=0; i<14; i++) {
    group.add (createWithRules (rules_shirts, rules_pants, rules_shoes, rules_hats, hats_probability));
  }
  
  return group;
}
void createSamples () {
  all_random = createGroup ();
  bystanders = createGroup (bs_shirts, bs_pants, bs_shoes, bs_hats, 40);
  black_army = createGroup (ba_shirts, ba_pants, ba_shoes, ba_hats, 100);
  total_maga = createGroup (tm_shirts, tm_pants, tm_shoes, tm_hats, 80);
}
