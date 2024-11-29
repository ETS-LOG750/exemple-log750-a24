#version 460

layout( triangles_adjacency ) in;
layout( triangle_strip, max_vertices = 18 ) out;

in vec3 fPosition[];

// In camera space
layout(location = 4) uniform vec3 lightPosition;
// projection matrix from the light
layout(location = 5) uniform mat4 projMatrix;

float EPSILON = 0.01;

// Check if one of direction have a different orientation
// compared to the normal
bool facesLight( vec3 a, vec3 b, vec3 c )
{
  vec3 n = cross( b - a, c - a );
  vec3 da = lightPosition.xyz - a;
  vec3 db = lightPosition.xyz - b;
  vec3 dc = lightPosition.xyz - c;

  return dot(n, da) > 0 || dot(n, db) > 0 || dot(n, dc) > 0; 
}

// Create a infinite quad from a given edge
// The edge is extruded with the light direction 
void emitEdgeQuad( vec3 a, vec3 b ) {
  vec3 LightDir = normalize(a - lightPosition.xyz); 
  vec3 deviation = LightDir * EPSILON;
  gl_Position = projMatrix * vec4(a + deviation, 1);
  EmitVertex();
  
  gl_Position = projMatrix * vec4(LightDir, 0);
  EmitVertex();

  LightDir = normalize(b - lightPosition.xyz); 
  deviation = LightDir * EPSILON;
  gl_Position = projMatrix * vec4(b + deviation, 1);
  EmitVertex();

  gl_Position = projMatrix * vec4(LightDir, 0);
  EmitVertex();
  EndPrimitive();
}

void main()
{
    if( facesLight(fPosition[0], fPosition[2], fPosition[4]) ) {
        // Check if the other have different orientation
        if( ! facesLight(fPosition[0],fPosition[1],fPosition[2]) ) 
          emitEdgeQuad(fPosition[0],fPosition[2]);
        if( ! facesLight(fPosition[2],fPosition[3],fPosition[4]) ) 
          emitEdgeQuad(fPosition[2],fPosition[4]);
        if( ! facesLight(fPosition[4],fPosition[5],fPosition[0]) ) 
          emitEdgeQuad(fPosition[4],fPosition[0]);

		// Generation du front cap: 
        //  - On genere la surface juste en dessous de la surface
        //  - On utilise un epsilon pour mettre le cap avant
		vec3 LightDir = normalize(fPosition[0] - lightPosition.xyz); 
		vec3 deviation = LightDir * EPSILON;
		gl_Position = projMatrix * vec4(fPosition[0] + deviation, 1);
		EmitVertex();

		LightDir = normalize(fPosition[2] - lightPosition.xyz); 
		deviation = LightDir * EPSILON;
		gl_Position =  projMatrix * vec4(fPosition[2] + deviation, 1);
		EmitVertex();

		LightDir = normalize(fPosition[4] - lightPosition.xyz); 
		deviation = LightDir * EPSILON;
		gl_Position =  projMatrix * vec4(fPosition[4] + deviation, 1);
		EmitVertex();
	    EndPrimitive();
		
		// Generation du back: 
        //  - On prend la direction, et on la met a l'infini (w=0)
		LightDir = normalize(fPosition[0] - lightPosition.xyz); 
		gl_Position = projMatrix * vec4(LightDir, 0);
		EmitVertex();

		LightDir = normalize(fPosition[4] - lightPosition.xyz); 
		gl_Position =  projMatrix * vec4(LightDir, 0);
		EmitVertex();

		LightDir = normalize(fPosition[2] - lightPosition.xyz); 
		gl_Position =  projMatrix * vec4(LightDir, 0);
		EmitVertex();
	    EndPrimitive();
    }

}