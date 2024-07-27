//SharedShaders/0x28179780.ios_pcode uklgonzale Wed Mar 12 17:19:10 2014

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

FragmentOutput _TMP16;
vec3 _TMP8;
vec3 _TMP1;
float _TMP7;
vec4 _TMP6;
vec3 _TMP24;
vec4 _TMP5;
vec3 _TMP23;
vec3 _TMP25;
float _TMP11;
float _TMP12;
vec3 _TMP3;
float _TMP10;
float _TMP9;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0087;
vec3 _reflection0105;
vec3 _r0111;
vec3 _v0111;
vec4 _colorLayer00119;
vec4 _result0123;
vec4 _envTexel0128;
vec3 _finalLightingFactor0128;
vec3 _c0130;
float _a0132;
float _falloff0133;
vec3 _b0135;
float _c0136;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
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
    _v0087 = -cg_TexCoord1.xyz;
    _TMP9 = dot(_v0087, _v0087);
    _TMP10 = inversesqrt(_TMP9);
    _TMP2 = _TMP10*_v0087;
    _TMP25 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP3 = _TMP10*cg_TexCoord0.xyz;
    _TMP23 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP12 = dot(vec3(float(_TMP23.x), float(_TMP23.y), float(_TMP23.z)), vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z)));
    _TMP11 = float(_TMP12);
    _reflection0105 = _TMP25 - (2.00000000E+000*_TMP23)*_TMP11;
    _v0111 = vec3(float(_reflection0105.x), float(_reflection0105.y), float(_reflection0105.z));
    _TMP137.x = _vs_view[0].x;
    _TMP137.y = _vs_view[0].y;
    _TMP137.z = _vs_view[0].z;
    _r0111.x = dot(_TMP137, _v0111);
    _TMP138.x = _vs_view[1].x;
    _TMP138.y = _vs_view[1].y;
    _TMP138.z = _vs_view[1].z;
    _r0111.y = dot(_TMP138, _v0111);
    _TMP139.x = _vs_view[2].x;
    _TMP139.y = _vs_view[2].y;
    _TMP139.z = _vs_view[2].z;
    _r0111.z = dot(_TMP139, _v0111);
    _TMP24 = vec3(float((-_r0111).x), float((-_r0111).y), float((-_r0111).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00119 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00119.w = _colorLayer00119.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00119 = _colorLayer00119*_input1._varying_colorSet0;
    _result0123 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP16._color[0] = vec4(float(_colorLayer00119.x), float(_colorLayer00119.y), float(_colorLayer00119.z), float(_colorLayer00119.w));
    _c0130 = vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z));
    _TMP6 = texture(_envmap_samplerCube, _c0130);
    _envTexel0128 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _finalLightingFactor0128 = (1.00000000E+000 - _envmap_params.x) + _envmap_params.xxx;
    _a0132 = _envTexel0128.w*_envmap_params.z;
    _TMP7 = _a0132 + (1.00000000E+000 - _a0132);
    _envTexel0128 = _envTexel0128*_TMP7;
    _TMP1 = (_envmap_params.y*_envTexel0128.xyz)*_finalLightingFactor0128;
    _TMP16._color[0].xyz = _TMP16._color[0].xyz + vec3(float((_result0123.xyz*_TMP1).x), float((_result0123.xyz*_TMP1).y), float((_result0123.xyz*_TMP1).z));
    _falloff0133 = float(_input1._texcoord3);
    _b0135 = vec3(float(_TMP16._color[0].x), float(_TMP16._color[0].y), float(_TMP16._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0133*(_b0135 - _fog_color.xyz);
    _TMP16._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _c0136 = _TMP16._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0136 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP16._color[0];
    return;
} 
