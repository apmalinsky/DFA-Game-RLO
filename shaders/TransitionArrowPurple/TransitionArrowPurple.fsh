//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float rightX;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    //239 204 120
	if(gl_FragColor.a != 0.0 && v_vTexcoord.x < rightX){
		gl_FragColor.r = 0.93;
		gl_FragColor.g = 0.79;
		gl_FragColor.b = 0.46;
	}
}