//C:\sagadata\SharedShaders/0xc92393d0.ios_pcode ukjbell Wed Nov 13 18:13:09 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP10;
vec3 _TMP6;
vec3 _TMP1;
vec4 _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00088;
vec4 _colorLayer10088;
vec4 _TMP93;
vec3 _TMP790094;
vec4 _result0096;
vec4 _envTexel0103;
float _falloff0106;
vec3 _b0108;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00088 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00088.w = _colorLayer00088.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00088 = _colorLayer00088*_input1._varying_colorSet0;
    _TMP3 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10088 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer10088.w = _colorLayer10088.w*_layer1_diffuse.w;
    _colorLayer10088.xyz = _colorLayer10088.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10088.w = _colorLayer10088.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP790094 = _colorLayer00088.xyz + _colorLayer10088.xyz*_colorLayer10088.w;
    _TMP93 = vec4(_TMP790094.x, _TMP790094.y, _TMP790094.z, _colorLayer00088.w);
    _TMP4 = texture(_specular_sampler, cg_TexCoord0.xy);
    _result0096 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP10._color[0] = vec4(float(_TMP93.x), float(_TMP93.y), float(_TMP93.z), float(_TMP93.w));
    _TMP5 = texture(_ps2_shinemap_sampler, cg_TexCoord2.xy);
    _envTexel0103 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _TMP1 = _envTexel0103.xyz*_envmap_params.y*2.00000000E+000;
    _TMP10._color[0].xyz = _TMP10._color[0].xyz + vec3(float((_result0096.xyz*_TMP1).x), float((_result0096.xyz*_TMP1).y), float((_result0096.xyz*_TMP1).z));
    _falloff0106 = float(_input1._texcoord3);
    _b0108 = vec3(float(_TMP10._color[0].x), float(_TMP10._color[0].y), float(_TMP10._color[0].z));
    _TMP6 = _fog_color.xyz + _falloff0106*(_b0108 - _fog_color.xyz);
    _TMP10._color[0].xyz = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    cg_FragColor = _TMP10._color[0];
    return;
} 
