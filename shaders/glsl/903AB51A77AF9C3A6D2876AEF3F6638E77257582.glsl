//C:\sagadata\SharedShaders/0x05a90ac5.ios_pcode ukjbell Wed Nov 13 18:08:04 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP5;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00063;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00063 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00063.w = _colorLayer00063.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00063 = _colorLayer00063*_input1._varying_colorSet0;
    _TMP5._color[0] = vec4(float(_colorLayer00063.x), float(_colorLayer00063.y), float(_colorLayer00063.z), float(_colorLayer00063.w));
    cg_FragColor = _TMP5._color[0];
    return;
} 
