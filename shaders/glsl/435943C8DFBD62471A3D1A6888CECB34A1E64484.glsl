//SharedShaders/0x1e718cbc.ios_pcode uklgonzale Wed Mar 12 14:34:24 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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
vec3 _TMP9;
vec4 _TMP0;
vec3 _TMP8;
float _TMP16;
float _TMP15;
float _TMP18;
float _TMP14;
float _TMP13;
vec3 _TMP32;
float _TMP12;
vec3 _TMP31;
float _TMP17;
float _TMP34;
float _TMP33;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP11;
float _TMP10;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0097;
vec4 _colorLayer00119;
vec4 _result0123;
vec3 _diffuseLight0136;
vec3 _R20138;
vec3 _specularPhong0138;
vec3 _i0140;
vec3 _TMP920152;
vec3 _specularLight0152;
float _falloff0153;
vec3 _b0155;
float _c0156;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _averageLightColor;
uniform vec4 _averageLightDir;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
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
    _v0097 = -cg_TexCoord1.xyz;
    _TMP10 = dot(_v0097, _v0097);
    _TMP11 = inversesqrt(_TMP10);
    _TMP1 = _TMP11*_v0097;
    _TMP32 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00119 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00119.w = _colorLayer00119.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00119 = _colorLayer00119*_input1._varying_colorSet0;
    _result0123 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP12 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP4 = float(_TMP12);
    _TMP13 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP13);
    _TMP33 = _TMP5*_vs_lightPosition0.w;
    _TMP12 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP6 = float(_TMP12);
    _TMP13 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP13);
    _TMP34 = _TMP7*_vs_lightPosition1.w;
    _diffuseLight0136 = _TMP33*_vs_lightColor0.xyz;
    _diffuseLight0136 = _diffuseLight0136 + _TMP34*_vs_lightColor1.xyz;
    _i0140 = -_averageLightDir.xyz;
    _TMP12 = dot(vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)), vec3(float(_i0140.x), float(_i0140.y), float(_i0140.z)));
    _TMP17 = float(_TMP12);
    _R20138 = _i0140 - (2.00000000E+000*_TMP31)*_TMP17;
    _TMP12 = dot(vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)), vec3(float(_R20138.x), float(_R20138.y), float(_R20138.z)));
    _TMP14 = float(_TMP12);
    _TMP13 = max(0.00000000E+000, float(_TMP14));
    _TMP15 = float(_TMP13);
    _TMP18 = pow(float(_TMP15), float(_specular_params.x));
    _TMP16 = float(_TMP18);
    _specularPhong0138 = _averageLightColor.xyz*_TMP16;
    _TMP8 = _specularPhong0138*_specular_params.y;
    _diffuseLight0136 = _diffuseLight0136 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0136 = _diffuseLight0136 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0136);
    _specularLight0152 = _TMP8*_result0123.xyz;
    _TMP920152 = _colorLayer00119.xyz*_diffuseLight0136 + _specularLight0152;
    _TMP0 = vec4(_TMP920152.x, _TMP920152.y, _TMP920152.z, _colorLayer00119.w);
    _TMP22._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0153 = float(_input1._texcoord3);
    _b0155 = vec3(float(_TMP22._color[0].x), float(_TMP22._color[0].y), float(_TMP22._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0153*(_b0155 - _fog_color.xyz);
    _TMP22._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    _c0156 = _TMP22._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0156 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP22._color[0];
    return;
} 
