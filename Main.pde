
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam cam;
PImage bg; //https://unsplash.com/photos/Ef6iL87-vOA

void setup() {
  size(1080, 720, P3D);
  cam = new PeasyCam(this, 300);
  bg = loadImage("model//starfield.jpg");
  noStroke();
  loadShaders(); 
  addGUIControls();

}
void draw() {
  background(bg);
  loadSpotlights();
  rotateSpotlights();
  visualizeSpotlight();
  displayShaders();
  sphereDetail(10);
  sphere(40);
  resetShader();
  removeGUIDepth();
 
}
