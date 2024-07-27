//C:\sagadata\SharedShaders/0xb4ce7674.ios_pcode ukjbell Wed Nov 13 18:13:38 2013

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

FragmentOutput _TMP18;
vec3 _TMP10;
vec3 _TMP1;
float _TMP9;
vec4 _TMP8;
vec3 _TMP27;
vec4 _TMP0;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP26;
vec3 _TMP28;
float _TMP13;
float _TMP14;
vec3 _TMP3;
float _TMP12;
float _TMP11;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0097;
vec3 _reflection0117;
vec3 _r0123;
vec3 _v0123;
vec4 _colorLayer00131;
vec4 _colorLayer10131;
vec4 _TMP134;
vec3 _TMP920135;
vec4 _result0137;
vec3 _diffuseLight0140;
vec3 _lightmapCol0140;
vec3 _TMP880144;
vec4 _envTexel0146;
vec3 _finalLightingFactor0146;
vec3 _c0148;
float _a0150;
float _falloff0151;
vec3 _b0153;
vec3 _TMP154;
vec3 _TMP155;
vec3 _TMP156;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
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
    _v0097 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0097, _v0097);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*_v0097;
    _TMP28 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP3 = _TMP12*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP14 = dot(vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP13 = float(_TMP14);
    _reflection0117 = _TMP28 - (2.00000000E+000*_TMP26)*_TMP13;
    _v0123 = vec3(float(_reflection0117.x), float(_reflection0117.y), float(_reflection0117.z));
    _TMP154.x = _vs_view[0].x;
    _TMP154.y = _vs_view[0].y;
    _TMP154.z = _vs_view[0].z;
    _r0123.x = dot(_TMP154, _v0123);
    _TMP155.x = _vs_view[1].x;
    _TMP155.y = _vs_view[1].y;
    _TMP155.z = _vs_view[1].z;
    _r0123.y = dot(_TMP155, _v0123);
    _TMP156.x = _vs_view[2].x;
    _TMP156.y = _vs_view[2].y;
    _TMP156.z = _vs_view[2].z;
    _r0123.z = dot(_TMP156, _v0123);
    _TMP27 = vec3(float((-_r0123).x), float((-_r0123).y), float((-_r0123).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00131 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00131.w = _colorLayer00131.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00131 = _colorLayer00131*_input1._varying_colorSet0;
    _colorLayer10131.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10131.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP920135 = _colorLayer00131.xyz*(1.00000000E+000 - _colorLayer10131.w) + _colorLayer10131.xyz*_colorLayer10131.w;
    _TMP134 = vec4(_TMP920135.x, _TMP920135.y, _TMP920135.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00131.w)*(1.00000000E+000 - _colorLayer10131.w));
    _TMP6 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0137 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP7 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0140 = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    _diffuseLight0140 = _lightmapCol0140;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0140 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP880144 = _TMP134.xyz*_diffuseLight0140;
    _TMP0 = vec4(_TMP880144.x, _TMP880144.y, _TMP880144.z, _TMP134.w);
    _TMP18._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0148 = vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z));
    _TMP8 = texture(_envmap_samplerCube, _c0148);
    _envTexel0146 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _finalLightingFactor0146 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0140*_envmap_params.x;
    _a0150 = _envTexel0146.w*_envmap_params.z;
    _TMP9 = _a0150 + (1.00000000E+000 - _a0150);
    _envTexel0146 = _envTexel0146*_TMP9;
    _TMP1 = (_envmap_params.y*_envTexel0146.xyz)*_finalLightingFactor0146;
    _TMP18._color[0].xyz = _TMP18._color[0].xyz + vec3(float((_result0137.xyz*_TMP1).x), float((_result0137.xyz*_TMP1).y), float((_result0137.xyz*_TMP1).z));
    _falloff0151 = float(_input1._texcoord4);
    _b0153 = vec3(float(_TMP18._color[0].x), float(_TMP18._color[0].y), float(_TMP18._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0151*(_b0153 - _fog_color.xyz);
    _TMP18._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP18._color[0];
    return;
} 
