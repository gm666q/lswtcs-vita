//C:\sagadata\SharedShaders/0x3572582c.ios_pcode ukjbell Wed Nov 13 18:10:02 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec4 _blendWeight0;
    vec4 _blendIndices0;
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
float _TMP25;
float _TMP24;
float _TMP5;
float _TMP4;
float _TMP10;
vec3 _TMP23;
float _TMP9;
float _TMP3;
float _TMP2;
vec3 _TMP1;
float _TMP8;
float _TMP7;
VertexOutput _input1;
vec4 _colorLayer00096;
vec3 _diffuseLight0109;
vec3 _TMP780113;
float _falloff0114;
vec3 _b0116;
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
    _TMP23 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _colorLayer00096 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00096.w = _colorLayer00096.w*_layer_kOpacities.x;
    _TMP9 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP23.x), float(_TMP23.y), float(_TMP23.z)));
    _TMP2 = float(_TMP9);
    _TMP10 = max(0.00000000E+000, float(_TMP2));
    _TMP3 = float(_TMP10);
    _TMP24 = _TMP3*_vs_lightPosition0.w;
    _TMP9 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP23.x), float(_TMP23.y), float(_TMP23.z)));
    _TMP4 = float(_TMP9);
    _TMP10 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP10);
    _TMP25 = _TMP5*_vs_lightPosition1.w;
    _diffuseLight0109 = _TMP24*_vs_lightColor0.xyz;
    _diffuseLight0109 = _diffuseLight0109 + _TMP25*_vs_lightColor1.xyz;
    _diffuseLight0109 = _diffuseLight0109 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0109 = _diffuseLight0109 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0109);
    _TMP780113 = _colorLayer00096.xyz*_diffuseLight0109;
    _TMP0 = vec4(_TMP780113.x, _TMP780113.y, _TMP780113.z, _colorLayer00096.w);
    _TMP14._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0114 = float(_input1._texcoord1);
    _b0116 = vec3(float(_TMP14._color[0].x), float(_TMP14._color[0].y), float(_TMP14._color[0].z));
    _TMP6 = _fog_color.xyz + _falloff0114*(_b0116 - _fog_color.xyz);
    _TMP14._color[0].xyz = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    cg_FragColor = _TMP14._color[0];
    return;
} 
