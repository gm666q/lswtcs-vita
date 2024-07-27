//SharedShaders/0x22a10e06.ios_pcode uklgonzale Wed Mar 12 14:48:14 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP8;
vec3 _TMP4;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00081;
vec4 _colorLayer10081;
vec4 _TMP86;
vec3 _TMP730087;
float _falloff0095;
vec3 _b0097;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00081 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00081.w = _colorLayer00081.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00081 = _colorLayer00081*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord0.xy);
    _colorLayer10081 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10081.w = _colorLayer10081.w*_layer1_diffuse.w;
    _colorLayer10081.xyz = _colorLayer10081.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10081.w = _colorLayer10081.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP730087 = _colorLayer00081.xyz*(1.00000000E+000 - _colorLayer10081.w) + _colorLayer10081.xyz*_colorLayer10081.w;
    _TMP86 = vec4(_TMP730087.x, _TMP730087.y, _TMP730087.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00081.w)*(1.00000000E+000 - _colorLayer10081.w));
    _TMP8._color[0] = vec4(float(_TMP86.x), float(_TMP86.y), float(_TMP86.z), float(_TMP86.w));
    _falloff0095 = float(_input1._texcoord1);
    _b0097 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0095*(_b0097 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
