//SharedShaders/0x119d862b.ios_pcode uklgonzale Wed Mar 12 20:28:16 2014

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
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP21;
vec3 _TMP8;
vec4 _TMP0;
vec3 _TMP7;
float _TMP15;
float _TMP14;
float _TMP17;
float _TMP13;
float _TMP12;
vec3 _TMP30;
float _TMP11;
vec3 _TMP29;
float _TMP16;
float _TMP35;
float _TMP34;
float _TMP6;
float _TMP5;
float _TMP4;
float _TMP3;
vec3 _TMP2;
float _TMP10;
float _TMP9;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0102;
vec4 _colorLayer00130;
vec4 _result0138;
vec3 _diffuseLight0151;
vec3 _R20153;
vec3 _specularPhong0153;
vec3 _i0155;
vec3 _TMP930167;
vec3 _specularLight0167;
float _falloff0168;
vec3 _b0170;
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
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0102 = -cg_TexCoord1.xyz;
    _TMP9 = dot(_v0102, _v0102);
    _TMP10 = inversesqrt(_TMP9);
    _TMP1 = _TMP10*_v0102;
    _TMP30 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP2 = _TMP10*cg_TexCoord0.xyz;
    _TMP29 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _colorLayer00130 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00130.w = _colorLayer00130.w*_layer_kOpacities.x;
    _result0138 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP11 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z)));
    _TMP3 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP3));
    _TMP4 = float(_TMP12);
    _TMP34 = _TMP4*_vs_lightPosition0.w;
    _TMP11 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z)));
    _TMP5 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP12);
    _TMP35 = _TMP6*_vs_lightPosition1.w;
    _diffuseLight0151 = _TMP34*_vs_lightColor0.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _TMP35*_vs_lightColor1.xyz;
    _i0155 = -_averageLightDir.xyz;
    _TMP11 = dot(vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z)), vec3(float(_i0155.x), float(_i0155.y), float(_i0155.z)));
    _TMP16 = float(_TMP11);
    _R20153 = _i0155 - (2.00000000E+000*_TMP29)*_TMP16;
    _TMP11 = dot(vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)), vec3(float(_R20153.x), float(_R20153.y), float(_R20153.z)));
    _TMP13 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP13));
    _TMP14 = float(_TMP12);
    _TMP17 = pow(float(_TMP14), float(_specular_params.x));
    _TMP15 = float(_TMP17);
    _specularPhong0153 = _averageLightColor.xyz*_TMP15;
    _TMP7 = _specularPhong0153*_specular_params.y;
    _diffuseLight0151 = _diffuseLight0151 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0151);
    _specularLight0167 = _TMP7*_result0138.xyz;
    _TMP930167 = _colorLayer00130.xyz*_diffuseLight0151 + _specularLight0167;
    _TMP0 = vec4(_TMP930167.x, _TMP930167.y, _TMP930167.z, _colorLayer00130.w);
    _TMP21._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0168 = float(_input1._texcoord2);
    _b0170 = vec3(float(_TMP21._color[0].x), float(_TMP21._color[0].y), float(_TMP21._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0168*(_b0170 - _fog_color.xyz);
    _TMP21._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    cg_FragColor = _TMP21._color[0];
    return;
} 
