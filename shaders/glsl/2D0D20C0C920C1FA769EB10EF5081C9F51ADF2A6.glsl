//C:\sagadata\SharedShaders/0xa525167d.ios_pcode ukjbell Wed Nov 13 18:11:30 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP8;
vec3 _TMP4;
vec4 _TMP0;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00088;
vec4 _colorLayer10088;
vec4 _TMP93;
vec3 _TMP800094;
vec3 _diffuseLight0097;
vec3 _lightmapCol0097;
vec3 _TMP750101;
float _falloff0102;
vec3 _b0104;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00088 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00088.w = _colorLayer00088.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00088 = _colorLayer00088*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10088 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10088.w = _colorLayer10088.w*_layer1_diffuse.w;
    _colorLayer10088.xyz = _colorLayer10088.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10088.w = _colorLayer10088.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP800094 = _colorLayer00088.xyz*(1.00000000E+000 - _colorLayer10088.w) + _colorLayer10088.xyz*_colorLayer10088.w;
    _TMP93 = vec4(_TMP800094.x, _TMP800094.y, _TMP800094.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00088.w)*(1.00000000E+000 - _colorLayer10088.w));
    _TMP3 = texture(_lightmap0, cg_TexCoord2.xy);
    _lightmapCol0097 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _diffuseLight0097 = _lightmapCol0097;
    if (cg_TexCoord2.x <= 0.00000000E+000) {         _diffuseLight0097 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP750101 = _TMP93.xyz*_diffuseLight0097;
    _TMP0 = vec4(_TMP750101.x, _TMP750101.y, _TMP750101.z, _TMP93.w);
    _TMP8._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0102 = float(_input1._texcoord3);
    _b0104 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0102*(_b0104 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 