//C:\sagadata\SharedShaders/0xba458165.ios_pcode ukjbell Wed Nov 13 18:12:33 2013

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

FragmentOutput _TMP22;
vec3 _TMP13;
vec3 _TMP1;
float _TMP12;
vec4 _TMP11;
vec3 _TMP32;
vec4 _TMP0;
float _TMP35;
float _TMP34;
float _TMP10;
float _TMP9;
float _TMP18;
vec3 _TMP31;
float _TMP17;
float _TMP8;
float _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP33;
float _TMP16;
vec3 _TMP3;
float _TMP15;
float _TMP14;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0098;
vec3 _reflection0120;
vec3 _r0126;
vec3 _v0126;
vec4 _colorLayer00134;
vec4 _result0138;
vec3 _diffuseLight0153;
vec3 _TMP930157;
vec4 _envTexel0159;
vec3 _finalLightingFactor0159;
vec3 _c0161;
float _a0163;
float _falloff0164;
vec3 _b0166;
vec3 _TMP167;
vec3 _TMP168;
vec3 _TMP169;
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
uniform sampler2D _layer0_sampler;
uniform sampler2D _specular_sampler;
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
    _TMP14 = dot(_v0098, _v0098);
    _TMP15 = inversesqrt(_TMP14);
    _TMP2 = _TMP15*_v0098;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP14 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP15 = inversesqrt(_TMP14);
    _TMP3 = _TMP15*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP17 = dot(vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP16 = float(_TMP17);
    _reflection0120 = _TMP33 - (2.00000000E+000*_TMP31)*_TMP16;
    _v0126 = vec3(float(_reflection0120.x), float(_reflection0120.y), float(_reflection0120.z));
    _TMP167.x = _vs_view[0].x;
    _TMP167.y = _vs_view[0].y;
    _TMP167.z = _vs_view[0].z;
    _r0126.x = dot(_TMP167, _v0126);
    _TMP168.x = _vs_view[1].x;
    _TMP168.y = _vs_view[1].y;
    _TMP168.z = _vs_view[1].z;
    _r0126.y = dot(_TMP168, _v0126);
    _TMP169.x = _vs_view[2].x;
    _TMP169.y = _vs_view[2].y;
    _TMP169.z = _vs_view[2].z;
    _r0126.z = dot(_TMP169, _v0126);
    _TMP32 = vec3(float((-_r0126).x), float((-_r0126).y), float((-_r0126).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00134 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00134.w = _colorLayer00134.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00134 = _colorLayer00134*_input1._varying_colorSet0;
    _TMP6 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0138 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP17 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP7 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP18);
    _TMP34 = _TMP8*_vs_lightPosition0.w;
    _TMP17 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP9 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP9));
    _TMP10 = float(_TMP18);
    _TMP35 = _TMP10*_vs_lightPosition1.w;
    _diffuseLight0153 = _TMP34*_vs_lightColor0.xyz;
    _diffuseLight0153 = _diffuseLight0153 + _TMP35*_vs_lightColor1.xyz;
    _diffuseLight0153 = _diffuseLight0153 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0153 = _diffuseLight0153 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0153);
    _TMP930157 = _colorLayer00134.xyz*_diffuseLight0153;
    _TMP0 = vec4(_TMP930157.x, _TMP930157.y, _TMP930157.z, _colorLayer00134.w);
    _TMP22._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0161 = vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z));
    _TMP11 = texture(_envmap_samplerCube, _c0161);
    _envTexel0159 = vec4(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z), float(_TMP11.w));
    _finalLightingFactor0159 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0153*_envmap_params.x;
    _a0163 = _envTexel0159.w*_envmap_params.z;
    _TMP12 = _a0163 + (1.00000000E+000 - _a0163);
    _envTexel0159 = _envTexel0159*_TMP12;
    _TMP1 = (_envmap_params.y*_envTexel0159.xyz)*_finalLightingFactor0159;
    _TMP22._color[0].xyz = _TMP22._color[0].xyz + vec3(float((_result0138.xyz*_TMP1).x), float((_result0138.xyz*_TMP1).y), float((_result0138.xyz*_TMP1).z));
    _falloff0164 = float(_input1._texcoord3);
    _b0166 = vec3(float(_TMP22._color[0].x), float(_TMP22._color[0].y), float(_TMP22._color[0].z));
    _TMP13 = _fog_color.xyz + _falloff0164*(_b0166 - _fog_color.xyz);
    _TMP22._color[0].xyz = vec3(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z));
    cg_FragColor = _TMP22._color[0];
    return;
} 
