//SharedShaders/0x51c81c3e.ios_pcode uklgonzale Wed Mar 12 16:55:51 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP6;
vec3 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00072;
float _falloff0080;
vec3 _b0082;
float _c0083;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00072 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00072.w = _colorLayer00072.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00072 = _colorLayer00072*_input1._varying_colorSet0;
    _TMP6._color[0] = vec4(float(_colorLayer00072.x), float(_colorLayer00072.y), float(_colorLayer00072.z), float(_colorLayer00072.w));
    _falloff0080 = float(_input1._texcoord1);
    _b0082 = vec3(float(_TMP6._color[0].x), float(_TMP6._color[0].y), float(_TMP6._color[0].z));
    _TMP2 = _fog_color.xyz + _falloff0080*(_b0082 - _fog_color.xyz);
    _TMP6._color[0].xyz = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _c0083 = _TMP6._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0083 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP6._color[0];
    return;
} 
