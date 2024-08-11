//C:\sagadata\SharedShaders/0xf3c161af.ios_pcode ukjbell Wed Nov 13 18:09:12 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet23;
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

FragmentOutput _TMP22;
vec3 _TMP13;
vec3 _TMP1;
float _TMP12;
vec4 _TMP11;
vec3 _TMP36;
vec4 _TMP0;
float _TMP40;
float _TMP39;
vec4 _TMP10;
float _TMP9;
float _TMP8;
float _TMP18;
vec3 _TMP35;
float _TMP17;
float _TMP7;
float _TMP6;
vec4 _TMP5;
vec3 _TMP37;
float _TMP16;
vec3 _TMP3;
float _TMP15;
float _TMP14;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0107;
vec3 _reflection0129;
vec3 _r0135;
vec3 _v0135;
vec4 _colorLayer00143;
vec4 _result0147;
vec3 _diffuseLight0160;
vec3 _lightmapCol0160;
vec3 _TMP1010166;
vec4 _envTexel0168;
vec3 _finalLightingFactor0168;
vec3 _c0170;
float _a0172;
float _falloff0173;
vec3 _b0175;
vec3 _TMP176;
vec3 _TMP177;
vec3 _TMP178;
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
    _v0107 = -cg_TexCoord1.xyz;
    _TMP14 = dot(_v0107, _v0107);
    _TMP15 = inversesqrt(_TMP14);
    _TMP2 = _TMP15*_v0107;
    _TMP37 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP14 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP15 = inversesqrt(_TMP14);
    _TMP3 = _TMP15*cg_TexCoord0.xyz;
    _TMP35 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP17 = dot(vec3(float(_TMP35.x), float(_TMP35.y), float(_TMP35.z)), vec3(float(_TMP37.x), float(_TMP37.y), float(_TMP37.z)));
    _TMP16 = float(_TMP17);
    _reflection0129 = _TMP37 - (2.00000000E+000*_TMP35)*_TMP16;
    _v0135 = vec3(float(_reflection0129.x), float(_reflection0129.y), float(_reflection0129.z));
    _TMP176.x = _vs_view[0].x;
    _TMP176.y = _vs_view[0].y;
    _TMP176.z = _vs_view[0].z;
    _r0135.x = dot(_TMP176, _v0135);
    _TMP177.x = _vs_view[1].x;
    _TMP177.y = _vs_view[1].y;
    _TMP177.z = _vs_view[1].z;
    _r0135.y = dot(_TMP177, _v0135);
    _TMP178.x = _vs_view[2].x;
    _TMP178.y = _vs_view[2].y;
    _TMP178.z = _vs_view[2].z;
    _r0135.z = dot(_TMP178, _v0135);
    _TMP36 = vec3(float((-_r0135).x), float((-_r0135).y), float((-_r0135).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00143 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00143.w = _colorLayer00143.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00143 = _colorLayer00143*_input1._varying_colorSet0;
    _result0147 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP17 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP35.x), float(_TMP35.y), float(_TMP35.z)));
    _TMP6 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP18);
    _TMP39 = _TMP7*_vs_lightPosition0.w;
    _TMP17 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP35.x), float(_TMP35.y), float(_TMP35.z)));
    _TMP8 = float(_TMP17);
    _TMP18 = max(0.00000000E+000, float(_TMP8));
    _TMP9 = float(_TMP18);
    _TMP40 = _TMP9*_vs_lightPosition1.w;
    _TMP10 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0160 = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    _diffuseLight0160 = _lightmapCol0160;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0160 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _diffuseLight0160 = _diffuseLight0160 + _TMP39*_vs_lightColor0.xyz;
    _diffuseLight0160 = _diffuseLight0160 + _TMP40*_vs_lightColor1.xyz;
    _diffuseLight0160 = _diffuseLight0160 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0160 = _diffuseLight0160 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0160);
    _TMP1010166 = _colorLayer00143.xyz*_diffuseLight0160;
    _TMP0 = vec4(_TMP1010166.x, _TMP1010166.y, _TMP1010166.z, _colorLayer00143.w);
    _TMP22._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0170 = vec3(float(_TMP36.x), float(_TMP36.y), float(_TMP36.z));
    _TMP11 = texture(_envmap_samplerCube, _c0170);
    _envTexel0168 = vec4(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z), float(_TMP11.w));
    _finalLightingFactor0168 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0160*_envmap_params.x;
    _a0172 = _envTexel0168.w*_envmap_params.z;
    _TMP12 = _a0172 + (1.00000000E+000 - _a0172);
    _envTexel0168 = _envTexel0168*_TMP12;
    _TMP1 = (_envmap_params.y*_envTexel0168.xyz)*_finalLightingFactor0168;
    _TMP22._color[0].xyz = _TMP22._color[0].xyz + vec3(float((_result0147.xyz*_TMP1).x), float((_result0147.xyz*_TMP1).y), float((_result0147.xyz*_TMP1).z));
    _falloff0173 = float(_input1._texcoord4);
    _b0175 = vec3(float(_TMP22._color[0].x), float(_TMP22._color[0].y), float(_TMP22._color[0].z));
    _TMP13 = _fog_color.xyz + _falloff0173*(_b0175 - _fog_color.xyz);
    _TMP22._color[0].xyz = vec3(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z));
    cg_FragColor = _TMP22._color[0];
    return;
} 
