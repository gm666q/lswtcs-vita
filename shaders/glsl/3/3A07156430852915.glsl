//SharedShaders/0x0ed8304c.ios_pcode uklgonzale Wed Mar 12 14:55:50 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
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

FragmentOutput _TMP6;
vec3 _TMP2;
vec4 _TMP0;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00069;
vec3 _diffuseLight0070;
vec3 _lightmapCol0070;
vec3 _TMP630074;
float _falloff0075;
vec3 _b0077;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00069.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP1 = texture(_lightmap0, cg_TexCoord0.xy);
    _lightmapCol0070 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _diffuseLight0070 = _lightmapCol0070;
    if (cg_TexCoord0.x <= 0.00000000E+000) {         _diffuseLight0070 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP630074 = _input1._varying_colorSet0.xyz*_diffuseLight0070;
    _TMP0 = vec4(_TMP630074.x, _TMP630074.y, _TMP630074.z, _colorLayer00069.w);
    _TMP6._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0075 = float(_input1._texcoord1);
    _b0077 = vec3(float(_TMP6._color[0].x), float(_TMP6._color[0].y), float(_TMP6._color[0].z));
    _TMP2 = _fog_color.xyz + _falloff0075*(_b0077 - _fog_color.xyz);
    _TMP6._color[0].xyz = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    cg_FragColor = _TMP6._color[0];
    return;
} 
