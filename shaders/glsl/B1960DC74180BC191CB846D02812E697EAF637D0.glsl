//C:\sagadata\SharedShaders/0xf17a2943.ios_pcode ukjbell Wed Nov 13 18:11:42 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP19;
vec3 _TMP11;
vec3 _TMP1;
float _TMP10;
vec4 _TMP9;
vec3 _TMP28;
vec4 _TMP0;
vec4 _TMP8;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP27;
vec3 _TMP29;
float _TMP14;
float _TMP15;
vec3 _TMP3;
float _TMP13;
float _TMP12;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0099;
vec3 _reflection0119;
vec3 _r0125;
vec3 _v0125;
vec4 _colorLayer00133;
vec4 _colorLayer10133;
vec4 _TMP138;
vec3 _TMP940139;
vec4 _result0141;
vec3 _diffuseLight0144;
vec3 _lightmapCol0144;
vec3 _TMP900148;
vec4 _envTexel0150;
vec3 _finalLightingFactor0150;
vec3 _c0152;
float _a0154;
float _falloff0155;
vec3 _b0157;
vec3 _TMP158;
vec3 _TMP159;
vec3 _TMP160;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
uniform samplerCube _envmap_samplerCube;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0099 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0099, _v0099);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*_v0099;
    _TMP29 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP3 = _TMP13*cg_TexCoord0.xyz;
    _TMP27 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP15 = dot(vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)), vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z)));
    _TMP14 = float(_TMP15);
    _reflection0119 = _TMP29 - (2.00000000E+000*_TMP27)*_TMP14;
    _v0125 = vec3(float(_reflection0119.x), float(_reflection0119.y), float(_reflection0119.z));
    _TMP158.x = _vs_view[0].x;
    _TMP158.y = _vs_view[0].y;
    _TMP158.z = _vs_view[0].z;
    _r0125.x = dot(_TMP158, _v0125);
    _TMP159.x = _vs_view[1].x;
    _TMP159.y = _vs_view[1].y;
    _TMP159.z = _vs_view[1].z;
    _r0125.y = dot(_TMP159, _v0125);
    _TMP160.x = _vs_view[2].x;
    _TMP160.y = _vs_view[2].y;
    _TMP160.z = _vs_view[2].z;
    _r0125.z = dot(_TMP160, _v0125);
    _TMP28 = vec3(float((-_r0125).x), float((-_r0125).y), float((-_r0125).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00133 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00133.w = _colorLayer00133.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00133 = _colorLayer00133*_input1._varying_colorSet0;
    _TMP6 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10133 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer10133.w = _colorLayer10133.w*_layer1_diffuse.w;
    _colorLayer10133.xyz = _colorLayer10133.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10133.w = _colorLayer10133.w*_layer_kOpacities.y;
    _TMP940139 = _colorLayer00133.xyz*(1.00000000E+000 - _colorLayer10133.w) + _colorLayer10133.xyz*_colorLayer10133.w;
    _TMP138 = vec4(_TMP940139.x, _TMP940139.y, _TMP940139.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00133.w)*(1.00000000E+000 - _colorLayer10133.w));
    _TMP7 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0141 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _TMP8 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0144 = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _diffuseLight0144 = _lightmapCol0144;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0144 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP900148 = _TMP138.xyz*_diffuseLight0144;
    _TMP0 = vec4(_TMP900148.x, _TMP900148.y, _TMP900148.z, _TMP138.w);
    _TMP19._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0152 = vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z));
    _TMP9 = texture(_envmap_samplerCube, _c0152);
    _envTexel0150 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _finalLightingFactor0150 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0144*_envmap_params.x;
    _a0154 = _envTexel0150.w*_envmap_params.z;
    _TMP10 = _a0154 + (1.00000000E+000 - _a0154);
    _envTexel0150 = _envTexel0150*_TMP10;
    _TMP1 = (_envmap_params.y*_envTexel0150.xyz)*_finalLightingFactor0150;
    _TMP19._color[0].xyz = _TMP19._color[0].xyz + vec3(float((_result0141.xyz*_TMP1).x), float((_result0141.xyz*_TMP1).y), float((_result0141.xyz*_TMP1).z));
    _falloff0155 = float(_input1._texcoord4);
    _b0157 = vec3(float(_TMP19._color[0].x), float(_TMP19._color[0].y), float(_TMP19._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0155*(_b0157 - _fog_color.xyz);
    _TMP19._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP19._color[0];
    return;
} 
