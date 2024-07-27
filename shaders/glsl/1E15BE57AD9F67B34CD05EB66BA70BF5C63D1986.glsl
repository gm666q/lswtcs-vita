//SharedShaders/0x16205327.ios_pcode uklgonzale Wed Mar 12 14:37:35 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
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
vec4 _TMP0;
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
vec3 _v0086;
vec3 _reflection0104;
vec3 _r0110;
vec3 _v0110;
vec4 _colorLayer00118;
vec4 _result0120;
vec3 _diffuseLight0121;
vec3 _lightmapCol0121;
vec3 _TMP800125;
vec4 _envTexel0127;
vec3 _finalLightingFactor0127;
vec3 _c0129;
float _a0131;
float _falloff0132;
vec3 _b0134;
vec3 _TMP135;
vec3 _TMP136;
vec3 _TMP137;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform samplerCube _envmap_samplerCube;
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
    _v0086 = -cg_TexCoord1.xyz;
    _TMP9 = dot(_v0086, _v0086);
    _TMP10 = inversesqrt(_TMP9);
    _TMP2 = _TMP10*_v0086;
    _TMP25 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP3 = _TMP10*cg_TexCoord0.xyz;
    _TMP23 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP12 = dot(vec3(float(_TMP23.x), float(_TMP23.y), float(_TMP23.z)), vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z)));
    _TMP11 = float(_TMP12);
    _reflection0104 = _TMP25 - (2.00000000E+000*_TMP23)*_TMP11;
    _v0110 = vec3(float(_reflection0104.x), float(_reflection0104.y), float(_reflection0104.z));
    _TMP135.x = _vs_view[0].x;
    _TMP135.y = _vs_view[0].y;
    _TMP135.z = _vs_view[0].z;
    _r0110.x = dot(_TMP135, _v0110);
    _TMP136.x = _vs_view[1].x;
    _TMP136.y = _vs_view[1].y;
    _TMP136.z = _vs_view[1].z;
    _r0110.y = dot(_TMP136, _v0110);
    _TMP137.x = _vs_view[2].x;
    _TMP137.y = _vs_view[2].y;
    _TMP137.z = _vs_view[2].z;
    _r0110.z = dot(_TMP137, _v0110);
    _TMP24 = vec3(float((-_r0110).x), float((-_r0110).y), float((-_r0110).z));
    _colorLayer00118.w = _input1._varying_colorSet0.w*_layer_kOpacities.x;
    _result0120 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP5 = texture(_lightmap0, cg_TexCoord2.xy);
    _lightmapCol0121 = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    _diffuseLight0121 = _lightmapCol0121;
    if (cg_TexCoord2.x <= 0.00000000E+000) {         _diffuseLight0121 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP800125 = _input1._varying_colorSet0.xyz*_diffuseLight0121;
    _TMP0 = vec4(_TMP800125.x, _TMP800125.y, _TMP800125.z, _colorLayer00118.w);
    _TMP16._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0129 = vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z));
    _TMP6 = texture(_envmap_samplerCube, _c0129);
    _envTexel0127 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _finalLightingFactor0127 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0121*_envmap_params.x;
    _a0131 = _envTexel0127.w*_envmap_params.z;
    _TMP7 = _a0131 + (1.00000000E+000 - _a0131);
    _envTexel0127 = _envTexel0127*_TMP7;
    _TMP1 = (_envmap_params.y*_envTexel0127.xyz)*_finalLightingFactor0127;
    _TMP16._color[0].xyz = _TMP16._color[0].xyz + vec3(float((_result0120.xyz*_TMP1).x), float((_result0120.xyz*_TMP1).y), float((_result0120.xyz*_TMP1).z));
    _falloff0132 = float(_input1._texcoord3);
    _b0134 = vec3(float(_TMP16._color[0].x), float(_TMP16._color[0].y), float(_TMP16._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0132*(_b0134 - _fog_color.xyz);
    _TMP16._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    cg_FragColor = _TMP16._color[0];
    return;
} 
