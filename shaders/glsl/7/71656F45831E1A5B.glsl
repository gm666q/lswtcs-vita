//C:\sagadata\SharedShaders/0xf87ee843.ios_pcode ukjbell Wed Nov 13 18:12:57 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    vec2 _texcoord4;
    float _texcoord5;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP19;
vec3 _TMP11;
vec3 _TMP1;
float _TMP10;
vec4 _TMP9;
vec3 _TMP29;
vec4 _TMP0;
vec4 _TMP8;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP28;
vec3 _TMP30;
float _TMP14;
float _TMP15;
vec3 _TMP3;
float _TMP13;
float _TMP12;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0101;
vec3 _reflection0121;
vec3 _r0127;
vec3 _v0127;
vec4 _colorLayer00135;
vec4 _colorLayer10135;
vec4 _TMP140;
vec3 _TMP950141;
vec4 _result0143;
vec3 _diffuseLight0146;
vec3 _lightmapCol0146;
vec3 _TMP920150;
vec4 _envTexel0152;
vec3 _finalLightingFactor0152;
vec3 _c0154;
float _a0156;
float _falloff0157;
vec3 _b0159;
vec3 _TMP160;
vec3 _TMP161;
vec3 _TMP162;
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
varying mediump vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord5;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord5 = cg_TexCoord5.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0101 = -cg_TexCoord1.xyz;
    _TMP12 = dot(_v0101, _v0101);
    _TMP13 = inversesqrt(_TMP12);
    _TMP2 = _TMP13*_v0101;
    _TMP30 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP12 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP13 = inversesqrt(_TMP12);
    _TMP3 = _TMP13*cg_TexCoord0.xyz;
    _TMP28 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP15 = dot(vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)), vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)));
    _TMP14 = float(_TMP15);
    _reflection0121 = _TMP30 - (2.00000000E+000*_TMP28)*_TMP14;
    _v0127 = vec3(float(_reflection0121.x), float(_reflection0121.y), float(_reflection0121.z));
    _TMP160.x = _vs_view[0].x;
    _TMP160.y = _vs_view[0].y;
    _TMP160.z = _vs_view[0].z;
    _r0127.x = dot(_TMP160, _v0127);
    _TMP161.x = _vs_view[1].x;
    _TMP161.y = _vs_view[1].y;
    _TMP161.z = _vs_view[1].z;
    _r0127.y = dot(_TMP161, _v0127);
    _TMP162.x = _vs_view[2].x;
    _TMP162.y = _vs_view[2].y;
    _TMP162.z = _vs_view[2].z;
    _r0127.z = dot(_TMP162, _v0127);
    _TMP29 = vec3(float((-_r0127).x), float((-_r0127).y), float((-_r0127).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00135 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00135.w = _colorLayer00135.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00135 = _colorLayer00135*_input1._varying_colorSet0;
    _TMP6 = texture(_layer1_sampler, cg_TexCoord3.xy);
    _colorLayer10135 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer10135.w = _colorLayer10135.w*_layer1_diffuse.w;
    _colorLayer10135.xyz = _colorLayer10135.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10135.w = _colorLayer10135.w*_layer_kOpacities.y;
    _TMP950141 = _colorLayer00135.xyz + _colorLayer10135.xyz*_colorLayer10135.w;
    _TMP140 = vec4(_TMP950141.x, _TMP950141.y, _TMP950141.z, _colorLayer00135.w);
    _TMP7 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0143 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _TMP8 = texture(_lightmap0, cg_TexCoord4.xy);
    _lightmapCol0146 = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _diffuseLight0146 = _lightmapCol0146;
    if (cg_TexCoord4.x <= 0.00000000E+000) {         _diffuseLight0146 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP920150 = _TMP140.xyz*_diffuseLight0146;
    _TMP0 = vec4(_TMP920150.x, _TMP920150.y, _TMP920150.z, _TMP140.w);
    _TMP19._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0154 = vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z));
    _TMP9 = texture(_envmap_samplerCube, _c0154);
    _envTexel0152 = vec4(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z), float(_TMP9.w));
    _finalLightingFactor0152 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0146*_envmap_params.x;
    _a0156 = _envTexel0152.w*_envmap_params.z;
    _TMP10 = _a0156 + (1.00000000E+000 - _a0156);
    _envTexel0152 = _envTexel0152*_TMP10;
    _TMP1 = (_envmap_params.y*_envTexel0152.xyz)*_finalLightingFactor0152;
    _TMP19._color[0].xyz = _TMP19._color[0].xyz + vec3(float((_result0143.xyz*_TMP1).x), float((_result0143.xyz*_TMP1).y), float((_result0143.xyz*_TMP1).z));
    _falloff0157 = float(_input1._texcoord5);
    _b0159 = vec3(float(_TMP19._color[0].x), float(_TMP19._color[0].y), float(_TMP19._color[0].z));
    _TMP11 = _fog_color.xyz + _falloff0157*(_b0159 - _fog_color.xyz);
    _TMP19._color[0].xyz = vec3(float(_TMP11.x), float(_TMP11.y), float(_TMP11.z));
    cg_FragColor = _TMP19._color[0];
    return;
} 
