//SharedShaders/0x00b65b0f.ios_pcode uklgonzale Wed Mar 12 18:47:26 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
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

FragmentOutput _TMP9;
vec3 _TMP5;
vec4 _TMP0;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00090;
vec4 _colorLayer10090;
vec4 _colorLayer20090;
vec4 _TMP95;
vec3 _TMP800096;
vec4 _TMP99;
vec3 _TMP800100;
vec3 _diffuseLight0101;
vec3 _lightmapCol0101;
vec3 _TMP760105;
float _falloff0106;
vec3 _b0108;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
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
    _colorLayer00090 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00090.w = _colorLayer00090.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00090 = _colorLayer00090*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord0.xy);
    _colorLayer10090 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10090.w = _colorLayer10090.w*_layer1_diffuse.w;
    _colorLayer10090.xyz = _colorLayer10090.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10090.w = _colorLayer10090.w*_layer_kOpacities.y;
    _TMP800096 = _colorLayer00090.xyz*(1.00000000E+000 - _colorLayer10090.w) + _colorLayer10090.xyz*_colorLayer10090.w;
    _TMP95 = vec4(_TMP800096.x, _TMP800096.y, _TMP800096.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00090.w)*(1.00000000E+000 - _colorLayer10090.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord0.xy);
    _colorLayer20090 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20090.w = _colorLayer20090.w*_layer2_diffuse.w;
    _colorLayer20090.xyz = _colorLayer20090.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20090.w = _colorLayer20090.w*_layer_kOpacities.z;
    _TMP800100 = _TMP95.xyz*(1.00000000E+000 - _colorLayer20090.w) + _colorLayer20090.xyz*_colorLayer20090.w;
    _TMP99 = vec4(_TMP800100.x, _TMP800100.y, _TMP800100.z, 1.00000000E+000 - (1.00000000E+000 - _TMP95.w)*(1.00000000E+000 - _colorLayer20090.w));
    _TMP4 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0101 = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    _diffuseLight0101 = _lightmapCol0101;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0101 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP760105 = _TMP99.xyz*_diffuseLight0101;
    _TMP0 = vec4(_TMP760105.x, _TMP760105.y, _TMP760105.z, _TMP99.w);
    _TMP9._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0106 = float(_input1._texcoord2);
    _b0108 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0106*(_b0108 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
