//Spotlight 1 Variables
float x1;
float y1= -50;
float z1;
boolean light1On = false;
int concentration1;
float angle1;
PShape light1; //Spotlight physical representation

//Spotlight 2 Variables
float x2;
float y2= -50;
float z2;
boolean light2On = false;
int concentration2;
float angle2;
PShape light2;

void loadSpotlights() { 
  //spotLight(color, color,   color,    x,     y,  z, nx, ny, nz, angle, concentration)
  if (light1On && !light2On) { //Light 1
    spotLight(255, 255, 255, x1, y1, z1, -x1, -y1, -1, angle1, concentration1);
  } else if  (light2On && !light1On) { //Light 2 
    spotLight(255, 255, 255, x2, y2, z2, -x2, -y2, -1, angle2, concentration2);
  } else if (light1On && light2On) { // Light 1 & 2
    spotLight(255, 255, 255, x1, y1, z1, -x1, -y1, -1, angle1, concentration1);
    spotLight(255, 255, 255, x2, y2, z2, -x2, -y2, -1, angle2, concentration2);
  }
}

void rotateSpotlights() {
  int steps = 200;
  int radius = 200;
  pushMatrix();
  x1= radius*sin(map(frameCount % steps, 0, steps, 0, TWO_PI));
  z1 =radius*cos(map(frameCount % steps, 0, steps, 0, TWO_PI));
  x2 = -x1;
  z2 = -z1;
  popMatrix();
}

void visualizeSpotlight() { //Demonstrates where spotlight 1 and 2 is spinning
light1 = createShape(SPHERE, 5);
light1.setFill(color(255, 0, 0));
if(light1On){
  pushMatrix();
  translate(x1, y1, z1);
  shape(light1);
  popMatrix();
}

light2 = createShape(SPHERE, 5);
light2.setFill(color(0, 0, 255));
if(light2On){
   pushMatrix();
  translate(x2, y2, z2);
  shape(light2);
  popMatrix();
}
}

//ControlP5 methods assigning GUI component values to control the spotlight
// On/OFF Light
void light1 (boolean b) {  
  light1On = b;
}
void light2 (boolean b) {
  light2On = b;
}
// Concentration control
void light1Con(int value) {
  concentration1 = value;
}
void light2Con(int value) {
  concentration2 = value;
}
// CutOff Angle 
void light1CutOff(int value) {
  angle1 = radians(value);
  println("Cut off value for light 1: " + radians(value));
}
void light2CutOff(int value) {
  angle2 = radians(value);
  println("Cut off value for light 2: " + radians(value));
}
