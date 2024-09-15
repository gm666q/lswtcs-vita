//C:\sagadata\SharedShaders/0x87400a5d.ios_pcode ukjbell Wed Nov 13 18:16:34 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP23;
vec3 _TMP10;
vec4 _TMP0;
vec3 _TMP9;
float _TMP17;
float _TMP16;
float _TMP19;
float _TMP15;
float _TMP14;
vec3 _TMP34;
float _TMP13;
vec3 _TMP33;
float _TMP18;
float _TMP37;
float _TMP36;
float _TMP8;
float _TMP7;
float _TMP6;
float _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP12;
float _TMP11;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0106;
vec4 _colorLayer00130;
vec4 _colorLayer10130;
vec4 _TMP135;
vec3 _TMP1010136;
vec4 _result0138;
vec3 _diffuseLight0151;
vec3 _R20153;
vec3 _specularPhong0153;
vec3 _i0155;
vec3 _TMP970167;
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
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0106 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0106, _v0106);
    _TMP12 = inversesqrt(_TMP11);
    _TMP1 = _TMP12*_v0106;
    _TMP34 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord0.xyz;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00130 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00130.w = _colorLayer00130.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00130 = _colorLayer00130*_input1._varying_colorSet0;
    _TMP4 = texture(_layer1_sampler, cg_TexCoord3.xy);
    _colorLayer10130 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _colorLayer10130.w = _colorLayer10130.w*_layer1_diffuse.w;
    _colorLayer10130.xyz = _colorLayer10130.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10130.w = _colorLayer10130.w*_layer_kOpacities.y;
    _TMP1010136 = _colorLayer00130.xyz + _colorLayer10130.xyz*_colorLayer10130.w;
    _TMP135 = vec4(_TMP1010136.x, _TMP1010136.y, _TMP1010136.z, _colorLayer00130.w);
    _result0138 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP5 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP14);
    _TMP36 = _TMP6*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP7 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP14);
    _TMP37 = _TMP8*_vs_lightPosition1.w;
    _diffuseLight0151 = _TMP36*_vs_lightColor0.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _TMP37*_vs_lightColor1.xyz;
    _i0155 = -_averageLightDir.xyz;
    _TMP13 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_i0155.x), float(_i0155.y), float(_i0155.z)));
    _TMP18 = float(_TMP13);
    _R20153 = _i0155 - (2.00000000E+000*_TMP33)*_TMP18;
    _TMP13 = dot(vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)), vec3(float(_R20153.x), float(_R20153.y), float(_R20153.z)));
    _TMP15 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP15));
    _TMP16 = float(_TMP14);
    _TMP19 = pow(float(_TMP16), float(_specular_params.x));
    _TMP17 = float(_TMP19);
    _specularPhong0153 = _averageLightColor.xyz*_TMP17;
    _TMP9 = _specularPhong0153*_specular_params.y;
    _diffuseLight0151 = _diffuseLight0151 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0151);
    _specularLight0167 = _TMP9*_result0138.xyz;
    _TMP970167 = _TMP135.xyz*_diffuseLight0151 + _specularLight0167;
    _TMP0 = vec4(_TMP970167.x, _TMP970167.y, _TMP970167.z, _TMP135.w);
    _TMP23._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0168 = float(_input1._texcoord4);
    _b0170 = vec3(float(_TMP23._color[0].x), float(_TMP23._color[0].y), float(_TMP23._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0168*(_b0170 - _fog_color.xyz);
    _TMP23._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP23._color[0];
    return;
} 
