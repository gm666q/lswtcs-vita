//SharedShaders/0x07ec68f1.ios_pcode uklgonzale Wed Mar 12 20:24:19 2014

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
vec4 _colorLayer00065;
float _falloff0069;
vec3 _b0071;
float _c0072;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec2 _alphaTestParameters;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord0 = cg_TexCoord0.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00065.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP5._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00065.w));
    _falloff0069 = float(_input1._texcoord0);
    _b0071 = vec3(float(_TMP5._color[0].x), float(_TMP5._color[0].y), float(_TMP5._color[0].z));
    _TMP1 = _fog_color.xyz + _falloff0069*(_b0071 - _fog_color.xyz);
    _TMP5._color[0].xyz = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _c0072 = _TMP5._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0072 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP5._color[0];
    return;
} 
