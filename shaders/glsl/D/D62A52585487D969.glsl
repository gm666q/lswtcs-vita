//SharedShaders/0x6fffd899.ios_pcode uklgonzale Wed Mar 12 14:34:22 2014

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
vec4 _colorLayer00071;
vec3 _diffuseLight0074;
vec3 _lightmapCol0074;
vec3 _TMP640078;
float _falloff0079;
vec3 _b0081;
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
    _colorLayer00071.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP1 = texture(_lightmap0, cg_TexCoord0.xy);
    _lightmapCol0074 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _diffuseLight0074 = _lightmapCol0074;
    if (cg_TexCoord0.x <= 0.00000000E+000) {         _diffuseLight0074 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP640078 = _input1._varying_colorSet0.xyz*_diffuseLight0074;
    _TMP0 = vec4(_TMP640078.x, _TMP640078.y, _TMP640078.z, _colorLayer00071.w);
    _TMP6._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0079 = float(_input1._texcoord1);
    _b0081 = vec3(float(_TMP6._color[0].x), float(_TMP6._color[0].y), float(_TMP6._color[0].z));
    _TMP2 = _fog_color.xyz + _falloff0079*(_b0081 - _fog_color.xyz);
    _TMP6._color[0].xyz = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    cg_FragColor = _TMP6._color[0];
    return;
} 
