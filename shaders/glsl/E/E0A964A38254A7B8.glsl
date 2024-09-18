//SharedShaders/0x4903c654.ios_pcode uklgonzale Wed Mar 12 20:14:14 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP9;
vec3 _TMP5;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00089;
vec4 _colorLayer10089;
vec4 _colorLayer20089;
vec4 _TMP94;
vec3 _TMP790095;
vec4 _TMP98;
vec3 _TMP790099;
float _falloff0107;
vec3 _b0109;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00089 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00089.w = _colorLayer00089.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00089 = _colorLayer00089*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10089 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10089.w = _colorLayer10089.w*_layer1_diffuse.w;
    _colorLayer10089.xyz = _colorLayer10089.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10089.w = _colorLayer10089.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP790095 = _colorLayer00089.xyz*(1.00000000E+000 - _colorLayer10089.w) + _colorLayer10089.xyz*_colorLayer10089.w;
    _TMP94 = vec4(_TMP790095.x, _TMP790095.y, _TMP790095.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00089.w)*(1.00000000E+000 - _colorLayer10089.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord0.xy);
    _colorLayer20089 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20089.w = _colorLayer20089.w*_layer2_diffuse.w;
    _colorLayer20089.xyz = _colorLayer20089.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20089.w = _colorLayer20089.w*_layer_kOpacities.z;
    _TMP790099 = _TMP94.xyz*(1.00000000E+000 - _colorLayer20089.w) + _colorLayer20089.xyz*_colorLayer20089.w;
    _TMP98 = vec4(_TMP790099.x, _TMP790099.y, _TMP790099.z, 1.00000000E+000 - (1.00000000E+000 - _TMP94.w)*(1.00000000E+000 - _colorLayer20089.w));
    _TMP9._color[0] = vec4(float(_TMP98.x), float(_TMP98.y), float(_TMP98.z), float(_TMP98.w));
    _falloff0107 = float(_input1._texcoord2);
    _b0109 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0107*(_b0109 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
