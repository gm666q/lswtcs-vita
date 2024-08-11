//C:\sagadata\SharedShaders/0xc1fba5f0.ios_pcode ukjbell Wed Nov 13 18:09:59 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _tangent;
    vec4 _colorSet0;
    vec4 _blendWeight0;
    vec4 _blendIndices0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec3 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP21;
vec3 _TMP10;
vec4 _TMP0;
float _TMP9;
float _TMP35;
float _TMP16;
float _TMP14;
float _TMP8;
float _TMP34;
float _TMP15;
float _TMP17;
float _TMP13;
vec3 _TMP33;
vec3 _TMP31;
vec3 _TMP32;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP4;
vec3 _TMP3;
float _TMP12;
float _TMP11;
vec3 _TMP2;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0095;
vec4 _colorLayer00125;
vec4 _result0127;
vec3 _diffuseLight0140;
vec3 _specularLight0140;
vec3 _anisoBasis0140;
float _vdotb0140;
float _vbf0140;
float _ldotb00140;
float _ad00140;
float _ldotb10140;
float _ad10140;
float _base0140;
float _a0146;
float _a0152;
float _a0158;
float _b0162;
float _b0166;
vec3 _TMP900172;
vec3 _specularLight0172;
float _falloff0173;
vec3 _b0175;
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
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
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
    _v0095 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0095, _v0095);
    _TMP12 = inversesqrt(_TMP11);
    _TMP1 = _TMP12*_v0095;
    _TMP33 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP11 = dot(cg_TexCoord2.xyz, cg_TexCoord2.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord2.xyz;
    _TMP32 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP3 = _TMP12*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _colorLayer00125 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00125.w = _colorLayer00125.w*_layer_kOpacities.x;
    _result0127 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP4 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP14);
    _TMP34 = _TMP5*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP6 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP14);
    _TMP35 = _TMP7*_vs_lightPosition1.w;
    _anisoBasis0140 = _TMP32.yzx*_TMP31.zxy - _TMP32.zxy*_TMP31.yzx;
    _TMP13 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_anisoBasis0140.x), float(_anisoBasis0140.y), float(_anisoBasis0140.z)));
    _vdotb0140 = float(_TMP13);
    _a0146 = 1.00000000E+000 - _vdotb0140*_vdotb0140;
    _TMP17 = inversesqrt(float(_a0146));
    _TMP15 = float(_TMP17);
    _vbf0140 = 1.00000000E+000/_TMP15;
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_anisoBasis0140.x), float(_anisoBasis0140.y), float(_anisoBasis0140.z)));
    _ldotb00140 = float(_TMP13);
    _a0152 = 1.00000000E+000 - _ldotb00140*_ldotb00140;
    _TMP17 = inversesqrt(float(_a0152));
    _TMP15 = float(_TMP17);
    _ad00140 = 1.00000000E+000/_TMP15;
    _diffuseLight0140 = (_vs_lightColor0*_ad00140*_TMP34).xyz;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_anisoBasis0140.x), float(_anisoBasis0140.y), float(_anisoBasis0140.z)));
    _ldotb10140 = float(_TMP13);
    _a0158 = 1.00000000E+000 - _ldotb10140*_ldotb10140;
    _TMP17 = inversesqrt(float(_a0158));
    _TMP15 = float(_TMP17);
    _ad10140 = 1.00000000E+000/_TMP15;
    _diffuseLight0140 = _diffuseLight0140 + (_vs_lightColor1*_ad10140*_TMP35).xyz;
    _b0162 = _ad00140*_vbf0140 - _ldotb00140*_vdotb0140;
    _TMP14 = max(0.00000000E+000, float(_b0162));
    _base0140 = float(_TMP14);
    _TMP16 = pow(float(_base0140), float(_specular_params.x));
    _TMP8 = float(_TMP16);
    _specularLight0140 = (_TMP34*_vs_lightColor0.xyz)*_specular_params.y*_TMP8*_vs_lightColor0.w;
    _b0166 = _ad10140*_vbf0140 - _ldotb10140*_vdotb0140;
    _TMP14 = max(0.00000000E+000, float(_b0166));
    _base0140 = float(_TMP14);
    _TMP16 = pow(float(_base0140), float(_specular_params.x));
    _TMP9 = float(_TMP16);
    _specularLight0140 = _specularLight0140 + (_TMP35*_vs_lightColor1.xyz)*_specular_params.y*_TMP9*_vs_lightColor1.w;
    _diffuseLight0140 = _diffuseLight0140 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0140 = _diffuseLight0140 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0140);
    _specularLight0172 = _specularLight0140*_result0127.xyz;
    _TMP900172 = _colorLayer00125.xyz*_diffuseLight0140 + _specularLight0172;
    _TMP0 = vec4(_TMP900172.x, _TMP900172.y, _TMP900172.z, _colorLayer00125.w);
    _TMP21._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0173 = float(_input1._texcoord3);
    _b0175 = vec3(float(_TMP21._color[0].x), float(_TMP21._color[0].y), float(_TMP21._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0173*(_b0175 - _fog_color.xyz);
    _TMP21._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP21._color[0];
    return;
} 
