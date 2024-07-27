//C:\sagadata\SharedShaders/0x8ceee70e.ios_pcode ukjbell Wed Nov 13 18:16:39 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP16;
vec3 _TMP8;
vec3 _TMP1;
float _TMP7;
vec4 _TMP6;
vec3 _TMP27;
vec4 _TMP5;
vec3 _TMP26;
vec3 _TMP28;
float _TMP11;
float _TMP12;
vec3 _TMP3;
float _TMP10;
float _TMP9;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0098;
vec3 _reflection0118;
vec3 _r0124;
vec3 _v0124;
vec4 _colorLayer00132;
vec4 _result0138;
vec4 _envTexel0143;
vec3 _finalLightingFactor0143;
vec3 _c0145;
float _a0147;
float _falloff0148;
vec3 _b0150;
float _c0151;
vec3 _TMP152;
vec3 _TMP153;
vec3 _TMP154;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
uniform samplerCube _envmap_samplerCube;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0098 = -cg_TexCoord1.xyz;
    _TMP9 = dot(_v0098, _v0098);
    _TMP10 = inversesqrt(_TMP9);
    _TMP2 = _TMP10*_v0098;
    _TMP28 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP3 = _TMP10*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP12 = dot(vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP11 = float(_TMP12);
    _reflection0118 = _TMP28 - (2.00000000E+000*_TMP26)*_TMP11;
    _v0124 = vec3(float(_reflection0118.x), float(_reflection0118.y), float(_reflection0118.z));
    _TMP152.x = _vs_view[0].x;
    _TMP152.y = _vs_view[0].y;
    _TMP152.z = _vs_view[0].z;
    _r0124.x = dot(_TMP152, _v0124);
    _TMP153.x = _vs_view[1].x;
    _TMP153.y = _vs_view[1].y;
    _TMP153.z = _vs_view[1].z;
    _r0124.y = dot(_TMP153, _v0124);
    _TMP154.x = _vs_view[2].x;
    _TMP154.y = _vs_view[2].y;
    _TMP154.z = _vs_view[2].z;
    _r0124.z = dot(_TMP154, _v0124);
    _TMP27 = vec3(float((-_r0124).x), float((-_r0124).y), float((-_r0124).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00132 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00132.w = _colorLayer00132.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00132 = _colorLayer00132*_input1._varying_colorSet0;
    _result0138 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP16._color[0] = vec4(float(_colorLayer00132.x), float(_colorLayer00132.y), float(_colorLayer00132.z), float(_colorLayer00132.w));
    _c0145 = vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z));
    _TMP6 = texture(_envmap_samplerCube, _c0145);
    _envTexel0143 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _finalLightingFactor0143 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0147 = _envTexel0143.w*_envmap_params.z;
    _TMP7 = _a0147 + (1.00000000E+000 - _a0147);
    _envTexel0143 = _envTexel0143*_TMP7;
    _TMP1 = (_envmap_params.y*_envTexel0143.xyz)*_finalLightingFactor0143;
    _TMP16._color[0].xyz = _TMP16._color[0].xyz + vec3(float((_result0138.xyz*_TMP1).x), float((_result0138.xyz*_TMP1).y), float((_result0138.xyz*_TMP1).z));
    _falloff0148 = float(_input1._texcoord3);
    _b0150 = vec3(float(_TMP16._color[0].x), float(_TMP16._color[0].y), float(_TMP16._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0148*(_b0150 - _fog_color.xyz);
    _TMP16._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _c0151 = _TMP16._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0151 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP16._color[0];
    return;
} 
