//SharedShaders/0x00dc1b7c.ios_pcode uklgonzale Tue Mar 11 16:25:26 2014

precision lowp float;

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
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP23;
vec3 _TMP10;
vec3 _TMP1;
vec4 _TMP9;
vec4 _TMP0;
vec3 _TMP8;
float _TMP17;
float _TMP16;
float _TMP19;
float _TMP15;
float _TMP14;
vec3 _TMP32;
float _TMP13;
vec3 _TMP31;
float _TMP18;
float _TMP34;
float _TMP33;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP4;
vec3 _TMP3;
float _TMP12;
float _TMP11;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0095;
vec4 _colorLayer00117;
vec4 _result0119;
vec3 _diffuseLight0132;
vec3 _R20134;
vec3 _specularPhong0134;
vec3 _i0136;
vec3 _TMP900148;
vec3 _specularLight0148;
vec4 _envTexel0150;
float _falloff0153;
vec3 _b0155;
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
uniform sampler2D _ps2_shinemap_sampler;
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
    _v0095 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0095, _v0095);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*_v0095;
    _TMP32 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP3 = _TMP12*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _colorLayer00117 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00117.w = _colorLayer00117.w*_layer_kOpacities.x;
    _result0119 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP4 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP14);
    _TMP33 = _TMP5*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP6 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP14);
    _TMP34 = _TMP7*_vs_lightPosition1.w;
    _diffuseLight0132 = _TMP33*_vs_lightColor0.xyz;
    _diffuseLight0132 = _diffuseLight0132 + _TMP34*_vs_lightColor1.xyz;
    _i0136 = -_averageLightDir.xyz;
    _TMP13 = dot(vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)), vec3(float(_i0136.x), float(_i0136.y), float(_i0136.z)));
    _TMP18 = float(_TMP13);
    _R20134 = _i0136 - (2.00000000E+000*_TMP31)*_TMP18;
    _TMP13 = dot(vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)), vec3(float(_R20134.x), float(_R20134.y), float(_R20134.z)));
    _TMP15 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP15));
    _TMP16 = float(_TMP14);
    _TMP19 = pow(float(_TMP16), float(_specular_params.x));
    _TMP17 = float(_TMP19);
    _specularPhong0134 = _averageLightColor.xyz*_TMP17;
    _TMP8 = _specularPhong0134*_specular_params.y;
    _diffuseLight0132 = _diffuseLight0132 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0132 = _diffuseLight0132 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0132);
    _specularLight0148 = _TMP8*_result0119.xyz;
    _TMP900148 = _colorLayer00117.xyz*_diffuseLight0132 + _specularLight0148;
    _TMP0 = vec4(_TMP900148.x, _TMP900148.y, _TMP900148.z, _colorLayer00117.w);
    _TMP23._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP9 = texture(_ps2_shinemap_sampler, cg_TexCoord2.xy);
    _envTexel0150 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _TMP1 = (_envTexel0150.xyz*_specular_params.y)*_diffuseLight0132;
    _TMP23._color[0].xyz = _TMP23._color[0].xyz + vec3(float((_result0119.xyz*_TMP1).x), float((_result0119.xyz*_TMP1).y), float((_result0119.xyz*_TMP1).z));
    _falloff0153 = float(_input1._texcoord3);
    _b0155 = vec3(float(_TMP23._color[0].x), float(_TMP23._color[0].y), float(_TMP23._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0153*(_b0155 - _fog_color.xyz);
    _TMP23._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP23._color[0];
    return;
} 
