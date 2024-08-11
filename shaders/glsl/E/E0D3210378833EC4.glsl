//SharedShaders/0x2123cf3d.ios_pcode uklgonzale Wed Mar 12 15:01:25 2014

precision mediump float;
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
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP17;
vec3 _TMP9;
vec3 _TMP1;
float _TMP8;
vec4 _TMP7;
vec3 _TMP26;
vec4 _TMP0;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP25;
vec3 _TMP27;
float _TMP12;
float _TMP13;
vec3 _TMP3;
float _TMP11;
float _TMP10;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0091;
vec3 _reflection0109;
vec3 _r0115;
vec3 _v0115;
vec4 _colorLayer00123;
vec4 _result0127;
vec3 _diffuseLight0128;
vec3 _lightmapCol0128;
vec3 _TMP850132;
vec4 _envTexel0134;
vec3 _finalLightingFactor0134;
vec3 _c0136;
float _a0138;
float _falloff0139;
vec3 _b0141;
vec3 _TMP142;
vec3 _TMP143;
vec3 _TMP144;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
uniform samplerCube _envmap_samplerCube;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0091 = -cg_TexCoord1.xyz;
    _TMP10 = dot(_v0091, _v0091);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*_v0091;
    _TMP27 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP3 = _TMP11*cg_TexCoord0.xyz;
    _TMP25 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP13 = dot(vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP12 = float(_TMP13);
    _reflection0109 = _TMP27 - (2.00000000E+000*_TMP25)*_TMP12;
    _v0115 = vec3(float(_reflection0109.x), float(_reflection0109.y), float(_reflection0109.z));
    _TMP142.x = _vs_view[0].x;
    _TMP142.y = _vs_view[0].y;
    _TMP142.z = _vs_view[0].z;
    _r0115.x = dot(_TMP142, _v0115);
    _TMP143.x = _vs_view[1].x;
    _TMP143.y = _vs_view[1].y;
    _TMP143.z = _vs_view[1].z;
    _r0115.y = dot(_TMP143, _v0115);
    _TMP144.x = _vs_view[2].x;
    _TMP144.y = _vs_view[2].y;
    _TMP144.z = _vs_view[2].z;
    _r0115.z = dot(_TMP144, _v0115);
    _TMP26 = vec3(float((-_r0115).x), float((-_r0115).y), float((-_r0115).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00123 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00123.w = _colorLayer00123.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00123 = _colorLayer00123*_input1._varying_colorSet0;
    _result0127 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP6 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0128 = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    _diffuseLight0128 = _lightmapCol0128;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0128 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP850132 = _colorLayer00123.xyz*_diffuseLight0128;
    _TMP0 = vec4(_TMP850132.x, _TMP850132.y, _TMP850132.z, _colorLayer00123.w);
    _TMP17._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0136 = vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z));
    _TMP7 = texture(_envmap_samplerCube, _c0136);
    _envTexel0134 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _finalLightingFactor0134 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0128*_envmap_params.x;
    _a0138 = _envTexel0134.w*_envmap_params.z;
    _TMP8 = _a0138 + (1.00000000E+000 - _a0138);
    _envTexel0134 = _envTexel0134*_TMP8;
    _TMP1 = (_envmap_params.y*_envTexel0134.xyz)*_finalLightingFactor0134;
    _TMP17._color[0].xyz = _TMP17._color[0].xyz + vec3(float((_result0127.xyz*_TMP1).x), float((_result0127.xyz*_TMP1).y), float((_result0127.xyz*_TMP1).z));
    _falloff0139 = float(_input1._texcoord4);
    _b0141 = vec3(float(_TMP17._color[0].x), float(_TMP17._color[0].y), float(_TMP17._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0139*(_b0141 - _fog_color.xyz);
    _TMP17._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    cg_FragColor = _TMP17._color[0];
    return;
} 
