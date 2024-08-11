//SharedShaders/0x4444e784.ios_pcode uklgonzale Wed Mar 12 17:37:57 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP8;
vec3 _TMP4;
vec3 _TMP1;
vec4 _TMP3;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00084;
vec4 _colorLayer10084;
vec4 _TMP87;
vec3 _TMP760088;
vec4 _result0090;
vec4 _envTexel0095;
float _falloff0098;
vec3 _b0100;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00084 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00084.w = _colorLayer00084.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00084 = _colorLayer00084*_input1._varying_colorSet0;
    _colorLayer10084.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10084.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP760088 = _colorLayer00084.xyz*(1.00000000E+000 - _colorLayer10084.w) + _colorLayer10084.xyz*_colorLayer10084.w;
    _TMP87 = vec4(_TMP760088.x, _TMP760088.y, _TMP760088.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00084.w)*(1.00000000E+000 - _colorLayer10084.w));
    _result0090 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP8._color[0] = vec4(float(_TMP87.x), float(_TMP87.y), float(_TMP87.z), float(_TMP87.w));
    _TMP3 = texture(_ps2_shinemap_sampler, cg_TexCoord1.xy);
    _envTexel0095 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _TMP1 = _envTexel0095.xyz*_specular_params.y;
    _TMP8._color[0].xyz = _TMP8._color[0].xyz + vec3(float((_result0090.xyz*_TMP1).x), float((_result0090.xyz*_TMP1).y), float((_result0090.xyz*_TMP1).z));
    _falloff0098 = float(_input1._texcoord2);
    _b0100 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0098*(_b0100 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
