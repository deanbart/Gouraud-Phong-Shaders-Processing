import controlP5.*;
ControlP5 cp5;
boolean gouraudChosen = false;
boolean phongChosen = false;


void addGUIControls() {
  //GUI controls using 'ControlP5'
  cp5 = new ControlP5(this);
  cp5.setAutoDraw(false);
  PFont p = createFont("Verdana", 18); //Setting the font for the buttons and slider
  ControlFont font = new ControlFont(p);
  cp5.setFont(font);

  //Dropdown List: Shader choice
  DropdownList dropShader = cp5.addDropdownList("Select Shader")
    .setPosition(10, height-130)
    .setSize(200, height-10)
    .setItemHeight(25)
    .setBarHeight(25);
  dropShader.addItem("Gouraud Shader", 0);
  dropShader.addItem("Phong Shader", 1);
  dropShader.addItem("No Shader", 2);

  //Spotlight 1 Controls - Concentration, On/Off, Cutoff Angle
  cp5.addSlider("light1Con")
    .setRange(0, 1000)
    .setPosition(width/2-180, height-75)
    .setColorLabel(color(255))
    .setSize(200, 30)
    ;
  cp5.addButton("light1") 
    .setPosition(width/2-300, height-75)
    .setSize(100, 30)
    .setSwitch(true);
  ;
  cp5.addKnob("light1CutOff")
    .setRange(0, 360)
    .setPosition(width-300, height-80)
    .setColorLabel(color(255))
    .setSize(50, 50);

  //Spotlight 2 Controls
  cp5.addButton("light2") 
    .setPosition(width/2-300, height-35)
    .setSize(100, 30)
    .setSwitch(true);
  ;
  cp5.addSlider("light2Con")
    .setRange(0, 1000)
    .setPosition(width/2-180, height-35)
    .setColorLabel(color(255))
    .setSize(200, 30)
    ;
  cp5.addKnob("light2CutOff")
    .setRange(0, 360)
    .setPosition(width-110, height-80)
    .setColorLabel(color(255))
    .setSize(50, 50);
}  

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) { 
    if (theEvent.getController().getName()=="Select Shader"   
      && theEvent.getController().getValue() == 0) {
      gouraudChosen = true;
      phongChosen = false;
      println("Gouruad chosen");
    }
    if (theEvent.getController().getName()=="Select Shader"   
      && theEvent.getController().getValue() == 1) {
      phongChosen = true;
      gouraudChosen = false;
      println("Phong chosen");
    }
    if (theEvent.getController().getName()=="Select Shader" 
      && theEvent.getController().getValue() == 2) {
      cookTorranceChosen = true;
      phongChosen = false;
      gouraudChosen = false;
      println("Cook-Torrance chosen");
    }
    if (theEvent.getController().getName()=="Select Shader" 
      && theEvent.getController().getValue() == 3) {
      resetShader();
      phongChosen = false;
      gouraudChosen = false;
      println("No shader");
    }
  }
}
void removeGUIDepth() { //Stops controls from moving in 3D space http://www.sojamo.de/libraries/controlP5/examples/extra/ControlP5withPeasyCam/ControlP5withPeasyCam.pde
  hint(DISABLE_DEPTH_TEST);
  cam.beginHUD();
  cp5.draw();
  cam.endHUD();
  hint(ENABLE_DEPTH_TEST);

  if (cp5.isMouseOver()) { //Stops PEasy Cam movements when using controls
    cam.setActive(false);
  } else {
    cam.setActive(true);
  }
}
