//C:\sagadata\SharedShaders/0x95882278.ios_pcode ukjbell Wed Nov 13 18:11:00 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP20;
vec3 _TMP12;
vec3 _TMP1;
float _TMP11;
vec4 _TMP10;
vec3 _TMP29;
vec4 _TMP0;
vec4 _TMP9;
vec4 _TMP8;
vec4 _TMP7;
vec4 _TMP6;
vec4 _TMP5;
vec3 _TMP28;
vec3 _TMP30;
float _TMP15;
float _TMP16;
vec3 _TMP3;
float _TMP14;
float _TMP13;
vec3 _TMP2;
VertexOutput _input1;
vec3 _v0103;
vec3 _reflection0125;
vec3 _r0131;
vec3 _v0131;
vec4 _colorLayer00139;
vec4 _colorLayer10139;
vec4 _colorLayer20139;
vec4 _TMP144;
vec3 _TMP980145;
vec4 _TMP148;
vec3 _TMP980149;
vec4 _result0151;
vec3 _diffuseLight0154;
vec3 _lightmapCol0154;
vec3 _TMP940158;
vec4 _envTexel0160;
vec3 _finalLightingFactor0160;
vec3 _c0162;
float _a0164;
float _falloff0165;
vec3 _b0167;
vec3 _TMP168;
vec3 _TMP169;
vec3 _TMP170;
uniform highp vec4 _vs_view[4];
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _envmap_params;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
uniform sampler2D _specular_sampler;
uniform samplerCube _envmap_samplerCube;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0103 = -cg_TexCoord1.xyz;
    _TMP13 = dot(_v0103, _v0103);
    _TMP14 = inversesqrt(_TMP13);
    _TMP2 = _TMP14*_v0103;
    _TMP30 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP13 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP14 = inversesqrt(_TMP13);
    _TMP3 = _TMP14*cg_TexCoord0.xyz;
    _TMP28 = vec3(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z));
    _TMP16 = dot(vec3(float(_TMP28.x), float(_TMP28.y), float(_TMP28.z)), vec3(float(_TMP30.x), float(_TMP30.y), float(_TMP30.z)));
    _TMP15 = float(_TMP16);
    _reflection0125 = _TMP30 - (2.00000000E+000*_TMP28)*_TMP15;
    _v0131 = vec3(float(_reflection0125.x), float(_reflection0125.y), float(_reflection0125.z));
    _TMP168.x = _vs_view[0].x;
    _TMP168.y = _vs_view[0].y;
    _TMP168.z = _vs_view[0].z;
    _r0131.x = dot(_TMP168, _v0131);
    _TMP169.x = _vs_view[1].x;
    _TMP169.y = _vs_view[1].y;
    _TMP169.z = _vs_view[1].z;
    _r0131.y = dot(_TMP169, _v0131);
    _TMP170.x = _vs_view[2].x;
    _TMP170.y = _vs_view[2].y;
    _TMP170.z = _vs_view[2].z;
    _r0131.z = dot(_TMP170, _v0131);
    _TMP29 = vec3(float((-_r0131).x), float((-_r0131).y), float((-_r0131).z));
    _TMP5 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00139 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _colorLayer00139.w = _colorLayer00139.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00139 = _colorLayer00139*_input1._varying_colorSet0;
    _TMP6 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10139 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _colorLayer10139.w = _colorLayer10139.w*_layer1_diffuse.w;
    _colorLayer10139.xyz = _colorLayer10139.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10139.w = _colorLayer10139.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP980145 = _colorLayer00139.xyz*(1.00000000E+000 - _colorLayer10139.w) + _colorLayer10139.xyz*_colorLayer10139.w;
    _TMP144 = vec4(_TMP980145.x, _TMP980145.y, _TMP980145.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00139.w)*(1.00000000E+000 - _colorLayer10139.w));
    _TMP7 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20139 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _colorLayer20139.w = _colorLayer20139.w*_layer2_diffuse.w;
    _colorLayer20139.xyz = _colorLayer20139.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20139.w = _colorLayer20139.w*_input1._varying_colorSet1.y*_layer_kOpacities.z;
    _TMP980149 = _TMP144.xyz*(1.00000000E+000 - _colorLayer20139.w) + _colorLayer20139.xyz*_colorLayer20139.w;
    _TMP148 = vec4(_TMP980149.x, _TMP980149.y, _TMP980149.z, 1.00000000E+000 - (1.00000000E+000 - _TMP144.w)*(1.00000000E+000 - _colorLayer20139.w));
    _TMP8 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0151 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP9 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0154 = vec3(float(_TMP9.x), float(_TMP9.y), float(_TMP9.z));
    _diffuseLight0154 = _lightmapCol0154;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0154 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP940158 = _TMP148.xyz*_diffuseLight0154;
    _TMP0 = vec4(_TMP940158.x, _TMP940158.y, _TMP940158.z, _TMP148.w);
    _TMP20._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _c0162 = vec3(float(_TMP29.x), float(_TMP29.y), float(_TMP29.z));
    _TMP10 = texture(_envmap_samplerCube, _c0162);
    _envTexel0160 = vec4(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z), float(_TMP10.w));
    _finalLightingFactor0160 = (1.00000000E+000 - _envmap_params.x) + _diffuseLight0154*_envmap_params.x;
    _a0164 = _envTexel0160.w*_envmap_params.z;
    _TMP11 = _a0164 + (1.00000000E+000 - _a0164);
    _envTexel0160 = _envTexel0160*_TMP11;
    _TMP1 = (_envmap_params.y*_envTexel0160.xyz)*_finalLightingFactor0160;
    _TMP20._color[0].xyz = _TMP20._color[0].xyz + vec3(float((_result0151.xyz*_TMP1).x), float((_result0151.xyz*_TMP1).y), float((_result0151.xyz*_TMP1).z));
    _falloff0165 = float(_input1._texcoord4);
    _b0167 = vec3(float(_TMP20._color[0].x), float(_TMP20._color[0].y), float(_TMP20._color[0].z));
    _TMP12 = _fog_color.xyz + _falloff0165*(_b0167 - _fog_color.xyz);
    _TMP20._color[0].xyz = vec3(float(_TMP12.x), float(_TMP12.y), float(_TMP12.z));
    cg_FragColor = _TMP20._color[0];
    return;
} 
