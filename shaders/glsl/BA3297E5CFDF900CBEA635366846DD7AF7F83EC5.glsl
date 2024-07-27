//SharedShaders/0x138ac84c.ios_pcode uklgonzale Tue Mar 11 16:25:13 2014

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

FragmentOutput _TMP21;
vec3 _TMP12;
vec3 _TMP1;
float _TMP11;
vec4 _TMP10;
vec3 _TMP31;
vec4 _TMP0;
float _TMP34;
float _TMP33;
float _TMP9;
float _TMP8;
float _TMP17;
vec3 _TMP30;
float _TMP16;
float _TMP7;
float _TMP6;
vec4 _TMP5;
vec3 _TMP32;
float _TMP15;
vec3 _TMP3;
float _TMP14;
float _TMP13;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0098;
vec3 _reflection0120;
vec3 _r0126;
vec3 _v0126;
vec4 _colorLayer00134;
vec4 _result0138;
vec3 _diffuseLight0151;
vec3 _TMP920155;
vec4 _envTexel0157;
vec3 _finalLightingFactor0157;
vec3 _c0159;
float _a0161;
float _falloff0162;
vec3 _b0164;
vec3 _TMP165;
vec3 _TMP166;
vec3 _TMP167;
uniform highp vec4 _vs_view[4];
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
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
    _v0098 = -cg_TexCoord1.xyz;
    _TMP13 = dot(_v0098, _v0098);
    _TMP14 = inversesqrt(_TMP13);
    _TMP2 = _TMP14*_v0098;
    _TMP32 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP13 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP14 = inversesqrt(_TMP13);
    _TMP3 = _TMP14*cg_TexCoord0.xyz;
    _TMP30 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP16 = dot(vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP15 = float(_TMP16);
    _reflection0120 = _TMP32 - (2.00000000E+000*_TMP30)*_TMP15;
    _v0126 = vec3(float(_reflection0120.x), float(_reflection0120.y), float(_reflection0120.z));
    _TMP165.x = _vs_view[0].x;
    _TMP165.y = _vs_view[0].y;
    _TMP165.z = _vs_view[0].z;
    _r0126.x = dot(_TMP165, _v0126);
    _TMP166.x = _vs_view[1].x;
    _TMP166.y = _vs_view[1].y;
    _TMP166.z = _vs_view[1].z;
    _r0126.y = dot(_TMP166, _v0126);
    _TMP167.x = _vs_view[2].x;
    _TMP167.y = _vs_view[2].y;
    _TMP167.z = _vs_view[2].z;
    _r0126.z = dot(_TMP167, _v0126);
    _TMP31 = vec3(float((-_r0126).x), float((-_r0126).y), float((-_r0126).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00134 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00134.w = _colorLayer00134.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00134 = _colorLayer00134*_input1._varying_colorSet0;
    _result0138 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP16 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)));
    _TMP6 = float(_TMP16);
    _TMP17 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP17);
    _TMP33 = _TMP7*_vs_lightPosition0.w;
    _TMP16 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)));
    _TMP8 = float(_TMP16);
    _TMP17 = max(0.00000000E+000, float(_TMP8));
    _TMP9 = float(_TMP17);
    _TMP34 = _TMP9*_vs_lightPosition1.w;
    _diffuseLight0151 = _TMP33*_vs_lightColor0.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _TMP34*_vs_lightColor1.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0151 = _diffuseLight0151 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0151);
    _TMP920155 = _colorLayer00134.xyz*_diffuseLight0151;
    _TMP0 = vec4(_TMP920155.x, _TMP920155.y, _TMP920155.z, _colorLayer00134.w);
    _TMP21._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0159 = vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z));
    _TMP10 = texture(_envmap_samplerCube, _c0159);
    _envTexel0157 = vec4(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z), float(_TMP10.w));
    _finalLightingFactor0157 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0151*_envmap_params.x;
    _a0161 = _envTexel0157.w*_envmap_params.z;
    _TMP11 = _a0161 + (1.00000000E+000 - _a0161);
    _envTexel0157 = _envTexel0157*_TMP11;
    _TMP1 = (_envmap_params.y*_envTexel0157.xyz)*_finalLightingFactor0157;
    _TMP21._color[0].xyz = _TMP21._color[0].xyz + vec3(float((_result0138.xyz*_TMP1).x), float((_result0138.xyz*_TMP1).y), float((_result0138.xyz*_TMP1).z));
    _falloff0162 = float(_input1._texcoord3);
    _b0164 = vec3(float(_TMP21._color[0].x), float(_TMP21._color[0].y), float(_TMP21._color[0].z));
    _TMP12 = _fog_color.xyz + _falloff0162*(_b0164 - _fog_color.xyz);
    _TMP21._color[0].xyz = vec3(float(_TMP12.x), float(_TMP12.y), float(_TMP12.z));
    cg_FragColor = _TMP21._color[0];
    return;
} 
