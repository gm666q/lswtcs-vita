//C:\sagadata\SharedShaders/0xe5662a8d.ios_pcode ukjbell Wed Nov 13 18:15:28 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP8;
vec3 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00087;
vec4 _colorLayer10087;
vec4 _colorLayer20087;
vec4 _TMP92;
vec3 _TMP770093;
vec4 _TMP96;
vec3 _TMP770097;
float _falloff0101;
vec3 _b0103;
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
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00087 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00087.w = _colorLayer00087.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00087 = _colorLayer00087*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10087 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10087.w = _colorLayer10087.w*_layer1_diffuse.w;
    _colorLayer10087.xyz = _colorLayer10087.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10087.w = _colorLayer10087.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP770093 = _colorLayer00087.xyz*(1.00000000E+000 - _colorLayer10087.w) + _colorLayer10087.xyz*_colorLayer10087.w;
    _TMP92 = vec4(_TMP770093.x, _TMP770093.y, _TMP770093.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00087.w)*(1.00000000E+000 - _colorLayer10087.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord0.xy);
    _colorLayer20087 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20087.w = _colorLayer20087.w*_layer2_diffuse.w;
    _colorLayer20087.xyz = _colorLayer20087.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20087.w = _colorLayer20087.w*_input1._varying_colorSet1.y*_layer_kOpacities.z;
    _TMP770097 = _TMP92.xyz*(1.00000000E+000 - _colorLayer20087.w) + _colorLayer20087.xyz*_colorLayer20087.w;
    _TMP96 = vec4(_TMP770097.x, _TMP770097.y, _TMP770097.z, 1.00000000E+000 - (1.00000000E+000 - _TMP92.w)*(1.00000000E+000 - _colorLayer20087.w));
    _TMP8._color[0] = vec4(float(_TMP96.x), float(_TMP96.y), float(_TMP96.z), float(_TMP96.w));
    _falloff0101 = float(_input1._texcoord2);
    _b0103 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0101*(_b0103 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
