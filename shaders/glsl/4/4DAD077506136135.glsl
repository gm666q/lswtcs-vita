//SharedShaders/0x6a1c671b.ios_pcode uklgonzale Wed Mar 12 17:37:53 2014

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

FragmentOutput _TMP22;
vec3 _TMP13;
vec3 _TMP1;
float _TMP12;
vec4 _TMP11;
vec3 _TMP32;
vec4 _TMP0;
float _TMP36;
float _TMP35;
float _TMP10;
float _TMP9;
float _TMP18;
vec3 _TMP31;
float _TMP17;
float _TMP8;
float _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP33;
float _TMP16;
vec3 _TMP3;
float _TMP15;
float _TMP14;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0106;
vec3 _reflection0130;
vec3 _r0136;
vec3 _v0136;
vec4 _colorLayer00144;
vec4 _colorLayer10144;
vec4 _TMP149;
vec3 _TMP1010150;
vec4 _result0152;
vec3 _diffuseLight0165;
vec3 _TMP960169;
vec4 _envTexel0171;
vec3 _finalLightingFactor0171;
vec3 _c0173;
float _a0175;
float _falloff0176;
vec3 _b0178;
vec3 _TMP179;
vec3 _TMP180;
vec3 _TMP181;
uniform highp vec4 _vs_view[4];
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
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
    _v0106 = -cg_TexCoord1.xyz;
    _TMP14 = dot(_v0106, _v0106);
    _TMP15 = inversesqrt(_TMP14);
    _TMP2 = _TMP15*_v0106;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP14 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP15 = inversesqrt(_TMP14);
    _TMP3 = _TMP15*cg_TexCoord0.xyz;
    _TMP31 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP17 = dot(vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP16 = float(_TMP17);
    _reflection0130 = _TMP33 - (2.00000000E+000*_TMP31)*_TMP16;
    _v0136 = vec3(float(_reflection0130.x), float(_reflection0130.y), float(_reflection0130.z));
    _TMP179.x = _vs_view[0].x;
    _TMP179.y = _vs_view[0].y;
    _TMP179.z = _vs_view[0].z;
    _r0136.x = dot(_TMP179, _v0136);
    _TMP180.x = _vs_view[1].x;
    _TMP180.y = _vs_view[1].y;
    _TMP180.z = _vs_view[1].z;
    _r0136.y = dot(_TMP180, _v0136);
    _TMP181.x = _vs_view[2].x;
    _TMP181.y = _vs_view[2].y;
    _TMP181.z = _vs_view[2].z;
    _r0136.z = dot(_TMP181, _v0136);
    _TMP32 = vec3(float((-_r0136).x), float((-_r0136).y), float((-_r0136).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00144 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00144.w = _colorLayer00144.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00144 = _colorLayer00144*_input1._varying_colorSet0;
    _TMP6 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10144 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer10144.w = _colorLayer10144.w*_layer1_diffuse.w;
    _colorLayer10144.xyz = _colorLayer10144.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10144.w = _colorLayer10144.w*_layer_kOpacities.y;
    _TMP1010150 = _colorLayer00144.xyz*(1.00000000E+000 - _colorLayer10144.w) + _colorLayer10144.xyz*_colorLayer10144.w;
    _TMP149 = vec4(_TMP1010150.x, _TMP1010150.y, _TMP1010150.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00144.w)*(1.00000000E+000 - _colorLayer10144.w));
    _result0152 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP17 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP7 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP18);
    _TMP35 = _TMP8*_vs_lightPosition0.w;
    _TMP17 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z)));
    _TMP9 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP9));
    _TMP10 = float(_TMP18);
    _TMP36 = _TMP10*_vs_lightPosition1.w;
    _diffuseLight0165 = _TMP35*_vs_lightColor0.xyz;
    _diffuseLight0165 = _diffuseLight0165 + _TMP36*_vs_lightColor1.xyz;
    _diffuseLight0165 = _diffuseLight0165 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0165 = _diffuseLight0165 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0165);
    _TMP960169 = _TMP149.xyz*_diffuseLight0165;
    _TMP0 = vec4(_TMP960169.x, _TMP960169.y, _TMP960169.z, _TMP149.w);
    _TMP22._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0173 = vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z));
    _TMP11 = texture(_envmap_samplerCube, _c0173);
    _envTexel0171 = vec4(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z), float(_TMP11.w));
    _finalLightingFactor0171 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0165*_envmap_params.x;
    _a0175 = _envTexel0171.w*_envmap_params.z;
    _TMP12 = _a0175 + (1.00000000E+000 - _a0175);
    _envTexel0171 = _envTexel0171*_TMP12;
    _TMP1 = (_envmap_params.y*_envTexel0171.xyz)*_finalLightingFactor0171;
    _TMP22._color[0].xyz = _TMP22._color[0].xyz + vec3(float((_result0152.xyz*_TMP1).x), float((_result0152.xyz*_TMP1).y), float((_result0152.xyz*_TMP1).z));
    _falloff0176 = float(_input1._texcoord3);
    _b0178 = vec3(float(_TMP22._color[0].x), float(_TMP22._color[0].y), float(_TMP22._color[0].z));
    _TMP13 = _fog_color.xyz + _falloff0176*(_b0178 - _fog_color.xyz);
    _TMP22._color[0].xyz = vec3(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z));
    cg_FragColor = _TMP22._color[0];
    return;
} 
