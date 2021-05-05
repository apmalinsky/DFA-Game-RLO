//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float rightX;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );

	if(gl_FragColor.a != 0.0 && v_vTexcoord.x < rightX){
		gl_FragColor.r = 256.0;
		gl_FragColor.g = 0.0;
		gl_FragColor.b = 256.0;
	}
}