//SharedShaders/0x262f29d6.ios_pcode uklgonzale Wed Mar 12 20:16:18 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    float _texcoord0;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP5;
vec3 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00072;
vec4 _colorLayer10072;
vec4 _TMP73;
vec3 _TMP640074;
float _falloff0078;
vec3 _b0080;
uniform vec4 _fog_color;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
varying vec4 cg_FrontColor;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord0 = cg_TexCoord0.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00072.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _colorLayer10072.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10072.w = _layer1_diffuse.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP640074 = _input1._varying_colorSet0.xyz*(1.00000000E+000 - _colorLayer10072.w) + _colorLayer10072.xyz*_colorLayer10072.w;
    _TMP73 = vec4(_TMP640074.x, _TMP640074.y, _TMP640074.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00072.w)*(1.00000000E+000 - _colorLayer10072.w));
    _TMP5._color[0] = vec4(float(_TMP73.x), float(_TMP73.y), float(_TMP73.z), float(_TMP73.w));
    _falloff0078 = float(_input1._texcoord0);
    _b0080 = vec3(float(_TMP5._color[0].x), float(_TMP5._color[0].y), float(_TMP5._color[0].z));
    _TMP1 = _fog_color.xyz + _falloff0078*(_b0080 - _fog_color.xyz);
    _TMP5._color[0].xyz = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    cg_FragColor = _TMP5._color[0];
    return;
} 
