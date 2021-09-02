/*
  Character Appearance 1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */
  
int [] bs_shirts;
int [] bs_pants;
int [] bs_shoes;
int [] bs_hats;

int [] ba_shirts;
int [] ba_pants;
int [] ba_shoes;
int [] ba_hats;

int [] tm_shirts;
int [] tm_pants;
int [] tm_shoes;
int [] tm_hats;

void setRules () {
  // bystanders
  bs_shirts = new int [6];
  bs_shirts [0] = 3;
  bs_shirts [1] = 4;
  bs_shirts [2] = 5;
  bs_shirts [3] = 6;
  bs_shirts [4] = 7;
  bs_shirts [5] = 8;
  
  bs_pants = new int [5];
  bs_pants [0] = 0;
  bs_pants [1] = 1;
  bs_pants [2] = 2;
  bs_pants [3] = 3;
  bs_pants [4] = 4;
  
  bs_shoes = new int [4];
  bs_shoes [0] = 0;
  bs_shoes [1] = 1;
  bs_shoes [2] = 2;
  bs_shoes [3] = 3;
  
  bs_hats = new int [3];
  bs_hats [0] = 2;
  bs_hats [1] = 3;
  bs_hats [2] = 4;
  
  // black army
  tm_shirts = new int [2];
  tm_shirts [0] = 1;
  tm_shirts [1] = 2;
  
  tm_pants = new int [5];
  tm_pants [0] = 0;
  tm_pants [1] = 1;
  tm_pants [2] = 2;
  tm_pants [3] = 3;
  tm_pants [4] = 4;
  
  tm_shoes = new int [4];
  tm_shoes [0] = 0;
  tm_shoes [1] = 1;
  tm_shoes [2] = 2;
  tm_shoes [3] = 3;
  
  tm_hats = new int [2];
  tm_hats [0] = 1;
  tm_hats [1] = 2;
  
  // total maga
  ba_shirts = new int [2];
  ba_shirts [0] = 0;
  ba_shirts [1] = 3;
  
  ba_pants = new int [1];
  ba_pants [0] = 0;
  
  ba_shoes = new int [1];
  ba_shoes [0] = 0;
  
  ba_hats = new int [2];
  ba_hats [0] = 0;
  ba_hats [1] = 3;
}
