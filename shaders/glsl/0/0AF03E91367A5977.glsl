//SharedShaders/0x2de66cab.ios_pcode uklgonzale Wed Mar 12 15:32:11 2014

precision mediump float;
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
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
    vec2 _texcoord4;
    float _texcoord5;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP18;
vec3 _TMP10;
vec3 _TMP1;
float _TMP9;
vec4 _TMP8;
vec3 _TMP28;
vec4 _TMP0;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP27;
vec3 _TMP29;
float _TMP13;
float _TMP14;
vec3 _TMP3;
float _TMP12;
float _TMP11;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0092;
vec3 _reflection0110;
vec3 _r0116;
vec3 _v0116;
vec4 _colorLayer00124;
vec4 _result0128;
vec3 _diffuseLight0131;
vec3 _lightmapCol0131;
vec3 _TMP870135;
vec4 _envTexel0137;
vec3 _finalLightingFactor0137;
vec3 _c0139;
float _a0141;
float _falloff0142;
vec3 _b0144;
vec3 _TMP145;
vec3 _TMP146;
vec3 _TMP147;
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
varying vec4 cg_TexCoord5;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord5 = cg_TexCoord5.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0092 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0092, _v0092);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*_v0092;
    _TMP29 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP3 = _TMP12*cg_TexCoord0.xyz;
    _TMP27 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP14 = dot(vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)), vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z)));
    _TMP13 = float(_TMP14);
    _reflection0110 = _TMP29 - (2.00000000E+000*_TMP27)*_TMP13;
    _v0116 = vec3(float(_reflection0110.x), float(_reflection0110.y), float(_reflection0110.z));
    _TMP145.x = _vs_view[0].x;
    _TMP145.y = _vs_view[0].y;
    _TMP145.z = _vs_view[0].z;
    _r0116.x = dot(_TMP145, _v0116);
    _TMP146.x = _vs_view[1].x;
    _TMP146.y = _vs_view[1].y;
    _TMP146.z = _vs_view[1].z;
    _r0116.y = dot(_TMP146, _v0116);
    _TMP147.x = _vs_view[2].x;
    _TMP147.y = _vs_view[2].y;
    _TMP147.z = _vs_view[2].z;
    _r0116.z = dot(_TMP147, _v0116);
    _TMP28 = vec3(float((-_r0116).x), float((-_r0116).y), float((-_r0116).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00124 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00124.w = _colorLayer00124.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00124 = _colorLayer00124*_input1._varying_colorSet0;
    _TMP6 = texture(_specular_sampler, cg_TexCoord3.xy);
    _result0128 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP7 = texture(_lightmap0, cg_TexCoord4.xy);
    _lightmapCol0131 = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    _diffuseLight0131 = _lightmapCol0131;
    if (cg_TexCoord4.x <= 0.00000000E+000) {         _diffuseLight0131 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP870135 = _colorLayer00124.xyz*_diffuseLight0131;
    _TMP0 = vec4(_TMP870135.x, _TMP870135.y, _TMP870135.z, _colorLayer00124.w);
    _TMP18._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0139 = vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z));
    _TMP8 = texture(_envmap_samplerCube, _c0139);
    _envTexel0137 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _finalLightingFactor0137 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0131*_envmap_params.x;
    _a0141 = _envTexel0137.w*_envmap_params.z;
    _TMP9 = _a0141 + (1.00000000E+000 - _a0141);
    _envTexel0137 = _envTexel0137*_TMP9;
    _TMP1 = (_envmap_params.y*_envTexel0137.xyz)*_finalLightingFactor0137;
    _TMP18._color[0].xyz = _TMP18._color[0].xyz + vec3(float((_result0128.xyz*_TMP1).x), float((_result0128.xyz*_TMP1).y), float((_result0128.xyz*_TMP1).z));
    _falloff0142 = float(_input1._texcoord5);
    _b0144 = vec3(float(_TMP18._color[0].x), float(_TMP18._color[0].y), float(_TMP18._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0142*(_b0144 - _fog_color.xyz);
    _TMP18._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP18._color[0];
    return;
} 