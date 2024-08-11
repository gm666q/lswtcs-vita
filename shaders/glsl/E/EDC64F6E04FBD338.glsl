//SharedShaders/0x11aca2d5.ios_pcode uklgonzale Wed Mar 12 17:42:12 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec2 _uvSet2;
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
vec4 _colorLayer00077;
vec4 _colorLayer10077;
vec4 _TMP78;
vec3 _TMP690079;
vec3 _diffuseLight0080;
vec3 _lightmapCol0080;
vec3 _TMP650084;
float _falloff0085;
vec3 _b0087;
uniform vec4 _fog_color;
uniform vec4 _layer1_diffuse;
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
    _colorLayer00077.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _colorLayer10077.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10077.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP690079 = _input1._varying_colorSet0.xyz*(1.00000000E+000 - _colorLayer10077.w) + _colorLayer10077.xyz*_colorLayer10077.w;
    _TMP78 = vec4(_TMP690079.x, _TMP690079.y, _TMP690079.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00077.w)*(1.00000000E+000 - _colorLayer10077.w));
    _TMP1 = texture(_lightmap0, cg_TexCoord0.xy);
    _lightmapCol0080 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _diffuseLight0080 = _lightmapCol0080;
    if (cg_TexCoord0.x <= 0.00000000E+000) {         _diffuseLight0080 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP650084 = _TMP78.xyz*_diffuseLight0080;
    _TMP0 = vec4(_TMP650084.x, _TMP650084.y, _TMP650084.z, _TMP78.w);
    _TMP6._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0085 = float(_input1._texcoord1);
    _b0087 = vec3(float(_TMP6._color[0].x), float(_TMP6._color[0].y), float(_TMP6._color[0].z));
    _TMP2 = _fog_color.xyz + _falloff0085*(_b0087 - _fog_color.xyz);
    _TMP6._color[0].xyz = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    cg_FragColor = _TMP6._color[0];
    return;
} 
