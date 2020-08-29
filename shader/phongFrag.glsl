#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform int lightCount;
uniform vec4 lightPosition[8];
uniform vec3 lightDiffuse[8];
uniform vec3 lightAmbient[8];
uniform vec3 lightSpecular[8];
  
varying vec3 N;
varying vec3 v;
varying vec4 c;

varying vec3 transformedNormal;
varying vec3 vertexCamera;
varying vec4 vertColor;

uniform float shininess;
uniform float cDiff;
uniform float cAmb;
uniform float cSpec;

void main (void)  
{  
vec3 cc = vec3(0);
  
   for (int i=0;i <2; i++) {
   //Diffuse light
   vec3 dir = normalize(lightPosition[i].xyz - vertexCamera);   
  float amountDiffuse = max(0.0, dot(dir, transformedNormal));
   
   //specularLight
	vec3 lightReflection = reflect(dir, transformedNormal);
	vec3 vertexViewDir = normalize(-vertexCamera);
	// specular light is dot product of light reflection vector and our viewing vector.
	float amountSpecular = max(0.0, dot(lightReflection, vertexViewDir));
	// apply an additional pow() to focus the specular effect
	amountSpecular = pow(amountSpecular, shininess);
   
   // write Total Color:  
   cc +=   cDiff*amountDiffuse*lightDiffuse[i]*vertColor.xyz
			+cAmb*lightAmbient[i]*vertColor.xyz
			+cSpec*amountSpecular*lightSpecular[i];
             
	
   }
   gl_FragColor = vec4(cc,1);
}
 