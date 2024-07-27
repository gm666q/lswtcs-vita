//C:\sagadata\SharedShaders/0xd2ad3da0.ios_pcode ukjbell Wed Nov 13 18:14:53 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _uvSet23;
    vec4 _colorSet0;
    vec4 _colorSet1;
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
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00097;
vec4 _colorLayer10097;
vec4 _colorLayer20097;
vec4 _colorLayer30097;
vec4 _TMP102;
vec3 _TMP850103;
vec4 _TMP106;
vec3 _TMP850107;
vec4 _TMP110;
vec3 _TMP850111;
float _falloff0115;
vec3 _b0117;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer3_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
uniform sampler2D _layer3_sampler;
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
    _colorLayer00097 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00097.w = _colorLayer00097.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00097 = _colorLayer00097*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10097 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10097.w = _colorLayer10097.w*_layer1_diffuse.w;
    _colorLayer10097.xyz = _colorLayer10097.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10097.w = _colorLayer10097.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP850103 = _colorLayer00097.xyz*(1.00000000E+000 - _colorLayer10097.w) + _colorLayer10097.xyz*_colorLayer10097.w;
    _TMP102 = vec4(_TMP850103.x, _TMP850103.y, _TMP850103.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00097.w)*(1.00000000E+000 - _colorLayer10097.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20097 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20097.w = _colorLayer20097.w*_layer2_diffuse.w;
    _colorLayer20097.xyz = _colorLayer20097.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20097.w = _colorLayer20097.w*_input1._varying_colorSet1.y*_layer_kOpacities.z;
    _TMP850107 = _TMP102.xyz*(1.00000000E+000 - _colorLayer20097.w) + _colorLayer20097.xyz*_colorLayer20097.w;
    _TMP106 = vec4(_TMP850107.x, _TMP850107.y, _TMP850107.z, 1.00000000E+000 - (1.00000000E+000 - _TMP102.w)*(1.00000000E+000 - _colorLayer20097.w));
    _TMP4 = texture(_layer3_sampler, cg_TexCoord3.xy);
    _colorLayer30097 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _colorLayer30097.w = _colorLayer30097.w*_layer3_diffuse.w;
    _colorLayer30097.xyz = _colorLayer30097.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer30097.w = _colorLayer30097.w*_input1._varying_colorSet1.z*_layer_kOpacities.w;
    _TMP850111 = _TMP106.xyz*(1.00000000E+000 - _colorLayer30097.w) + _colorLayer30097.xyz*_colorLayer30097.w;
    _TMP110 = vec4(_TMP850111.x, _TMP850111.y, _TMP850111.z, 1.00000000E+000 - (1.00000000E+000 - _TMP106.w)*(1.00000000E+000 - _colorLayer30097.w));
    _TMP9._color[0] = vec4(float(_TMP110.x), float(_TMP110.y), float(_TMP110.z), float(_TMP110.w));
    _falloff0115 = float(_input1._texcoord4);
    _b0117 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0115*(_b0117 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
