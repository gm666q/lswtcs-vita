//SharedShaders/0x06e93df9.ios_pcode uklgonzale Wed Mar 12 14:33:32 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP20;
vec3 _TMP11;
vec3 _TMP1;
float _TMP10;
vec4 _TMP9;
vec3 _TMP29;
vec4 _TMP0;
float _TMP32;
float _TMP31;
float _TMP8;
float _TMP7;
float _TMP16;
vec3 _TMP28;
float _TMP15;
float _TMP6;
float _TMP5;
vec3 _TMP30;
float _TMP14;
vec3 _TMP3;
float _TMP13;
float _TMP12;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0094;
vec3 _reflection0116;
vec3 _r0122;
vec3 _v0122;
vec4 _colorLayer00130;
vec4 _result0132;
vec3 _diffuseLight0145;
vec3 _TMP880149;
vec4 _envTexel0151;
vec3 _finalLightingFactor0151;
vec3 _c0153;
float _a0155;
float _falloff0156;
vec3 _b0158;
vec3 _TMP159;
vec3 _TMP160;
vec3 _TMP161;
uniform highp vec4 _vs_view[4];
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
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
    _v0094 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0094, _v0094);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*_v0094;
    _TMP30 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP3 = _TMP13*cg_TexCoord0.xyz;
    _TMP28 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP15 = dot(vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)), vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)));
    _TMP14 = float(_TMP15);
    _reflection0116 = _TMP30 - (2.00000000E+000*_TMP28)*_TMP14;
    _v0122 = vec3(float(_reflection0116.x), float(_reflection0116.y), float(_reflection0116.z));
    _TMP159.x = _vs_view[0].x;
    _TMP159.y = _vs_view[0].y;
    _TMP159.z = _vs_view[0].z;
    _r0122.x = dot(_TMP159, _v0122);
    _TMP160.x = _vs_view[1].x;
    _TMP160.y = _vs_view[1].y;
    _TMP160.z = _vs_view[1].z;
    _r0122.y = dot(_TMP160, _v0122);
    _TMP161.x = _vs_view[2].x;
    _TMP161.y = _vs_view[2].y;
    _TMP161.z = _vs_view[2].z;
    _r0122.z = dot(_TMP161, _v0122);
    _TMP29 = vec3(float((-_r0122).x), float((-_r0122).y), float((-_r0122).z));
    _colorLayer00130 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00130.w = _colorLayer00130.w*_layer_kOpacities.x;
    _result0132 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP15 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP5 = float(_TMP15);
    _TMP16 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP16);
    _TMP31 = _TMP6*_vs_lightPosition0.w;
    _TMP15 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP7 = float(_TMP15);
    _TMP16 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP16);
    _TMP32 = _TMP8*_vs_lightPosition1.w;
    _diffuseLight0145 = _TMP31*_vs_lightColor0.xyz;
    _diffuseLight0145 = _diffuseLight0145 + _TMP32*_vs_lightColor1.xyz;
    _diffuseLight0145 = _diffuseLight0145 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0145 = _diffuseLight0145 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0145);
    _TMP880149 = _colorLayer00130.xyz*_diffuseLight0145;
    _TMP0 = vec4(_TMP880149.x, _TMP880149.y, _TMP880149.z, _colorLayer00130.w);
    _TMP20._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0153 = vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z));
    _TMP9 = texture(_envmap_samplerCube, _c0153);
    _envTexel0151 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _finalLightingFactor0151 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0145*_envmap_params.x;
    _a0155 = _envTexel0151.w*_envmap_params.z;
    _TMP10 = _a0155 + (1.00000000E+000 - _a0155);
    _envTexel0151 = _envTexel0151*_TMP10;
    _TMP1 = (_envmap_params.y*_envTexel0151.xyz)*_finalLightingFactor0151;
    _TMP20._color[0].xyz = _TMP20._color[0].xyz + vec3(float((_result0132.xyz*_TMP1).x), float((_result0132.xyz*_TMP1).y), float((_result0132.xyz*_TMP1).z));
    _falloff0156 = float(_input1._texcoord2);
    _b0158 = vec3(float(_TMP20._color[0].x), float(_TMP20._color[0].y), float(_TMP20._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0156*(_b0158 - _fog_color.xyz);
    _TMP20._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP20._color[0];
    return;
} 
