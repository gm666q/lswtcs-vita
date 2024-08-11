//SharedShaders/0x09933a9a.ios_pcode uklgonzale Wed Mar 12 17:09:10 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
    vec2 _uvSet2;
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
vec3 _v0091;
vec3 _reflection0109;
vec3 _r0115;
vec3 _v0115;
vec4 _colorLayer00123;
vec4 _result0127;
vec3 _diffuseLight0130;
vec3 _lightmapCol0130;
vec3 _TMP860134;
vec4 _envTexel0136;
vec3 _finalLightingFactor0136;
vec3 _c0138;
float _a0140;
float _falloff0141;
vec3 _b0143;
vec3 _TMP144;
vec3 _TMP145;
vec3 _TMP146;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _specular_sampler;
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
    _TMP11 = dot(_v0091, _v0091);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*_v0091;
    _TMP28 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP3 = _TMP12*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP14 = dot(vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)), vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)));
    _TMP13 = float(_TMP14);
    _reflection0109 = _TMP28 - (2.00000000E+000*_TMP26)*_TMP13;
    _v0115 = vec3(float(_reflection0109.x), float(_reflection0109.y), float(_reflection0109.z));
    _TMP144.x = _vs_view[0].x;
    _TMP144.y = _vs_view[0].y;
    _TMP144.z = _vs_view[0].z;
    _r0115.x = dot(_TMP144, _v0115);
    _TMP145.x = _vs_view[1].x;
    _TMP145.y = _vs_view[1].y;
    _TMP145.z = _vs_view[1].z;
    _r0115.y = dot(_TMP145, _v0115);
    _TMP146.x = _vs_view[2].x;
    _TMP146.y = _vs_view[2].y;
    _TMP146.z = _vs_view[2].z;
    _r0115.z = dot(_TMP146, _v0115);
    _TMP27 = vec3(float((-_r0115).x), float((-_r0115).y), float((-_r0115).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00123 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00123.w = _colorLayer00123.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00123 = _colorLayer00123*_input1._varying_colorSet0;
    _TMP6 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0127 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP7 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0130 = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    _diffuseLight0130 = _lightmapCol0130;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0130 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP860134 = _colorLayer00123.xyz*_diffuseLight0130;
    _TMP0 = vec4(_TMP860134.x, _TMP860134.y, _TMP860134.z, _colorLayer00123.w);
    _TMP18._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0138 = vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z));
    _TMP8 = texture(_envmap_samplerCube, _c0138);
    _envTexel0136 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _finalLightingFactor0136 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0130*_envmap_params.x;
    _a0140 = _envTexel0136.w*_envmap_params.z;
    _TMP9 = _a0140 + (1.00000000E+000 - _a0140);
    _envTexel0136 = _envTexel0136*_TMP9;
    _TMP1 = (_envmap_params.y*_envTexel0136.xyz)*_finalLightingFactor0136;
    _TMP18._color[0].xyz = _TMP18._color[0].xyz + vec3(float((_result0127.xyz*_TMP1).x), float((_result0127.xyz*_TMP1).y), float((_result0127.xyz*_TMP1).z));
    _falloff0141 = float(_input1._texcoord4);
    _b0143 = vec3(float(_TMP18._color[0].x), float(_TMP18._color[0].y), float(_TMP18._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0141*(_b0143 - _fog_color.xyz);
    _TMP18._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP18._color[0];
    return;
} 
