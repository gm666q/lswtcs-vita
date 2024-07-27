//SharedShaders/0x051af09b.ios_pcode uklgonzale Wed Mar 12 17:38:04 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP17;
vec3 _TMP9;
vec3 _TMP1;
float _TMP8;
vec4 _TMP7;
vec3 _TMP25;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP24;
vec3 _TMP26;
float _TMP12;
float _TMP13;
vec3 _TMP3;
float _TMP11;
float _TMP10;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0092;
vec3 _reflection0112;
vec3 _r0118;
vec3 _v0118;
vec4 _colorLayer00126;
vec4 _colorLayer10126;
vec4 _TMP129;
vec3 _TMP870130;
vec4 _result0132;
vec4 _envTexel0139;
vec3 _finalLightingFactor0139;
vec3 _c0141;
float _a0143;
float _falloff0144;
vec3 _b0146;
vec3 _TMP147;
vec3 _TMP148;
vec3 _TMP149;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _specular_sampler;
uniform samplerCube _envmap_samplerCube;
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
    _v0092 = -cg_TexCoord1.xyz;
    _TMP10 = dot(_v0092, _v0092);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*_v0092;
    _TMP26 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP3 = _TMP11*cg_TexCoord0.xyz;
    _TMP24 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP13 = dot(vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP12 = float(_TMP13);
    _reflection0112 = _TMP26 - (2.00000000E+000*_TMP24)*_TMP12;
    _v0118 = vec3(float(_reflection0112.x), float(_reflection0112.y), float(_reflection0112.z));
    _TMP147.x = _vs_view[0].x;
    _TMP147.y = _vs_view[0].y;
    _TMP147.z = _vs_view[0].z;
    _r0118.x = dot(_TMP147, _v0118);
    _TMP148.x = _vs_view[1].x;
    _TMP148.y = _vs_view[1].y;
    _TMP148.z = _vs_view[1].z;
    _r0118.y = dot(_TMP148, _v0118);
    _TMP149.x = _vs_view[2].x;
    _TMP149.y = _vs_view[2].y;
    _TMP149.z = _vs_view[2].z;
    _r0118.z = dot(_TMP149, _v0118);
    _TMP25 = vec3(float((-_r0118).x), float((-_r0118).y), float((-_r0118).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00126 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00126.w = _colorLayer00126.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00126 = _colorLayer00126*_input1._varying_colorSet0;
    _colorLayer10126.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10126.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP870130 = _colorLayer00126.xyz*(1.00000000E+000 - _colorLayer10126.w) + _colorLayer10126.xyz*_colorLayer10126.w;
    _TMP129 = vec4(_TMP870130.x, _TMP870130.y, _TMP870130.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00126.w)*(1.00000000E+000 - _colorLayer10126.w));
    _TMP6 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0132 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP17._color[0] = vec4(float(_TMP129.x), float(_TMP129.y), float(_TMP129.z), float(_TMP129.w));
    _c0141 = vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z));
    _TMP7 = texture(_envmap_samplerCube, _c0141);
    _envTexel0139 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _finalLightingFactor0139 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0143 = _envTexel0139.w*_envmap_params.z;
    _TMP8 = _a0143 + (1.00000000E+000 - _a0143);
    _envTexel0139 = _envTexel0139*_TMP8;
    _TMP1 = (_envmap_params.y*_envTexel0139.xyz)*_finalLightingFactor0139;
    _TMP17._color[0].xyz = _TMP17._color[0].xyz + vec3(float((_result0132.xyz*_TMP1).x), float((_result0132.xyz*_TMP1).y), float((_result0132.xyz*_TMP1).z));
    _falloff0144 = float(_input1._texcoord3);
    _b0146 = vec3(float(_TMP17._color[0].x), float(_TMP17._color[0].y), float(_TMP17._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0144*(_b0146 - _fog_color.xyz);
    _TMP17._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    cg_FragColor = _TMP17._color[0];
    return;
} 
