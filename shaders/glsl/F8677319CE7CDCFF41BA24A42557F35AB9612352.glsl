precision lowp float;

#define sampler3D samplerCube
vec4 texture(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 textureLod(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 textureLod(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }

//NU2API TEXTURES : 1 	_diffuse_tex 0, 
//NU2API CONSTANTS : 1 	_fog_color 0, 

//#version 130

struct VS_IN {
    vec4 _color1;
    vec2 _texcoord1;
};

struct VS_OUT {
    vec4 _color;
    vec4 _texcoord;
    vec3 _fog;
};

vec4 _TMP0;
uniform sampler2D _diffuse_tex;
uniform vec4 _fog_color;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 // main procedure, the original name was debris_px
void main()
{

    vec4 _vColor;

    _TMP0 = texture(_diffuse_tex, cg_TexCoord0.xy);
    _vColor = (_TMP0*cg_FrontColor)*2.00000000E+000;
    _vColor.xyz = _fog_color.xyz + cg_TexCoord1.x*(_vColor.xyz - _fog_color.xyz);
    cg_FragColor = _vColor;
    return;
} // main end



