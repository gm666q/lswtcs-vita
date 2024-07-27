//C:\sagadata\SharedShaders/0xaea825e3.ios_pcode ukjbell Wed Nov 13 18:13:04 2013

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
vec3 _v0086;
vec3 _reflection0104;
vec3 _r0110;
vec3 _v0110;
vec4 _colorLayer00118;
vec4 _result0122;
vec4 _envTexel0129;
vec3 _finalLightingFactor0129;
vec3 _c0131;
float _a0133;
float _falloff0134;
vec3 _b0136;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
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
    _v0086 = -cg_TexCoord1.xyz;
    _TMP10 = dot(_v0086, _v0086);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*_v0086;
    _TMP26 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP3 = _TMP11*cg_TexCoord0.xyz;
    _TMP24 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP13 = dot(vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP12 = float(_TMP13);
    _reflection0104 = _TMP26 - (2.00000000E+000*_TMP24)*_TMP12;
    _v0110 = vec3(float(_reflection0104.x), float(_reflection0104.y), float(_reflection0104.z));
    _TMP137.x = _vs_view[0].x;
    _TMP137.y = _vs_view[0].y;
    _TMP137.z = _vs_view[0].z;
    _r0110.x = dot(_TMP137, _v0110);
    _TMP138.x = _vs_view[1].x;
    _TMP138.y = _vs_view[1].y;
    _TMP138.z = _vs_view[1].z;
    _r0110.y = dot(_TMP138, _v0110);
    _TMP139.x = _vs_view[2].x;
    _TMP139.y = _vs_view[2].y;
    _TMP139.z = _vs_view[2].z;
    _r0110.z = dot(_TMP139, _v0110);
    _TMP25 = vec3(float((-_r0110).x), float((-_r0110).y), float((-_r0110).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00118 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00118.w = _colorLayer00118.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00118 = _colorLayer00118*_input1._varying_colorSet0;
    _TMP6 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0122 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP17._color[0] = vec4(float(_colorLayer00118.x), float(_colorLayer00118.y), float(_colorLayer00118.z), float(_colorLayer00118.w));
    _c0131 = vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z));
    _TMP7 = texture(_envmap_samplerCube, _c0131);
    _envTexel0129 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _finalLightingFactor0129 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0133 = _envTexel0129.w*_envmap_params.z;
    _TMP8 = _a0133 + (1.00000000E+000 - _a0133);
    _envTexel0129 = _envTexel0129*_TMP8;
    _TMP1 = (_envmap_params.y*_envTexel0129.xyz)*_finalLightingFactor0129;
    _TMP17._color[0].xyz = _TMP17._color[0].xyz + vec3(float((_result0122.xyz*_TMP1).x), float((_result0122.xyz*_TMP1).y), float((_result0122.xyz*_TMP1).z));
    _falloff0134 = float(_input1._texcoord3);
    _b0136 = vec3(float(_TMP17._color[0].x), float(_TMP17._color[0].y), float(_TMP17._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0134*(_b0136 - _fog_color.xyz);
    _TMP17._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    cg_FragColor = _TMP17._color[0];
    return;
} 
