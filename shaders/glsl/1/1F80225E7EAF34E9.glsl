//SharedShaders/0x2ba0f489.ios_pcode uklgonzale Wed Mar 12 14:33:32 2014

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
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP15;
vec3 _TMP7;
vec4 _TMP0;
float _TMP29;
float _TMP28;
float _TMP6;
float _TMP5;
float _TMP11;
vec3 _TMP27;
float _TMP10;
float _TMP4;
float _TMP3;
vec4 _TMP2;
vec3 _TMP1;
float _TMP9;
float _TMP8;
VertexOutput _input1;
vec4 _colorLayer00104;
vec3 _diffuseLight0119;
vec3 _TMP860123;
float _falloff0124;
vec3 _b0126;
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
uniform sampler2D _layer0_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
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
    _TMP27 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord1.xy);
    _colorLayer00104 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00104.w = _colorLayer00104.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00104 = _colorLayer00104*_input1._varying_colorSet0;
    _TMP10 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP3 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP3));
    _TMP4 = float(_TMP11);
    _TMP28 = _TMP4*_vs_lightPosition0.w;
    _TMP10 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP5 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP11);
    _TMP29 = _TMP6*_vs_lightPosition1.w;
    _diffuseLight0119 = _TMP28*_vs_lightColor0.xyz;
    _diffuseLight0119 = _diffuseLight0119 + _TMP29*_vs_lightColor1.xyz;
    _diffuseLight0119 = _diffuseLight0119 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0119 = _diffuseLight0119 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0119);
    _TMP860123 = _colorLayer00104.xyz*_diffuseLight0119;
    _TMP0 = vec4(_TMP860123.x, _TMP860123.y, _TMP860123.z, _colorLayer00104.w);
    _TMP15._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0124 = float(_input1._texcoord2);
    _b0126 = vec3(float(_TMP15._color[0].x), float(_TMP15._color[0].y), float(_TMP15._color[0].z));
    _TMP7 = _fog_color.xyz + _falloff0124*(_b0126 - _fog_color.xyz);
    _TMP15._color[0].xyz = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    cg_FragColor = _TMP15._color[0];
    return;
} 
