//SharedShaders/0x7fb90faa.ios_pcode uklgonzale Wed Mar 12 14:32:12 2014

precision mediump float;
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

FragmentOutput _TMP17;
vec3 _TMP9;
vec3 _TMP1;
vec4 _TMP8;
vec4 _TMP0;
float _TMP28;
float _TMP27;
float _TMP7;
float _TMP6;
float _TMP13;
vec3 _TMP26;
float _TMP12;
float _TMP5;
float _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP11;
float _TMP10;
VertexOutput _input1;
vec4 _colorLayer00105;
vec4 _result0109;
vec3 _diffuseLight0122;
vec3 _TMP860126;
vec4 _envTexel0128;
float _falloff0131;
vec3 _b0133;
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
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
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
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord1.xy);
    _colorLayer00105 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00105.w = _colorLayer00105.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00105 = _colorLayer00105*_input1._varying_colorSet0;
    _result0109 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP12 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP4 = float(_TMP12);
    _TMP13 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP13);
    _TMP27 = _TMP5*_vs_lightPosition0.w;
    _TMP12 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP6 = float(_TMP12);
    _TMP13 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP13);
    _TMP28 = _TMP7*_vs_lightPosition1.w;
    _diffuseLight0122 = _TMP27*_vs_lightColor0.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _TMP28*_vs_lightColor1.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0122);
    _TMP860126 = _colorLayer00105.xyz*_diffuseLight0122;
    _TMP0 = vec4(_TMP860126.x, _TMP860126.y, _TMP860126.z, _colorLayer00105.w);
    _TMP17._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP8 = texture(_ps2_shinemap_sampler, cg_TexCoord2.xy);
    _envTexel0128 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP1 = (_envTexel0128.xyz*_specular_params.y)*_diffuseLight0122;
    _TMP17._color[0].xyz = _TMP17._color[0].xyz + vec3(float((_result0109.xyz*_TMP1).x), float((_result0109.xyz*_TMP1).y), float((_result0109.xyz*_TMP1).z));
    _falloff0131 = float(_input1._texcoord3);
    _b0133 = vec3(float(_TMP17._color[0].x), float(_TMP17._color[0].y), float(_TMP17._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0131*(_b0133 - _fog_color.xyz);
    _TMP17._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    cg_FragColor = _TMP17._color[0];
    return;
} 
