uniform int lightCount;
uniform vec3 lightDiffuse[8];
uniform vec4 lightPosition[8];


attribute vec4 vertex;
attribute vec4 color;
attribute vec3 normal;

uniform mat4 modelview;
uniform mat4 transform;
uniform mat3 normalMatrix;

varying vec3 transformedNormal;
varying vec3 vertexCamera;
varying vec4 vertColor;
varying vec3 lightDir[8];

void main(void)  
{     
vertColor = color;
   gl_Position = transform * vertex;
   vertexCamera = vec3(modelview * vertex);       
   transformedNormal = normalize(normalMatrix * normal);
   for (int i=0;i<lightCount;i++)
   lightDir[i] = normalize(lightPosition[i].xyz - vertexCamera);
     
}