#extension GL_ARB_draw_buffers : enable
precision lowp float;

#define sampler3D samplerCube
vec4 texture(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 textureLod(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 textureLod(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }

//NU2API TEXTURES : 1 	_diffuse_tex 0, 
//NU2API CONSTANTS : 2 	_alphaTestParameters 112, 	_fog_color 0, 

//#version 130

struct VS_IN {
    vec4 _color1;
    vec2 _texcoord1;
    vec2 _size;
};

struct VS_OUT {
    vec4 _color;
    vec2 _texcoord;
    vec3 _fog;
};

struct PSOutput {
    vec4 _color2;
    vec4 _normal;
};

vec4 _TMP0;
float _c0017;
uniform sampler2D _diffuse_tex;
uniform vec4 _fog_color;
uniform vec2 _alphaTestParameters;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor
#define cg_FragData1 gl_FragColor

 // main procedure, the original name was faceOn_px
void main()
{

    vec4 _vColor;

    _TMP0 = texture(_diffuse_tex, cg_TexCoord0.xy);
    _vColor = _TMP0*cg_FrontColor;
    _vColor.xyz = _fog_color.xyz + cg_TexCoord1.x*(_vColor.xyz - _fog_color.xyz);
    _c0017 = _vColor.w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0017 < 0.00000000E+000) { // if begin
        discard;
    } // end if
    cg_FragData1 = vec4( 5.00000000E-001, 5.00000000E-001, 5.00000000E-001, 1.00000000E+000);
    cg_FragColor = _vColor;
    return;
} // main end



