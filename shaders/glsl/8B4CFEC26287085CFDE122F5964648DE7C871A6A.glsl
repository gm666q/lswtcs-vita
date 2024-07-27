precision lowp float;

#define sampler3D samplerCube
vec4 texture(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 textureLod(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 textureLod(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }

//NU2API TEXTURES : 1 	_diffuse_tex 0, 
//NU2API CONSTANTS : 0 

//#version 130

struct PS_IN {
    vec2 _Texture;
};

struct VS_IN {
    int dummy;
};

struct VS_OUTTHRESHOLD {
    vec4 _Texture1;
};

struct PS_INTHRESHOLD {
    vec4 _Texture2;
};

vec4 _ret_0;
uniform sampler2D _diffuse_tex;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 // main procedure, the original name was copytex_px
void main()
{


    _ret_0 = texture(_diffuse_tex, cg_TexCoord0.xy);
    cg_FragColor = _ret_0;
    return;
} // main end



