//SharedShaders/0x3b699a57.ios_pcode uklgonzale Wed Mar 12 18:56:13 2014

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
vec4 _colorLayer00079;
vec3 _diffuseLight0082;
vec3 _lightmapCol0082;
vec3 _TMP730086;
float _falloff0087;
vec3 _b0089;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
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
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00079 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00079.w = _colorLayer00079.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00079 = _colorLayer00079*_input1._varying_colorSet0;
    _TMP2 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0082 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _diffuseLight0082 = _lightmapCol0082;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0082 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP730086 = _colorLayer00079.xyz*_diffuseLight0082;
    _TMP0 = vec4(_TMP730086.x, _TMP730086.y, _TMP730086.z, _colorLayer00079.w);
    _TMP7._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0087 = float(_input1._texcoord2);
    _b0089 = vec3(float(_TMP7._color[0].x), float(_TMP7._color[0].y), float(_TMP7._color[0].z));
    _TMP3 = _fog_color.xyz + _falloff0087*(_b0089 - _fog_color.xyz);
    _TMP7._color[0].xyz = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    cg_FragColor = _TMP7._color[0];
    return;
} 
