//SharedShaders/0x32751c0d.ios_pcode uklgonzale Wed Mar 12 20:28:17 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
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
vec3 _TMP1;
vec4 _TMP3;
vec4 _TMP0;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00076;
vec4 _result0078;
vec3 _diffuseLight0079;
vec3 _lightmapCol0079;
vec3 _TMP690083;
vec4 _envTexel0085;
float _falloff0088;
vec3 _b0090;
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform sampler2D _ps2_shinemap_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _colorLayer00076.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _result0078 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP2 = texture(_lightmap0, cg_TexCoord0.xy);
    _lightmapCol0079 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _diffuseLight0079 = _lightmapCol0079;
    if (cg_TexCoord0.x <= 0.00000000E+000) {         _diffuseLight0079 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP690083 = _input1._varying_colorSet0.xyz*_diffuseLight0079;
    _TMP0 = vec4(_TMP690083.x, _TMP690083.y, _TMP690083.z, _colorLayer00076.w);
    _TMP8._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP3 = texture(_ps2_shinemap_sampler, cg_TexCoord1.xy);
    _envTexel0085 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _TMP1 = (_envTexel0085.xyz*_specular_params.y)*_diffuseLight0079;
    _TMP8._color[0].xyz = _TMP8._color[0].xyz + vec3(float((_result0078.xyz*_TMP1).x), float((_result0078.xyz*_TMP1).y), float((_result0078.xyz*_TMP1).z));
    _falloff0088 = float(_input1._texcoord2);
    _b0090 = vec3(float(_TMP8._color[0].x), float(_TMP8._color[0].y), float(_TMP8._color[0].z));
    _TMP4 = _fog_color.xyz + _falloff0088*(_b0090 - _fog_color.xyz);
    _TMP8._color[0].xyz = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    cg_FragColor = _TMP8._color[0];
    return;
} 
