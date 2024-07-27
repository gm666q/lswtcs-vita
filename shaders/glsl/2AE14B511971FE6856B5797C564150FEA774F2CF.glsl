//C:\sagadata\SharedShaders/0x56170470.ios_pcode ukjbell Wed Nov 13 18:09:04 2013

precision lowp float;

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
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP15;
vec3 _TMP7;
vec4 _TMP0;
float _TMP26;
float _TMP25;
float _TMP6;
float _TMP5;
float _TMP11;
vec3 _TMP24;
float _TMP10;
float _TMP4;
float _TMP3;
vec4 _TMP2;
vec3 _TMP1;
float _TMP9;
float _TMP8;
VertexOutput _input1;
vec4 _colorLayer00100;
vec3 _diffuseLight0115;
vec3 _TMP820119;
float _falloff0120;
vec3 _b0122;
float _c0123;
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
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP8 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP9 = inversesqrt(_TMP8);
    _TMP1 = _TMP9*cg_TexCoord0.xyz;
    _TMP24 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord1.xy);
    _colorLayer00100 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00100.w = _colorLayer00100.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00100 = _colorLayer00100*_input1._varying_colorSet0;
    _TMP10 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP3 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP3));
    _TMP4 = float(_TMP11);
    _TMP25 = _TMP4*_vs_lightPosition0.w;
    _TMP10 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP5 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP11);
    _TMP26 = _TMP6*_vs_lightPosition1.w;
    _diffuseLight0115 = _TMP25*_vs_lightColor0.xyz;
    _diffuseLight0115 = _diffuseLight0115 + _TMP26*_vs_lightColor1.xyz;
    _diffuseLight0115 = _diffuseLight0115 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0115 = _diffuseLight0115 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0115);
    _TMP820119 = _colorLayer00100.xyz*_diffuseLight0115;
    _TMP0 = vec4(_TMP820119.x, _TMP820119.y, _TMP820119.z, _colorLayer00100.w);
    _TMP15._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0120 = float(_input1._texcoord2);
    _b0122 = vec3(float(_TMP15._color[0].x), float(_TMP15._color[0].y), float(_TMP15._color[0].z));
    _TMP7 = _fog_color.xyz + _falloff0120*(_b0122 - _fog_color.xyz);
    _TMP15._color[0].xyz = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    _c0123 = _TMP15._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0123 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP15._color[0];
    return;
} 
