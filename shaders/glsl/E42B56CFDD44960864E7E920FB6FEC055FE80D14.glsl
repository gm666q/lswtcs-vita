//C:\sagadata\SharedShaders/0xb5c781de.ios_pcode ukjbell Wed Nov 13 18:08:56 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP16;
vec3 _TMP8;
vec3 _TMP1;
vec4 _TMP7;
vec4 _TMP0;
float _TMP26;
float _TMP25;
float _TMP6;
float _TMP5;
float _TMP12;
vec3 _TMP24;
float _TMP11;
float _TMP4;
float _TMP3;
vec3 _TMP2;
float _TMP10;
float _TMP9;
VertexOutput _input1;
vec4 _colorLayer00101;
vec4 _result0103;
vec3 _diffuseLight0116;
vec3 _TMP820120;
vec4 _envTexel0122;
float _falloff0125;
vec3 _b0127;
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
uniform sampler2D _ps2_shinemap_sampler;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP2 = _TMP10*cg_TexCoord0.xyz;
    _TMP24 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _colorLayer00101 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00101.w = _colorLayer00101.w*_layer_kOpacities.x;
    _result0103 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP11 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP3 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP3));
    _TMP4 = float(_TMP12);
    _TMP25 = _TMP4*_vs_lightPosition0.w;
    _TMP11 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP5 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP12);
    _TMP26 = _TMP6*_vs_lightPosition1.w;
    _diffuseLight0116 = _TMP25*_vs_lightColor0.xyz;
    _diffuseLight0116 = _diffuseLight0116 + _TMP26*_vs_lightColor1.xyz;
    _diffuseLight0116 = _diffuseLight0116 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0116 = _diffuseLight0116 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0116);
    _TMP820120 = _colorLayer00101.xyz*_diffuseLight0116;
    _TMP0 = vec4(_TMP820120.x, _TMP820120.y, _TMP820120.z, _colorLayer00101.w);
    _TMP16._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _TMP7 = texture(_ps2_shinemap_sampler, cg_TexCoord1.xy);
    _envTexel0122 = vec4(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z), float(_TMP7.w));
    _TMP1 = ((_envTexel0122.xyz*_envmap_params.y)*_diffuseLight0116)*2.00000000E+000;
    _TMP16._color[0].xyz = _TMP16._color[0].xyz + vec3(float((_result0103.xyz*_TMP1).x), float((_result0103.xyz*_TMP1).y), float((_result0103.xyz*_TMP1).z));
    _falloff0125 = float(_input1._texcoord2);
    _b0127 = vec3(float(_TMP16._color[0].x), float(_TMP16._color[0].y), float(_TMP16._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0125*(_b0127 - _fog_color.xyz);
    _TMP16._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    cg_FragColor = _TMP16._color[0];
    return;
} 
