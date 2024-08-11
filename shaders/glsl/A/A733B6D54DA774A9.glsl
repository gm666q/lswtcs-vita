//SharedShaders/0x662b20df.ios_pcode uklgonzale Wed Mar 12 20:12:06 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet0;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP7;
vec3 _TMP3;
vec4 _TMP0;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00082;
vec4 _colorLayer10082;
vec4 _TMP85;
vec3 _TMP740086;
vec3 _diffuseLight0087;
vec3 _lightmapCol0087;
vec3 _TMP700091;
float _falloff0092;
vec3 _b0094;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00082 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00082.w = _colorLayer00082.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00082 = _colorLayer00082*_input1._varying_colorSet0;
    _colorLayer10082.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10082.w = _layer1_diffuse.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP740086 = _colorLayer00082.xyz*(1.00000000E+000 - _colorLayer10082.w) + _colorLayer10082.xyz*_colorLayer10082.w;
    _TMP85 = vec4(_TMP740086.x, _TMP740086.y, _TMP740086.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00082.w)*(1.00000000E+000 - _colorLayer10082.w));
    _TMP2 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0087 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _diffuseLight0087 = _lightmapCol0087;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0087 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP700091 = _TMP85.xyz*_diffuseLight0087;
    _TMP0 = vec4(_TMP700091.x, _TMP700091.y, _TMP700091.z, _TMP85.w);
    _TMP7._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0092 = float(_input1._texcoord2);
    _b0094 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0092*(_b0094 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
