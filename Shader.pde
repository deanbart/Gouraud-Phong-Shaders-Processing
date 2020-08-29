PShader gouraudShader;
PShader phongShader;

void loadShaders() {
  gouraudShader = loadShader("shader//gouraudFrag.glsl", "shader//gouraudVert.glsl");

  phongShader = loadShader("shader//phongFrag.glsl", "shader//phongVert.glsl");  
  phongShader.set("cDiff", 0.8);
  phongShader.set("cAmb", 0.1);
  phongShader.set("cSpec", 0.15);
  phongShader.set("shininess", 0.13);
  

}
void displayShaders() {
  if (gouraudChosen) {
    shader(gouraudShader);
  }
  if (phongChosen) {
    shader(phongShader);
  }
}
