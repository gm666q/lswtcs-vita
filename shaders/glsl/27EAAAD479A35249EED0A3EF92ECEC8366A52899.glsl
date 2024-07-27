//C:\sagadata\SharedShaders/0x1989cf2d.ios_pcode ukjbell Wed Nov 13 18:09:30 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec2 _uvSet0;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP8;
vec3 _TMP4;
vec4 _TMP0;
vec4 _TMP3;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00076;
vec3 _diffuseLight0083;
vec3 _lightmapCol0083;
vec3 _TMP700087;
float _falloff0088;
vec3 _b0090;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00076 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00076.w = _colorLayer00076.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00076 = _colorLayer00076*_input1._varying_colorSet0;
    _TMP3 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0083 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _diffuseLight0083 = _lightmapCol0083;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0083 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP700087 = _colorLayer00076.xyz*_diffuseLight0083;
    _TMP0 = vec4(_TMP700087.x, _TMP700087.y, _TMP700087.z, _colorLayer00076.w);
    _TMP8._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0088 = float(_input1._texcoord2);
    _b0090 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0088*(_b0090 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
