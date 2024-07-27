//C:\sagadata\SharedShaders/0xd33f7145.ios_pcode ukjbell Wed Nov 13 18:11:36 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
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
vec4 _colorLayer00071;
vec4 _result0073;
vec4 _envTexel0078;
float _falloff0081;
vec3 _b0083;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00071.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _result0073 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP7._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00071.w));
    _TMP2 = texture(_ps2_shinemap_sampler, cg_TexCoord0.xy);
    _envTexel0078 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _TMP1 = _envTexel0078.xyz*_envmap_params.y*2.00000000E+000;
    _TMP7._color[0].xyz = _TMP7._color[0].xyz + vec3(float((_result0073.xyz*_TMP1).x), float((_result0073.xyz*_TMP1).y), float((_result0073.xyz*_TMP1).z));
    _falloff0081 = float(_input1._texcoord1);
    _b0083 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0081*(_b0083 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
