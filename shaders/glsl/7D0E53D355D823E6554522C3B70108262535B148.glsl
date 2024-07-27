//SharedShaders/0x75d5e07f.ios_pcode uklgonzale Wed Mar 12 20:43:39 2014

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

FragmentOutput _TMP24;
vec3 _TMP11;
vec4 _TMP0;
vec3 _TMP10;
float _TMP18;
float _TMP17;
float _TMP20;
float _TMP16;
float _TMP15;
vec3 _TMP34;
float _TMP14;
vec3 _TMP33;
float _TMP19;
float _TMP37;
float _TMP36;
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
vec3 _v0104;
vec4 _colorLayer00128;
vec4 _colorLayer10128;
vec4 _TMP133;
vec3 _TMP970134;
vec4 _result0136;
vec3 _diffuseLight0151;
vec3 _R20153;
vec3 _specularPhong0153;
vec3 _i0155;
vec3 _TMP960167;
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
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
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
    _v0104 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0104, _v0104);
    _TMP13 = inversesqrt(_TMP12);
    _TMP1 = _TMP13*_v0104;
    _TMP34 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*cg_TexCoord0.xyz;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00128 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00128.w = _colorLayer00128.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00128 = _colorLayer00128*_input1._varying_colorSet0;
    _TMP4 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10128 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _colorLayer10128.w = _colorLayer10128.w*_layer1_diffuse.w;
    _colorLayer10128.xyz = _colorLayer10128.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10128.w = _colorLayer10128.w*_layer_kOpacities.y;
    _TMP970134 = _colorLayer00128.xyz*(_colorLayer10128.xyz*_colorLayer10128.w + vec3(1.00000000E+000 - _colorLayer10128.w, 1.00000000E+000 - _colorLayer10128.w, 1.00000000E+000 - _colorLayer10128.w));
    _TMP133 = vec4(_TMP970134.x, _TMP970134.y, _TMP970134.z, _colorLayer00128.w);
    _TMP5 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0136 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _TMP14 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP6 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP15);
    _TMP36 = _TMP7*_vs_lightPosition0.w;
    _TMP14 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP8 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP8));
    _TMP9 = float(_TMP15);
    _TMP37 = _TMP9*_vs_lightPosition1.w;
    _diffuseLight0151 = _TMP36*_vs_lightColor0.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _TMP37*_vs_lightColor1.xyz;
    _i0155 = -_averageLightDir.xyz;
    _TMP14 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_i0155.x), float(_i0155.y), float(_i0155.z)));
    _TMP19 = float(_TMP14);
    _R20153 = _i0155 - (2.00000000E+000*_TMP33)*_TMP19;
    _TMP14 = dot(vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)), vec3(float(_R20153.x), float(_R20153.y), float(_R20153.z)));
    _TMP16 = float(_TMP14);
    _TMP15 = max(0.00000000E+000, float(_TMP16));
    _TMP17 = float(_TMP15);
    _TMP20 = pow(float(_TMP17), float(_specular_params.x));
    _TMP18 = float(_TMP20);
    _specularPhong0153 = _averageLightColor.xyz*_TMP18;
    _TMP10 = _specularPhong0153*_specular_params.y;
    _diffuseLight0151 = _diffuseLight0151 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0151);
    _specularLight0167 = _TMP10*_result0136.xyz;
    _TMP960167 = _TMP133.xyz*_diffuseLight0151 + _specularLight0167;
    _TMP0 = vec4(_TMP960167.x, _TMP960167.y, _TMP960167.z, _TMP133.w);
    _TMP24._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0168 = float(_input1._texcoord3);
    _b0170 = vec3(float(_TMP24._color[0].x), float(_TMP24._color[0].y), float(_TMP24._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0168*(_b0170 - _fog_color.xyz);
    _TMP24._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP24._color[0];
    return;
} 
