/*
  parametric_model_1, by 220  (2021@Kant)
  Code and art distributed under MIT license
  Please provide credit where it is due
  */

class CelestialObject {
  String id;
  int x;
  int y;

  int magnitude;
  color apparent_color;
    
  CelestialObject (String id, int x, int y) {
    this.id = id;
    this.x = x;
    this.y = y;
  }
  void setAppearance (int magnitude, color apparent_color) {
    this.magnitude = magnitude;
    this.apparent_color = apparent_color;
  }
  void draw () {
    noStroke ();
    fill (this.apparent_color);
    ellipse (this.x, this.y, this.magnitude, this.magnitude);      
  }
  void step () {}
}
class OrbitalObject extends CelestialObject {
  int orbital_radius;
  int orbital_angle;
  int orbital_speed;
  long orbit_timer;
  
  int o_x, o_y;
  
  OrbitalObject (String id, int x, int y) {
    super (id, x, y);
    this.o_x = x;
    this.o_y = y;
    
    this.orbit_timer = millis ()-10000;
  }
  void setOrbit (int orbital_radius, int orbital_speed) {
    this.orbital_radius = orbital_radius;
    this.orbital_angle = (int)random (360);
    this.orbital_speed = orbital_speed;
  }
  void draw (boolean label) {
    String s;
    
    stroke (192, 64);
    noFill ();
    ellipse (this.x, this.y, this.orbital_radius, this.orbital_radius);
    
    noStroke ();
    fill (this.apparent_color);
    ellipse (this.o_x, this.o_y, this.magnitude, this.magnitude);
    
    if (label) {
      this.label (this.o_x+this.magnitude+5, this.o_y+this.magnitude+5);
    }
  }
  void label (int x, int y) {
    fill (255);
    s = this.id+"\n";
    s+= "O/R: "+str (this.orbital_radius)+"\n";
    s+= "O/S: "+str (this.orbital_speed)+"\n";
    text (s, x, y);
  }
  void step (int x, int y) {
    this.x = x;
    this.y = y;
    
    this.o_x = this.x + int (this.orbital_radius * cos (radians (this.orbital_angle)));
    this.o_y = this.y + int (this.orbital_radius * sin (radians (this.orbital_angle)));
    
    if (millis ()-this.orbit_timer>=this.orbital_speed) {
      this.orbit_timer = millis ();
      
      this.orbital_angle++;
      this.orbital_angle%= 360;
    }
  }
}
class Star extends CelestialObject {
  ArrayList planets;
  Planet p;
  
  int luminosity;
  color surface_color;
  int temperature;

  
  Star (String id, int x, int y) {
    super (id, x, y);
    
    this.planets = new ArrayList ();
  }
  void draw (boolean label) {
    // draw star
    super.draw ();
    
    // draw planets
    for (int i=0; i<this.planets.size (); i++) {
      p = (Planet)this.planets.get (i);
      p.draw (label);
    }
  }
  void step () {
    for (int i=0; i<this.planets.size (); i++) {
      p = (Planet)this.planets.get (i);
      p.step (this.x, this.y);
    }
  }
  void addPlanet (Planet planet) {
    this.planets.add (planet);
  }
}

class Planet extends OrbitalObject {
  ArrayList moons;
  Moon m;
  String composition;
  
  Planet (String id, int x, int y) {
    super (id, x, y);
    this.moons = new ArrayList ();
  }
  void draw (boolean label) {
    // draw planet
    super.draw (label);
    
    // draw moons
    for (int i=0; i<this.moons.size (); i++) {
      m = (Moon)this.moons.get (i);
      m.draw (label);
    }
  }
  void step (int x, int y) {
    super.step (x, y);
    
    for (int i=0; i<this.moons.size (); i++) {
      m = (Moon)this.moons.get (i);
      m.step (this.o_x, this.o_y);
    }
  }
  void label (int x, int y) {
    fill (0, 100, 75);
    s = this.id+"\n";
    s+= "O/R: "+str (this.orbital_radius)+"\n";
    s+= "O/S: "+str (this.orbital_speed)+"\n";
    s+= "Cx: "+this.composition+"\n";
    text (s, x, y);
  }
  void addMoon (Moon moon) {
    this.moons.add (moon);
  }
}
class Moon extends OrbitalObject {
  Moon (String id, int x, int y) {
    super (id, x, y);
  }
}
