//SharedShaders/0x0c621939.ios_pcode uklgonzale Wed Mar 12 14:59:07 2014

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
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP7;
vec3 _TMP3;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00084;
vec4 _colorLayer10084;
vec4 _TMP87;
vec3 _TMP760088;
float _falloff0096;
vec3 _b0098;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
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
    _colorLayer00084 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00084.w = _colorLayer00084.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00084 = _colorLayer00084*_input1._varying_colorSet0;
    _colorLayer10084.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10084.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP760088 = _colorLayer00084.xyz*(1.00000000E+000 - _colorLayer10084.w) + _colorLayer10084.xyz*_colorLayer10084.w;
    _TMP87 = vec4(_TMP760088.x, _TMP760088.y, _TMP760088.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00084.w)*(1.00000000E+000 - _colorLayer10084.w));
    _TMP7._color[0] = vec4(float(_TMP87.x), float(_TMP87.y), float(_TMP87.z), float(_TMP87.w));
    _falloff0096 = float(_input1._texcoord1);
    _b0098 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0096*(_b0098 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
