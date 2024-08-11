//C:\sagadata\SharedShaders/0xd1a95ecd.ios_pcode ukjbell Wed Nov 13 18:12:20 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
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

FragmentOutput _TMP9;
vec3 _TMP5;
vec3 _TMP1;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00076;
vec4 _result0080;
vec4 _envTexel0087;
float _falloff0090;
vec3 _b0092;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _specular_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _specular_sampler;
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00076 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00076.w = _colorLayer00076.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00076 = _colorLayer00076*_input1._varying_colorSet0;
    _TMP3 = texture(_specular_sampler, cg_TexCoord0.xy);
    _result0080 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _TMP9._color[0] = vec4(float(_colorLayer00076.x), float(_colorLayer00076.y), float(_colorLayer00076.z), float(_colorLayer00076.w));
    _TMP4 = texture(_ps2_shinemap_sampler, cg_TexCoord1.xy);
    _envTexel0087 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP1 = _envTexel0087.xyz*_specular_params.y;
    _TMP9._color[0].xyz = _TMP9._color[0].xyz + vec3(float((_result0080.xyz*_TMP1).x), float((_result0080.xyz*_TMP1).y), float((_result0080.xyz*_TMP1).z));
    _falloff0090 = float(_input1._texcoord2);
    _b0092 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0090*(_b0092 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
