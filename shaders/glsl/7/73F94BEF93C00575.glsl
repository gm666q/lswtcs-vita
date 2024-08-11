//SharedShaders/0x15305724.ios_pcode uklgonzale Tue Mar 11 16:25:14 2014

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
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP14;
vec3 _TMP6;
vec4 _TMP0;
float _TMP24;
float _TMP23;
float _TMP5;
float _TMP4;
float _TMP10;
vec3 _TMP22;
float _TMP9;
float _TMP3;
float _TMP2;
vec3 _TMP1;
float _TMP8;
float _TMP7;
VertexOutput _input1;
vec4 _colorLayer00095;
vec3 _diffuseLight0108;
vec3 _TMP770112;
float _falloff0113;
vec3 _b0115;
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
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP7 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP8 = inversesqrt(_TMP7);
    _TMP1 = _TMP8*cg_TexCoord0.xyz;
    _TMP22 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _colorLayer00095 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00095.w = _colorLayer00095.w*_layer_kOpacities.x;
    _TMP9 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z)));
    _TMP2 = float(_TMP9);
    _TMP10 = max(0.00000000E+000, float(_TMP2));
    _TMP3 = float(_TMP10);
    _TMP23 = _TMP3*_vs_lightPosition0.w;
    _TMP9 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z)));
    _TMP4 = float(_TMP9);
    _TMP10 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP10);
    _TMP24 = _TMP5*_vs_lightPosition1.w;
    _diffuseLight0108 = _TMP23*_vs_lightColor0.xyz;
    _diffuseLight0108 = _diffuseLight0108 + _TMP24*_vs_lightColor1.xyz;
    _diffuseLight0108 = _diffuseLight0108 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0108 = _diffuseLight0108 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0108);
    _TMP770112 = _colorLayer00095.xyz*_diffuseLight0108;
    _TMP0 = vec4(_TMP770112.x, _TMP770112.y, _TMP770112.z, _colorLayer00095.w);
    _TMP14._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0113 = float(_input1._texcoord1);
    _b0115 = vec3(float(_TMP14._color[0].x), float(_TMP14._color[0].y), float(_TMP14._color[0].z));
    _TMP6 = _fog_color.xyz + _falloff0113*(_b0115 - _fog_color.xyz);
    _TMP14._color[0].xyz = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    cg_FragColor = _TMP14._color[0];
    return;
} 
