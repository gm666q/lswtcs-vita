//SharedShaders/0x7ca90ba9.ios_pcode uklgonzale Wed Mar 12 15:29:49 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec2 _uvSet0;
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

FragmentOutput _TMP9;
vec3 _TMP5;
vec3 _TMP1;
vec4 _TMP4;
vec4 _TMP0;
vec4 _TMP3;
vec4 _TMP2;
VertexOutput _input1;
vec4 _colorLayer00081;
vec4 _result0085;
vec3 _diffuseLight0086;
vec3 _lightmapCol0086;
vec3 _TMP740090;
vec4 _envTexel0092;
float _falloff0095;
vec3 _b0097;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
uniform sampler2D _ps2_shinemap_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00081 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00081.w = _colorLayer00081.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00081 = _colorLayer00081*_input1._varying_colorSet0;
    _result0085 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP3 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0086 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _diffuseLight0086 = _lightmapCol0086;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0086 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP740090 = _colorLayer00081.xyz*_diffuseLight0086;
    _TMP0 = vec4(_TMP740090.x, _TMP740090.y, _TMP740090.z, _colorLayer00081.w);
    _TMP9._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP4 = texture(_ps2_shinemap_sampler, cg_TexCoord2.xy);
    _envTexel0092 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP1 = ((_envTexel0092.xyz*_envmap_params.y)*_diffuseLight0086)*2.00000000E+000;
    _TMP9._color[0].xyz = _TMP9._color[0].xyz + vec3(float((_result0085.xyz*_TMP1).x), float((_result0085.xyz*_TMP1).y), float((_result0085.xyz*_TMP1).z));
    _falloff0095 = float(_input1._texcoord3);
    _b0097 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0095*(_b0097 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
