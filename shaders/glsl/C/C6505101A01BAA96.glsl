//C:\sagadata\SharedShaders/0xd2d87aae.ios_pcode ukjbell Wed Nov 13 18:13:36 2013

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

FragmentOutput _TMP17;
vec3 _TMP9;
vec3 _TMP1;
float _TMP8;
vec4 _TMP7;
vec3 _TMP26;
vec4 _TMP0;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP25;
vec3 _TMP27;
float _TMP12;
float _TMP13;
vec3 _TMP3;
float _TMP11;
float _TMP10;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0097;
vec3 _reflection0117;
vec3 _r0123;
vec3 _v0123;
vec4 _colorLayer00131;
vec4 _colorLayer10131;
vec4 _TMP134;
vec3 _TMP890135;
vec4 _result0137;
vec3 _diffuseLight0138;
vec3 _lightmapCol0138;
vec3 _TMP870142;
vec4 _envTexel0144;
vec3 _finalLightingFactor0144;
vec3 _c0146;
float _a0148;
float _falloff0149;
vec3 _b0151;
vec3 _TMP152;
vec3 _TMP153;
vec3 _TMP154;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
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
    _v0097 = -cg_TexCoord1.xyz;
    _TMP10 = dot(_v0097, _v0097);
    _TMP11 = inversesqrt(_TMP10);
    _TMP2 = _TMP11*_v0097;
    _TMP27 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP10 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP11 = inversesqrt(_TMP10);
    _TMP3 = _TMP11*cg_TexCoord0.xyz;
    _TMP25 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP13 = dot(vec3(float(_TMP25.x), float(_TMP25.y), float(_TMP25.z)), vec3(float(_TMP27.x), float(_TMP27.y), float(_TMP27.z)));
    _TMP12 = float(_TMP13);
    _reflection0117 = _TMP27 - (2.00000000E+000*_TMP25)*_TMP12;
    _v0123 = vec3(float(_reflection0117.x), float(_reflection0117.y), float(_reflection0117.z));
    _TMP152.x = _vs_view[0].x;
    _TMP152.y = _vs_view[0].y;
    _TMP152.z = _vs_view[0].z;
    _r0123.x = dot(_TMP152, _v0123);
    _TMP153.x = _vs_view[1].x;
    _TMP153.y = _vs_view[1].y;
    _TMP153.z = _vs_view[1].z;
    _r0123.y = dot(_TMP153, _v0123);
    _TMP154.x = _vs_view[2].x;
    _TMP154.y = _vs_view[2].y;
    _TMP154.z = _vs_view[2].z;
    _r0123.z = dot(_TMP154, _v0123);
    _TMP26 = vec3(float((-_r0123).x), float((-_r0123).y), float((-_r0123).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00131 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00131.w = _colorLayer00131.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00131 = _colorLayer00131*_input1._varying_colorSet0;
    _colorLayer10131.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10131.w = _layer1_diffuse.w*_layer_kOpacities.y;
    _TMP890135 = _colorLayer00131.xyz*(_colorLayer10131.xyz*_colorLayer10131.w + vec3(1.00000000E+000 - _colorLayer10131.w, 1.00000000E+000 - _colorLayer10131.w, 1.00000000E+000 - _colorLayer10131.w));
    _TMP134 = vec4(_TMP890135.x, _TMP890135.y, _TMP890135.z, _colorLayer00131.w);
    _result0137 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP6 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0138 = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    _diffuseLight0138 = _lightmapCol0138;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0138 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP870142 = _TMP134.xyz*_diffuseLight0138;
    _TMP0 = vec4(_TMP870142.x, _TMP870142.y, _TMP870142.z, _TMP134.w);
    _TMP17._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0146 = vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z));
    _TMP7 = texture(_envmap_samplerCube, _c0146);
    _envTexel0144 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _finalLightingFactor0144 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0138*_envmap_params.x;
    _a0148 = _envTexel0144.w*_envmap_params.z;
    _TMP8 = _a0148 + (1.00000000E+000 - _a0148);
    _envTexel0144 = _envTexel0144*_TMP8;
    _TMP1 = (_envmap_params.y*_envTexel0144.xyz)*_finalLightingFactor0144;
    _TMP17._color[0].xyz = _TMP17._color[0].xyz + vec3(float((_result0137.xyz*_TMP1).x), float((_result0137.xyz*_TMP1).y), float((_result0137.xyz*_TMP1).z));
    _falloff0149 = float(_input1._texcoord4);
    _b0151 = vec3(float(_TMP17._color[0].x), float(_TMP17._color[0].y), float(_TMP17._color[0].z));
    _TMP9 = _fog_color.xyz + _falloff0149*(_b0151 - _fog_color.xyz);
    _TMP17._color[0].xyz = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    cg_FragColor = _TMP17._color[0];
    return;
} 
