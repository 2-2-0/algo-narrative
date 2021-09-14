/*
  parametric_model_1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */

PGraphics renderStarfield () {
  PGraphics starfield = createGraphics (width, height);
  color star_color;
  int star_size;
  int star_x, star_y;
  
  starfield.beginDraw ();
  starfield.ellipseMode (CENTER);
  starfield.background (0, 0);
  for (int i=0; i<500; i++) {
    star_x = (int)random (width);
    star_y = (int)random (height);
    star_color = (int)random (192, 255);
    star_size = (int)random (1, 3);
    
    starfield.fill (star_color, 32);
    starfield.ellipse (star_x, star_y, int (star_size*3), int (star_size*3));
    starfield.ellipse (star_x, star_y, int (star_size*2), int (star_size*2));
    
    starfield.fill (star_color, 255);
    starfield.ellipse (star_x, star_y, star_size, star_size);
  }
  starfield.endDraw ();
  
  return starfield;
}

// random - essential parameters
void randomSystem1 () {
  starfield = renderStarfield ();
  
  star = new Star ("star", width/2, height/2);
  star.setAppearance ((int)random (20, 60), color ((int)random (0, 40), (int)random (80, 100), 100)); 
  
  // random generation method
  int total_planets = (int)random (1, 9);
  
  for (int i=0; i<total_planets; i++) {
    String id = str (char (65+i));
    Planet p = new Planet (id, star.x, star.y);
    p.setAppearance ((int)random (3, 13), color ((int)random (0, 255), (int)random (0, 80), 60));
    p.setOrbit ((int)random (star.magnitude, height/2), (int)random (250, 1500));
    
    int total_moons = (int)random (0, 5);
    for (int j=0; j<total_moons; j++) {
      Moon m = new Moon (str (char (48+j)), p.x, p.y);
      m.setAppearance ((int)random (0.8, 2), color ((int)random (0, 255), (int)random (0, 20), 40)); 
      m.setOrbit ((int)random (p.magnitude*1.2, p.magnitude*2), (int)random (250, 1500));
      p.addMoon (m);
    }
    star.addPlanet(p);
  }
  
  star.step ();
}


// random  - parametric
void randomSystem2 () {
  int star_age;
  color star_color = color (0, 0, 0);
  int star_magnitude = 1;

  starfield = renderStarfield ();
  
  star = new Star ("star", width/2, height/2);
  
  int spectral_type = (int)random (7);
  //spectral_type = 0;
  switch (spectral_type) {
    case 0:
      star_age = (int)random (10, 101);
      star_color = color (179, 18, 99);
      star_magnitude =(int)map (star_age, 10, 100, 100, 50);
      break;
    case 1:
      star_age = (int)random (100, 1001);
      star_color = color (179, 11, 99);
      star_magnitude =(int)map (star_age, 100, 1000, 50, 17);
      break;
    case 2:
      star_age = (int)random (1000, 3001);
      star_color = color (0, 0, 99);
      star_magnitude =(int)map (star_age, 1000, 3000, 17, 13);
      break;
    case 3:
      star_age = (int)random (3000, 10001);
      star_color = color (58, 22, 98);
      star_magnitude =(int)map (star_age, 3000, 10001, 13, 10);
      break;
    case 4:
      star_age = (int)random (10000, 50001);
      star_color = color (59, 59, 99);
      star_magnitude =(int)map (star_age, 10000, 50001, 11, 8);
      break;
    case 5:
      star_age = (int)random (50000, 200001);
      star_color = color (26, 99, 99);
      star_magnitude =(int)map (star_age, 50000, 200001, 8, 3);
      break;
    case 6:
      star_age = (int)random (200000, 250001);
      star_color = color (10, 99, 99);
      star_magnitude = (int)map (star_age, 200000, 250001, 3, 2);
      break;
  }
  star.setAppearance (star_magnitude, star_color);
  int temp_threshold_rock = star.magnitude*20;
  int temp_threshold_gas = star.magnitude*30;
  
  // random generation method
  int total_planets = (int)random (0, 10);
  int min_orbit = star.magnitude+(star.magnitude*4);

  for (int i=0; i<total_planets; i++) {
    String id = str (char (65+i));
    Planet p = new Planet (id, star.x, star.y);
    p.setAppearance ((int)random (2, star.magnitude*0.7), color ((int)random (0, 255), (int)random (0, 80), 60));
    
    min_orbit+= (p.magnitude*2)+(int)random (star.magnitude*2, star.magnitude*5);
    p.setOrbit (min_orbit, (int)random (250, 1500));
    
    // Planet composition: gas, rock/crystal/ice
    if (min_orbit<=temp_threshold_rock) p.composition = "rock";
    else if (min_orbit<=temp_threshold_gas) p.composition = "gas";
    else p.composition = "ice";
    
    int total_moons = (int)random (0, 5);
    for (int j=0; j<total_moons; j++) {
      Moon m = new Moon (str (char (48+j)), p.x, p.y);
      m.setAppearance ((int)random (0.8, 2), color ((int)random (0, 255), (int)random (0, 20), 40)); 
      m.setOrbit ((int)random (p.magnitude*1.2, p.magnitude*2), (int)random (250, 1500));
      p.addMoon (m);
    }

    star.addPlanet(p);
  }
   
  star.step ();
}
