//C:\sagadata\SharedShaders/0xf1ad5425.ios_pcode ukjbell Wed Nov 13 18:16:03 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _uvSet23;
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
    vec2 _texcoord3;
    float _texcoord4;
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
vec4 _colorLayer00094;
vec4 _colorLayer10094;
vec4 _colorLayer20094;
vec4 _TMP99;
vec3 _TMP840100;
vec4 _TMP103;
vec3 _TMP840104;
vec3 _diffuseLight0105;
vec3 _lightmapCol0105;
vec3 _TMP800109;
float _falloff0110;
vec3 _b0112;
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
varying vec4 cg_TexCoord4;
varying mediump vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00094 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00094.w = _colorLayer00094.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00094 = _colorLayer00094*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10094 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10094.w = _colorLayer10094.w*_layer1_diffuse.w;
    _colorLayer10094.xyz = _colorLayer10094.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10094.w = _colorLayer10094.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP840100 = _colorLayer00094.xyz*(1.00000000E+000 - _colorLayer10094.w) + _colorLayer10094.xyz*_colorLayer10094.w;
    _TMP99 = vec4(_TMP840100.x, _TMP840100.y, _TMP840100.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00094.w)*(1.00000000E+000 - _colorLayer10094.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20094 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20094.w = _colorLayer20094.w*_layer2_diffuse.w;
    _colorLayer20094.xyz = _colorLayer20094.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20094.w = _colorLayer20094.w*_input1._varying_colorSet1.y*_layer_kOpacities.z;
    _TMP840104 = _TMP99.xyz*(1.00000000E+000 - _colorLayer20094.w) + _colorLayer20094.xyz*_colorLayer20094.w;
    _TMP103 = vec4(_TMP840104.x, _TMP840104.y, _TMP840104.z, 1.00000000E+000 - (1.00000000E+000 - _TMP99.w)*(1.00000000E+000 - _colorLayer20094.w));
    _TMP4 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0105 = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    _diffuseLight0105 = _lightmapCol0105;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0105 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP800109 = _TMP103.xyz*_diffuseLight0105;
    _TMP0 = vec4(_TMP800109.x, _TMP800109.y, _TMP800109.z, _TMP103.w);
    _TMP9._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0110 = float(_input1._texcoord4);
    _b0112 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0110*(_b0112 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
