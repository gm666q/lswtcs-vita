//SharedShaders/0x5498eafb.ios_pcode uklgonzale Wed Mar 12 19:47:42 2014

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

FragmentOutput _TMP7;
vec3 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00079;
vec4 _colorLayer10079;
vec4 _TMP84;
vec3 _TMP710085;
float _falloff0089;
vec3 _b0091;
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
    _colorLayer00079 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00079.w = _colorLayer00079.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00079 = _colorLayer00079*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord0.xy);
    _colorLayer10079 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10079.w = _colorLayer10079.w*_layer1_diffuse.w;
    _colorLayer10079.xyz = _colorLayer10079.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10079.w = _colorLayer10079.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP710085 = _colorLayer00079.xyz*(1.00000000E+000 - _colorLayer10079.w) + _colorLayer10079.xyz*_colorLayer10079.w;
    _TMP84 = vec4(_TMP710085.x, _TMP710085.y, _TMP710085.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00079.w)*(1.00000000E+000 - _colorLayer10079.w));
    _TMP7._color[0] = vec4(float(_TMP84.x), float(_TMP84.y), float(_TMP84.z), float(_TMP84.w));
    _falloff0089 = float(_input1._texcoord1);
    _b0091 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0089*(_b0091 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
