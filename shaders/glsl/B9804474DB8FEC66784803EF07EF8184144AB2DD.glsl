//C:\sagadata\SharedShaders/0xb7a9cc42.ios_pcode ukjbell Wed Nov 13 18:16:01 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
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
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00085;
vec4 _colorLayer10085;
vec4 _TMP88;
vec3 _TMP770089;
vec3 _diffuseLight0094;
vec3 _lightmapCol0094;
vec3 _TMP730098;
float _falloff0099;
vec3 _b0101;
uniform vec4 _fog_color;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer1_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00085.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _TMP1 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10085 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer10085.w = _colorLayer10085.w*_layer1_diffuse.w;
    _colorLayer10085.xyz = _colorLayer10085.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10085.w = _colorLayer10085.w*_layer_kOpacities.y;
    _TMP770089 = _input1._varying_colorSet0.xyz*(1.00000000E+000 - _colorLayer10085.w) + _colorLayer10085.xyz*_colorLayer10085.w;
    _TMP88 = vec4(_TMP770089.x, _TMP770089.y, _TMP770089.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00085.w)*(1.00000000E+000 - _colorLayer10085.w));
    _TMP3 = texture(_lightmap0, cg_TexCoord2.xy);
    _lightmapCol0094 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _diffuseLight0094 = _lightmapCol0094;
    if (cg_TexCoord2.x <= 0.00000000E+000) {         _diffuseLight0094 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP730098 = _TMP88.xyz*_diffuseLight0094;
    _TMP0 = vec4(_TMP730098.x, _TMP730098.y, _TMP730098.z, _TMP88.w);
    _TMP8._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0099 = float(_input1._texcoord3);
    _b0101 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0099*(_b0101 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
