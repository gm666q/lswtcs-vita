//C:\sagadata\SharedShaders/0xe0b3c963.ios_pcode ukjbell Wed Nov 13 18:11:27 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP7;
vec3 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00083;
vec4 _colorLayer10083;
vec4 _TMP88;
vec3 _TMP750089;
float _falloff0095;
vec3 _b0097;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00083 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00083.w = _colorLayer00083.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00083 = _colorLayer00083*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10083 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10083.w = _colorLayer10083.w*_layer1_diffuse.w;
    _colorLayer10083.xyz = _colorLayer10083.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10083.w = _colorLayer10083.w*_layer_kOpacities.y;
    _TMP750089 = _colorLayer00083.xyz*(1.00000000E+000 - _colorLayer10083.w) + _colorLayer10083.xyz*_colorLayer10083.w;
    _TMP88 = vec4(_TMP750089.x, _TMP750089.y, _TMP750089.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00083.w)*(1.00000000E+000 - _colorLayer10083.w));
    _TMP7._color[0] = vec4(float(_TMP88.x), float(_TMP88.y), float(_TMP88.z), float(_TMP88.w));
    _falloff0095 = float(_input1._texcoord2);
    _b0097 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0095*(_b0097 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
