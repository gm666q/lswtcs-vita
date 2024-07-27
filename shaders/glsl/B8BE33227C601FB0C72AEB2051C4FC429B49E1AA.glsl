//C:\sagadata\SharedShaders/0xfdecd72b.ios_pcode ukjbell Wed Nov 13 18:13:30 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP19;
vec3 _TMP11;
vec3 _TMP1;
float _TMP10;
vec4 _TMP9;
vec3 _TMP27;
vec4 _TMP8;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP26;
vec3 _TMP28;
float _TMP14;
float _TMP15;
vec3 _TMP3;
float _TMP13;
float _TMP12;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0098;
vec3 _reflection0120;
vec3 _r0126;
vec3 _v0126;
vec4 _colorLayer00134;
vec4 _colorLayer10134;
vec4 _colorLayer20134;
vec4 _TMP139;
vec3 _TMP900140;
vec4 _TMP143;
vec3 _TMP920144;
vec4 _result0146;
vec4 _envTexel0153;
vec3 _finalLightingFactor0153;
vec3 _c0155;
float _a0157;
float _falloff0158;
vec3 _b0160;
vec3 _TMP161;
vec3 _TMP162;
vec3 _TMP163;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
uniform sampler2D _specular_sampler;
uniform samplerCube _envmap_samplerCube;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0098 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0098, _v0098);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*_v0098;
    _TMP28 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP3 = _TMP13*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP15 = dot(vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP14 = float(_TMP15);
    _reflection0120 = _TMP28 - (2.00000000E+000*_TMP26)*_TMP14;
    _v0126 = vec3(float(_reflection0120.x), float(_reflection0120.y), float(_reflection0120.z));
    _TMP161.x = _vs_view[0].x;
    _TMP161.y = _vs_view[0].y;
    _TMP161.z = _vs_view[0].z;
    _r0126.x = dot(_TMP161, _v0126);
    _TMP162.x = _vs_view[1].x;
    _TMP162.y = _vs_view[1].y;
    _TMP162.z = _vs_view[1].z;
    _r0126.y = dot(_TMP162, _v0126);
    _TMP163.x = _vs_view[2].x;
    _TMP163.y = _vs_view[2].y;
    _TMP163.z = _vs_view[2].z;
    _r0126.z = dot(_TMP163, _v0126);
    _TMP27 = vec3(float((-_r0126).x), float((-_r0126).y), float((-_r0126).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00134 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00134.w = _colorLayer00134.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00134 = _colorLayer00134*_input1._varying_colorSet0;
    _TMP6 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10134 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer10134.w = _colorLayer10134.w*_layer1_diffuse.w;
    _colorLayer10134.xyz = _colorLayer10134.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10134.w = _colorLayer10134.w*_layer_kOpacities.y;
    _TMP900140 = _colorLayer00134.xyz*(_colorLayer10134.xyz*_colorLayer10134.w + vec3(1.00000000E+000 - _colorLayer10134.w, 1.00000000E+000 - _colorLayer10134.w, 1.00000000E+000 - _colorLayer10134.w));
    _TMP139 = vec4(_TMP900140.x, _TMP900140.y, _TMP900140.z, _colorLayer00134.w);
    _TMP7 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20134 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _colorLayer20134.w = _colorLayer20134.w*_layer2_diffuse.w;
    _colorLayer20134.xyz = _colorLayer20134.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20134.w = _colorLayer20134.w*_layer_kOpacities.z;
    _TMP920144 = _TMP139.xyz + _colorLayer20134.xyz*_colorLayer20134.w;
    _TMP143 = vec4(_TMP920144.x, _TMP920144.y, _TMP920144.z, _TMP139.w);
    _TMP8 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0146 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP19._color[0] = vec4(float(_TMP143.x), float(_TMP143.y), float(_TMP143.z), float(_TMP143.w));
    _c0155 = vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z));
    _TMP9 = texture(_envmap_samplerCube, _c0155);
    _envTexel0153 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _finalLightingFactor0153 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0157 = _envTexel0153.w*_envmap_params.z;
    _TMP10 = _a0157 + (1.00000000E+000 - _a0157);
    _envTexel0153 = _envTexel0153*_TMP10;
    _TMP1 = (_envmap_params.y*_envTexel0153.xyz)*_finalLightingFactor0153;
    _TMP19._color[0].xyz = _TMP19._color[0].xyz + vec3(float((_result0146.xyz*_TMP1).x), float((_result0146.xyz*_TMP1).y), float((_result0146.xyz*_TMP1).z));
    _falloff0158 = float(_input1._texcoord3);
    _b0160 = vec3(float(_TMP19._color[0].x), float(_TMP19._color[0].y), float(_TMP19._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0158*(_b0160 - _fog_color.xyz);
    _TMP19._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP19._color[0];
    return;
} 
