//C:\sagadata\SharedShaders/0x8eb5b5d1.ios_pcode ukjbell Wed Nov 13 18:11:23 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP15;
vec3 _TMP7;
vec3 _TMP1;
float _TMP6;
vec4 _TMP5;
vec3 _TMP22;
vec3 _TMP21;
vec3 _TMP23;
float _TMP10;
float _TMP11;
vec3 _TMP3;
float _TMP9;
float _TMP8;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0081;
vec3 _reflection0099;
vec3 _r0105;
vec3 _v0105;
vec4 _colorLayer00113;
vec4 _result0115;
vec4 _envTexel0120;
vec3 _finalLightingFactor0120;
vec3 _c0122;
float _a0124;
float _falloff0125;
vec3 _b0127;
vec3 _TMP128;
vec3 _TMP129;
vec3 _TMP130;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform samplerCube _envmap_samplerCube;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0081 = -cg_TexCoord1.xyz;
    _TMP8 = dot(_v0081, _v0081);
    _TMP9 = inversesqrt(_TMP8);
    _TMP2 = _TMP9*_v0081;
    _TMP23 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP8 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP9 = inversesqrt(_TMP8);
    _TMP3 = _TMP9*cg_TexCoord0.xyz;
    _TMP21 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP11 = dot(vec3(float(_TMP21.x), float(_TMP21.y), float(_TMP21.z)), vec3(float(_TMP23.x), float(_TMP23.y), float(_TMP23.z)));
    _TMP10 = float(_TMP11);
    _reflection0099 = _TMP23 - (2.00000000E+000*_TMP21)*_TMP10;
    _v0105 = vec3(float(_reflection0099.x), float(_reflection0099.y), float(_reflection0099.z));
    _TMP128.x = _vs_view[0].x;
    _TMP128.y = _vs_view[0].y;
    _TMP128.z = _vs_view[0].z;
    _r0105.x = dot(_TMP128, _v0105);
    _TMP129.x = _vs_view[1].x;
    _TMP129.y = _vs_view[1].y;
    _TMP129.z = _vs_view[1].z;
    _r0105.y = dot(_TMP129, _v0105);
    _TMP130.x = _vs_view[2].x;
    _TMP130.y = _vs_view[2].y;
    _TMP130.z = _vs_view[2].z;
    _r0105.z = dot(_TMP130, _v0105);
    _TMP22 = vec3(float((-_r0105).x), float((-_r0105).y), float((-_r0105).z));
    _colorLayer00113.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _result0115 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP15._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00113.w));
    _c0122 = vec3(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z));
    _TMP5 = texture(_envmap_samplerCube, _c0122);
    _envTexel0120 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _finalLightingFactor0120 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0124 = _envTexel0120.w*_envmap_params.z;
    _TMP6 = _a0124 + (1.00000000E+000 - _a0124);
    _envTexel0120 = _envTexel0120*_TMP6;
    _TMP1 = (_envmap_params.y*_envTexel0120.xyz)*_finalLightingFactor0120;
    _TMP15._color[0].xyz = _TMP15._color[0].xyz + vec3(float((_result0115.xyz*_TMP1).x), float((_result0115.xyz*_TMP1).y), float((_result0115.xyz*_TMP1).z));
    _falloff0125 = float(_input1._texcoord2);
    _b0127 = vec3(float(_TMP15._color[0].x), float(_TMP15._color[0].y), float(_TMP15._color[0].z));
    _TMP7 = _fog_color.xyz + _falloff0125*(_b0127 - _fog_color.xyz);
    _TMP15._color[0].xyz = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    cg_FragColor = _TMP15._color[0];
    return;
} 
