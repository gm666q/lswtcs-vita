//SharedShaders/0x429ecf0e.ios_pcode uklgonzale Wed Mar 12 15:12:51 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP7;
vec3 _TMP3;
vec3 _TMP1;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00072;
vec4 _result0074;
vec4 _envTexel0079;
float _falloff0082;
vec3 _b0084;
float _c0085;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform vec2 _alphaTestParameters;
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00072.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _result0074 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP7._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00072.w));
    _TMP2 = texture(_ps2_shinemap_sampler, cg_TexCoord0.xy);
    _envTexel0079 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _TMP1 = _envTexel0079.xyz*_envmap_params.y*2.00000000E+000;
    _TMP7._color[0].xyz = _TMP7._color[0].xyz + vec3(float((_result0074.xyz*_TMP1).x), float((_result0074.xyz*_TMP1).y), float((_result0074.xyz*_TMP1).z));
    _falloff0082 = float(_input1._texcoord1);
    _b0084 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0082*(_b0084 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _c0085 = _TMP7._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0085 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP7._color[0];
    return;
} 
