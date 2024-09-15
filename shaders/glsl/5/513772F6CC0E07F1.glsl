//SharedShaders/0x6d2fd0c7.ios_pcode uklgonzale Tue Mar 11 16:28:49 2014

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

FragmentOutput _TMP19;
vec3 _TMP11;
vec3 _TMP1;
float _TMP10;
vec4 _TMP9;
vec3 _TMP31;
vec4 _TMP0;
vec4 _TMP8;
vec4 _TMP27;
vec4 _TMP6;
vec3 _TMP30;
vec3 _TMP32;
float _TMP14;
float _TMP15;
vec3 _TMP4;
float _TMP13;
float _TMP12;
vec3 _TMP3;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0118;
vec3 _reflection0140;
vec3 _r0146;
vec3 _v0146;
vec4 _colorLayer00154;
vec4 _result0162;
vec3 _diffuseLight0163;
vec3 _worldNormal0163;
vec3 _diffuseEnvLight0163;
vec3 _r0165;
vec3 _v0165;
vec3 _c0173;
vec3 _TMP980177;
vec4 _envTexel0179;
vec3 _finalLightingFactor0179;
vec3 _c0181;
float _a0183;
float _falloff0184;
vec3 _b0186;
float _c0187;
vec3 _TMP188;
vec3 _TMP189;
vec3 _TMP190;
vec3 _TMP191;
vec3 _TMP192;
vec3 _TMP193;
uniform highp vec4 _vs_view[4];
uniform highp vec4 _vs_sceneAmbientColor;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _envmap_params;
uniform vec3 _specular_specular;
uniform vec2 _alphaTestParameters;
uniform sampler2D _layer0_sampler;
uniform samplerCube _envmap_samplerCube;
uniform samplerCube _diffenvmap_samplerCube;
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
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*cg_TexCoord0.xyz;
    _TMP27 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(cg_TexCoord0.w));
    _v0118 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0118, _v0118);
    _TMP13 = inversesqrt(_TMP12);
    _TMP3 = _TMP13*_v0118;
    _TMP32 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP4 = _TMP13*cg_TexCoord0.xyz;
    _TMP30 = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    _TMP15 = dot(vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP14 = float(_TMP15);
    _reflection0140 = _TMP32 - (2.00000000E+000*_TMP30)*_TMP14;
    _v0146 = vec3(float(_reflection0140.x), float(_reflection0140.y), float(_reflection0140.z));
    _TMP188.x = _vs_view[0].x;
    _TMP188.y = _vs_view[0].y;
    _TMP188.z = _vs_view[0].z;
    _r0146.x = dot(_TMP188, _v0146);
    _TMP189.x = _vs_view[1].x;
    _TMP189.y = _vs_view[1].y;
    _TMP189.z = _vs_view[1].z;
    _r0146.y = dot(_TMP189, _v0146);
    _TMP190.x = _vs_view[2].x;
    _TMP190.y = _vs_view[2].y;
    _TMP190.z = _vs_view[2].z;
    _r0146.z = dot(_TMP190, _v0146);
    _TMP31 = vec3(float((-_r0146).x), float((-_r0146).y), float((-_r0146).z));
    _TMP6 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00154 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer00154.w = _colorLayer00154.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00154 = _colorLayer00154*_input1._varying_colorSet0;
    _result0162 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _v0165 = vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z));
    _TMP191.x = _vs_view[0].x;
    _TMP191.y = _vs_view[0].y;
    _TMP191.z = _vs_view[0].z;
    _r0165.x = dot(_TMP191, _v0165);
    _TMP192.x = _vs_view[1].x;
    _TMP192.y = _vs_view[1].y;
    _TMP192.z = _vs_view[1].z;
    _r0165.y = dot(_TMP192, _v0165);
    _TMP193.x = _vs_view[2].x;
    _TMP193.y = _vs_view[2].y;
    _TMP193.z = _vs_view[2].z;
    _r0165.z = dot(_TMP193, _v0165);
    _worldNormal0163 = vec3(float(_r0165.x), float(_r0165.y), float(_r0165.z));
    _c0173 = vec3(float(_worldNormal0163.x), float(_worldNormal0163.y), float(_worldNormal0163.z));
    _TMP8 = texture(_diffenvmap_samplerCube, _c0173);
    _diffuseEnvLight0163 = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _diffuseLight0163 = _diffuseEnvLight0163*2.50000000E+000;
    _diffuseLight0163 = _diffuseLight0163 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0163 = _diffuseLight0163 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0163);
    _TMP980177 = _colorLayer00154.xyz*_diffuseLight0163;
    _TMP0 = vec4(_TMP980177.x, _TMP980177.y, _TMP980177.z, _colorLayer00154.w);
    _TMP19._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0181 = vec3(float(_TMP31.x), float(_TMP31.y), float(_TMP31.z));
    _TMP9 = texture(_envmap_samplerCube, _c0181);
    _envTexel0179 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _finalLightingFactor0179 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0163*_envmap_params.x;
    _a0183 = _envTexel0179.w*_envmap_params.z;
    _TMP10 = _a0183 + (1.00000000E+000 - _a0183);
    _envTexel0179 = _envTexel0179*_TMP10;
    _TMP1 = (_envmap_params.y*_envTexel0179.xyz)*_finalLightingFactor0179;
    _TMP19._color[0].xyz = _TMP19._color[0].xyz + vec3(float((_result0162.xyz*_TMP1).x), float((_result0162.xyz*_TMP1).y), float((_result0162.xyz*_TMP1).z));
    _falloff0184 = float(_input1._texcoord3);
    _b0186 = vec3(float(_TMP19._color[0].x), float(_TMP19._color[0].y), float(_TMP19._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0184*(_b0186 - _fog_color.xyz);
    _TMP19._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    _c0187 = _TMP19._color[0].w*float(_alphaTestParameters.x) - float(_alphaTestParameters.y);
    if (_c0187 < 0.00000000E+000) {         discard;
    }     cg_FragColor = _TMP19._color[0];
    return;
} 
