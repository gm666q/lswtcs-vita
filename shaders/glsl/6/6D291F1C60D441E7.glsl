//C:\sagadata\SharedShaders/0x32aa96df.ios_pcode ukjbell Wed Nov 13 18:08:03 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP4;
VertexOutput _input1;
vec4 _colorLayer00058;
uniform vec4 _layer_kOpacities;
varying vec4 cg_FrontColor;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00058.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP4._color[0] = vec4(float(_input1._varying_colorSet0.x), float(_input1._varying_colorSet0.y), float(_input1._varying_colorSet0.z), float(_colorLayer00058.w));
    cg_FragColor = _TMP4._color[0];
    return;
} 
