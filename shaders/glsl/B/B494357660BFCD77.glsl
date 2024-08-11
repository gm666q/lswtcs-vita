//SharedShaders/0x33c8c744.ios_pcode uklgonzale Tue Mar 11 16:29:54 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec4 _blendWeight0;
    vec4 _blendIndices0;
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

FragmentOutput _TMP21;
vec3 _TMP12;
vec3 _TMP1;
float _TMP11;
vec4 _TMP10;
vec3 _TMP32;
vec4 _TMP0;
float _TMP35;
float _TMP34;
float _TMP9;
float _TMP8;
float _TMP17;
vec3 _TMP31;
float _TMP16;
float _TMP7;
float _TMP6;
vec4 _TMP5;
vec3 _TMP33;
float _TMP15;
vec3 _TMP3;
float _TMP14;
float _TMP13;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0099;
vec3 _reflection0121;
vec3 _r0127;
vec3 _v0127;
vec4 _colorLayer00135;
vec4 _result0139;
vec3 _diffuseLight0152;
vec3 _TMP930156;
vec4 _envTexel0158;
vec3 _finalLightingFactor0158;
vec3 _c0160;
float _a0162;
float _falloff0163;
vec3 _b0165;
vec3 _TMP166;
vec3 _TMP167;
vec3 _TMP168;
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
uniform sampler2D _layer0_sampler;
uniform samplerCube _envmap_samplerCube;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0099 = -cg_TexCoord1.xyz;
    _TMP13 = dot(_v0099, _v0099);
    _TMP14 = inversesqrt(_TMP13);
    _TMP2 = _TMP14*_v0099;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP13 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP14 = inversesqrt(_TMP13);
    _TMP3 = _TMP14*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP16 = dot(vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP15 = float(_TMP16);
    _reflection0121 = _TMP33 - (2.00000000E+000*_TMP31)*_TMP15;
    _v0127 = vec3(float(_reflection0121.x), float(_reflection0121.y), float(_reflection0121.z));
    _TMP166.x = _vs_view[0].x;
    _TMP166.y = _vs_view[0].y;
    _TMP166.z = _vs_view[0].z;
    _r0127.x = dot(_TMP166, _v0127);
    _TMP167.x = _vs_view[1].x;
    _TMP167.y = _vs_view[1].y;
    _TMP167.z = _vs_view[1].z;
    _r0127.y = dot(_TMP167, _v0127);
    _TMP168.x = _vs_view[2].x;
    _TMP168.y = _vs_view[2].y;
    _TMP168.z = _vs_view[2].z;
    _r0127.z = dot(_TMP168, _v0127);
    _TMP32 = vec3(float((-_r0127).x), float((-_r0127).y), float((-_r0127).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00135 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00135.w = _colorLayer00135.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00135 = _colorLayer00135*_input1._varying_colorSet0;
    _result0139 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP16 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP6 = float(_TMP16);
    _TMP17 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP17);
    _TMP34 = _TMP7*_vs_lightPosition0.w;
    _TMP16 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP8 = float(_TMP16);
    _TMP17 = max(0.00000000E+000, float(_TMP8));
    _TMP9 = float(_TMP17);
    _TMP35 = _TMP9*_vs_lightPosition1.w;
    _diffuseLight0152 = _TMP34*_vs_lightColor0.xyz;
    _diffuseLight0152 = _diffuseLight0152 + _TMP35*_vs_lightColor1.xyz;
    _diffuseLight0152 = _diffuseLight0152 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0152 = _diffuseLight0152 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0152);
    _TMP930156 = _colorLayer00135.xyz*_diffuseLight0152;
    _TMP0 = vec4(_TMP930156.x, _TMP930156.y, _TMP930156.z, _colorLayer00135.w);
    _TMP21._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0160 = vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z));
    _TMP10 = texture(_envmap_samplerCube, _c0160);
    _envTexel0158 = vec4(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z), float(_TMP10.w));
    _finalLightingFactor0158 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0152*_envmap_params.x;
    _a0162 = _envTexel0158.w*_envmap_params.z;
    _TMP11 = _a0162 + (1.00000000E+000 - _a0162);
    _envTexel0158 = _envTexel0158*_TMP11;
    _TMP1 = (_envmap_params.y*_envTexel0158.xyz)*_finalLightingFactor0158;
    _TMP21._color[0].xyz = _TMP21._color[0].xyz + vec3(float((_result0139.xyz*_TMP1).x), float((_result0139.xyz*_TMP1).y), float((_result0139.xyz*_TMP1).z));
    _falloff0163 = float(_input1._texcoord3);
    _b0165 = vec3(float(_TMP21._color[0].x), float(_TMP21._color[0].y), float(_TMP21._color[0].z));
    _TMP12 = _fog_color.xyz + _falloff0163*(_b0165 - _fog_color.xyz);
    _TMP21._color[0].xyz = vec3(float(_TMP12.x), float(_TMP12.y), float(_TMP12.z));
    cg_FragColor = _TMP21._color[0];
    return;
} 
