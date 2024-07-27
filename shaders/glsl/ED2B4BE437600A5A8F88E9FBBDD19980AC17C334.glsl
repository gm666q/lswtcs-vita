//SharedShaders/0x0740608d.ios_pcode uklgonzale Wed Mar 12 20:06:46 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    float _texcoord1;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP10;
vec3 _TMP6;
vec4 _TMP4;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00093;
vec4 _colorLayer10093;
vec4 _colorLayer20093;
vec4 _colorLayer30093;
vec4 _TMP98;
vec3 _TMP810099;
vec4 _TMP102;
vec3 _TMP810103;
vec4 _TMP106;
vec3 _TMP810107;
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
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord1 = cg_TexCoord1.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00093 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00093.w = _colorLayer00093.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00093 = _colorLayer00093*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord0.xy);
    _colorLayer10093 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10093.w = _colorLayer10093.w*_layer1_diffuse.w;
    _colorLayer10093.xyz = _colorLayer10093.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10093.w = _colorLayer10093.w*_layer_kOpacities.y;
    _TMP810099 = _colorLayer00093.xyz*(1.00000000E+000 - _colorLayer10093.w) + _colorLayer10093.xyz*_colorLayer10093.w;
    _TMP98 = vec4(_TMP810099.x, _TMP810099.y, _TMP810099.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00093.w)*(1.00000000E+000 - _colorLayer10093.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord0.xy);
    _colorLayer20093 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20093.w = _colorLayer20093.w*_layer2_diffuse.w;
    _colorLayer20093.xyz = _colorLayer20093.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20093.w = _colorLayer20093.w*_layer_kOpacities.z;
    _TMP810103 = _TMP98.xyz*(1.00000000E+000 - _colorLayer20093.w) + _colorLayer20093.xyz*_colorLayer20093.w;
    _TMP102 = vec4(_TMP810103.x, _TMP810103.y, _TMP810103.z, 1.00000000E+000 - (1.00000000E+000 - _TMP98.w)*(1.00000000E+000 - _colorLayer20093.w));
    _TMP4 = texture(_layer3_sampler, cg_TexCoord0.xy);
    _colorLayer30093 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _colorLayer30093.w = _colorLayer30093.w*_layer3_diffuse.w;
    _colorLayer30093.xyz = _colorLayer30093.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer30093.w = _colorLayer30093.w*_layer_kOpacities.w;
    _TMP810107 = _TMP102.xyz*(1.00000000E+000 - _colorLayer30093.w) + _colorLayer30093.xyz*_colorLayer30093.w;
    _TMP106 = vec4(_TMP810107.x, _TMP810107.y, _TMP810107.z, 1.00000000E+000 - (1.00000000E+000 - _TMP102.w)*(1.00000000E+000 - _colorLayer30093.w));
    _TMP10._color[0] = vec4(float(_TMP106.x), float(_TMP106.y), float(_TMP106.z), float(_TMP106.w));
    _falloff0115 = float(_input1._texcoord1);
    _b0117 = vec3(float(_TMP10._color[0].x), float(_TMP10._color[0].y), float(_TMP10._color[0].z));
    _TMP6 = _fog_color.xyz + _falloff0115*(_b0117 - _fog_color.xyz);
    _TMP10._color[0].xyz = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    cg_FragColor = _TMP10._color[0];
    return;
} 
