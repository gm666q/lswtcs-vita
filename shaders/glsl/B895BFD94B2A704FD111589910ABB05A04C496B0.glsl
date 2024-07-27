//C:\sagadata\SharedShaders/0x87b76ff3.ios_pcode ukjbell Wed Nov 13 18:08:25 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
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
vec4 _colorLayer00091;
vec4 _colorLayer10091;
vec4 _colorLayer20091;
vec4 _TMP96;
vec3 _TMP810097;
vec4 _TMP100;
vec3 _TMP810101;
float _falloff0109;
vec3 _b0111;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying mediump vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00091 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00091.w = _colorLayer00091.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00091 = _colorLayer00091*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10091 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10091.w = _colorLayer10091.w*_layer1_diffuse.w;
    _colorLayer10091.xyz = _colorLayer10091.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10091.w = _colorLayer10091.w*_layer_kOpacities.y;
    _TMP810097 = _colorLayer00091.xyz*(1.00000000E+000 - _colorLayer10091.w) + _colorLayer10091.xyz*_colorLayer10091.w;
    _TMP96 = vec4(_TMP810097.x, _TMP810097.y, _TMP810097.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00091.w)*(1.00000000E+000 - _colorLayer10091.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20091 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20091.w = _colorLayer20091.w*_layer2_diffuse.w;
    _colorLayer20091.xyz = _colorLayer20091.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20091.w = _colorLayer20091.w*_layer_kOpacities.z;
    _TMP810101 = _TMP96.xyz*(1.00000000E+000 - _colorLayer20091.w) + _colorLayer20091.xyz*_colorLayer20091.w;
    _TMP100 = vec4(_TMP810101.x, _TMP810101.y, _TMP810101.z, 1.00000000E+000 - (1.00000000E+000 - _TMP96.w)*(1.00000000E+000 - _colorLayer20091.w));
    _TMP9._color[0] = vec4(float(_TMP100.x), float(_TMP100.y), float(_TMP100.z), float(_TMP100.w));
    _falloff0109 = float(_input1._texcoord3);
    _b0111 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0109*(_b0111 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
