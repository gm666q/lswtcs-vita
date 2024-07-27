//SharedShaders/0x6683334f.ios_pcode uklgonzale Wed Mar 12 20:43:40 2014

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
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP18;
vec3 _TMP10;
vec3 _TMP1;
vec4 _TMP9;
vec4 _TMP0;
float _TMP30;
float _TMP29;
float _TMP8;
float _TMP7;
float _TMP14;
vec3 _TMP27;
float _TMP13;
float _TMP6;
float _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP12;
float _TMP11;
VertexOutput _input1;
vec4 _colorLayer00113;
vec4 _colorLayer10113;
vec4 _TMP116;
vec3 _TMP900117;
vec4 _result0119;
vec3 _diffuseLight0134;
vec3 _TMP890138;
vec4 _envTexel0140;
float _falloff0143;
vec3 _b0145;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _envmap_params;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
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
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord0.xyz;
    _TMP27 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _colorLayer00113 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00113.w = _colorLayer00113.w*_layer_kOpacities.x;
    _TMP3 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10113 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer10113.w = _colorLayer10113.w*_layer1_diffuse.w;
    _colorLayer10113.xyz = _colorLayer10113.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10113.w = _colorLayer10113.w*_layer_kOpacities.y;
    _TMP900117 = _colorLayer00113.xyz*(_colorLayer10113.xyz*_colorLayer10113.w + vec3(1.00000000E+000 - _colorLayer10113.w, 1.00000000E+000 - _colorLayer10113.w, 1.00000000E+000 - _colorLayer10113.w));
    _TMP116 = vec4(_TMP900117.x, _TMP900117.y, _TMP900117.z, _colorLayer00113.w);
    _TMP4 = texture(_specular_sampler, cg_TexCoord1.xy);
    _result0119 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP5 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP14);
    _TMP29 = _TMP6*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP7 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP14);
    _TMP30 = _TMP8*_vs_lightPosition1.w;
    _diffuseLight0134 = _TMP29*_vs_lightColor0.xyz;
    _diffuseLight0134 = _diffuseLight0134 + _TMP30*_vs_lightColor1.xyz;
    _diffuseLight0134 = _diffuseLight0134 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0134 = _diffuseLight0134 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0134);
    _TMP890138 = _TMP116.xyz*_diffuseLight0134;
    _TMP0 = vec4(_TMP890138.x, _TMP890138.y, _TMP890138.z, _TMP116.w);
    _TMP18._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP9 = texture(_ps2_shinemap_sampler, cg_TexCoord2.xy);
    _envTexel0140 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _TMP1 = ((_envTexel0140.xyz*_envmap_params.y)*_diffuseLight0134)*2.00000000E+000;
    _TMP18._color[0].xyz = _TMP18._color[0].xyz + vec3(float((_result0119.xyz*_TMP1).x), float((_result0119.xyz*_TMP1).y), float((_result0119.xyz*_TMP1).z));
    _falloff0143 = float(_input1._texcoord3);
    _b0145 = vec3(float(_TMP18._color[0].x), float(_TMP18._color[0].y), float(_TMP18._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0143*(_b0145 - _fog_color.xyz);
    _TMP18._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP18._color[0];
    return;
} 
