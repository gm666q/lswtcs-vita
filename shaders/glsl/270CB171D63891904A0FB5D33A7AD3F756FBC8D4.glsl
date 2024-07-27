//SharedShaders/0x18f84d8a.ios_pcode uklgonzale Wed Mar 12 14:37:36 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    float _texcoord0;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP5;
vec3 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00066;
float _falloff0072;
vec3 _b0074;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord0 = cg_TexCoord0.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00066.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP5._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00066.w));
    _falloff0072 = float(_input1._texcoord0);
    _b0074 = vec3(float(_TMP5._color[0].x), float(_TMP5._color[0].y), float(_TMP5._color[0].z));
    _TMP1 = _fog_color.xyz + _falloff0072*(_b0074 - _fog_color.xyz);
    _TMP5._color[0].xyz = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    cg_FragColor = _TMP5._color[0];
    return;
} 
