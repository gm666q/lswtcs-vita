//C:\sagadata\SharedShaders/0xa3c47fdd.ios_pcode ukjbell Wed Nov 13 18:08:15 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP24;
vec3 _TMP11;
vec4 _TMP0;
vec3 _TMP10;
float _TMP18;
float _TMP17;
float _TMP20;
float _TMP16;
float _TMP15;
vec3 _TMP35;
float _TMP14;
vec3 _TMP34;
float _TMP19;
float _TMP38;
float _TMP37;
float _TMP9;
float _TMP8;
float _TMP7;
float _TMP6;
vec4 _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP13;
float _TMP12;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0106;
vec4 _colorLayer00130;
vec4 _colorLayer10130;
vec4 _TMP135;
vec3 _TMP1020136;
vec4 _result0138;
vec3 _diffuseLight0153;
vec3 _R20155;
vec3 _specularPhong0155;
vec3 _i0157;
vec3 _TMP980169;
vec3 _specularLight0169;
float _falloff0170;
vec3 _b0172;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _averageLightColor;
uniform vec4 _averageLightDir;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _specular_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0106 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0106, _v0106);
    _TMP13 = inversesqrt(_TMP12);
    _TMP1 = _TMP13*_v0106;
    _TMP35 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*cg_TexCoord0.xyz;
    _TMP34 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00130 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00130.w = _colorLayer00130.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00130 = _colorLayer00130*_input1._varying_colorSet0;
    _TMP4 = texture(_layer1_sampler, cg_TexCoord3.xy);
    _colorLayer10130 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _colorLayer10130.w = _colorLayer10130.w*_layer1_diffuse.w;
    _colorLayer10130.xyz = _colorLayer10130.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10130.w = _colorLayer10130.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP1020136 = _colorLayer00130.xyz*(1.00000000E+000 - _colorLayer10130.w) + _colorLayer10130.xyz*_colorLayer10130.w;
    _TMP135 = vec4(_TMP1020136.x, _TMP1020136.y, _TMP1020136.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00130.w)*(1.00000000E+000 - _colorLayer10130.w));
    _TMP5 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0138 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _TMP14 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)));
    _TMP6 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP15);
    _TMP37 = _TMP7*_vs_lightPosition0.w;
    _TMP14 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)));
    _TMP8 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP8));
    _TMP9 = float(_TMP15);
    _TMP38 = _TMP9*_vs_lightPosition1.w;
    _diffuseLight0153 = _TMP37*_vs_lightColor0.xyz;
    _diffuseLight0153 = _diffuseLight0153 + _TMP38*_vs_lightColor1.xyz;
    _i0157 = -_averageLightDir.xyz;
    _TMP14 = dot(vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)), vec3(float(_i0157.x), float(_i0157.y), float(_i0157.z)));
    _TMP19 = float(_TMP14);
    _R20155 = _i0157 - (2.00000000E+000*_TMP34)*_TMP19;
    _TMP14 = dot(vec3(float(_TMP35.x), float(_TMP35.y), float(_TMP35.z)), vec3(float(_R20155.x), float(_R20155.y), float(_R20155.z)));
    _TMP16 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP16));
    _TMP17 = float(_TMP15);
    _TMP20 = pow(float(_TMP17), float(_specular_params.x));
    _TMP18 = float(_TMP20);
    _specularPhong0155 = _averageLightColor.xyz*_TMP18;
    _TMP10 = _specularPhong0155*_specular_params.y;
    _diffuseLight0153 = _diffuseLight0153 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0153 = _diffuseLight0153 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0153);
    _specularLight0169 = _TMP10*_result0138.xyz;
    _TMP980169 = _TMP135.xyz*_diffuseLight0153 + _specularLight0169;
    _TMP0 = vec4(_TMP980169.x, _TMP980169.y, _TMP980169.z, _TMP135.w);
    _TMP24._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0170 = float(_input1._texcoord4);
    _b0172 = vec3(float(_TMP24._color[0].x), float(_TMP24._color[0].y), float(_TMP24._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0170*(_b0172 - _fog_color.xyz);
    _TMP24._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP24._color[0];
    return;
} 
