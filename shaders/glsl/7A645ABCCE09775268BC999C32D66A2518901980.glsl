//SharedShaders/0x1745d401.ios_pcode uklgonzale Wed Mar 12 15:07:16 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP23;
vec3 _TMP10;
vec4 _TMP0;
vec3 _TMP9;
float _TMP17;
float _TMP16;
float _TMP19;
float _TMP15;
float _TMP14;
vec3 _TMP34;
float _TMP13;
vec3 _TMP33;
float _TMP18;
float _TMP37;
float _TMP36;
vec4 _TMP8;
float _TMP7;
float _TMP6;
float _TMP5;
float _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP12;
float _TMP11;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0100;
vec4 _colorLayer00122;
vec4 _result0126;
vec3 _diffuseLight0139;
vec3 _lightmapCol0139;
vec3 _R20143;
vec3 _specularPhong0143;
vec3 _i0145;
vec3 _TMP950157;
vec3 _specularLight0157;
float _falloff0158;
vec3 _b0160;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _averageLightColor;
uniform vec4 _averageLightDir;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _specular_params;
uniform vec3 _specular_specular;
uniform sampler2D _layer0_sampler;
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
    _v0100 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0100, _v0100);
    _TMP12 = inversesqrt(_TMP11);
    _TMP1 = _TMP12*_v0100;
    _TMP34 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord0.xyz;
    _TMP33 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00122 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00122.w = _colorLayer00122.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00122 = _colorLayer00122*_input1._varying_colorSet0;
    _result0126 = vec4(_specular_specular.x, _specular_specular.y, _specular_specular.z, 1.00000000E+000);
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP4 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP14);
    _TMP36 = _TMP5*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)));
    _TMP6 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP6));
    _TMP7 = float(_TMP14);
    _TMP37 = _TMP7*_vs_lightPosition1.w;
    _TMP8 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0139 = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    _diffuseLight0139 = _lightmapCol0139;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0139 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _diffuseLight0139 = _diffuseLight0139 + _TMP36*_vs_lightColor0.xyz;
    _diffuseLight0139 = _diffuseLight0139 + _TMP37*_vs_lightColor1.xyz;
    _i0145 = -_averageLightDir.xyz;
    _TMP13 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_i0145.x), float(_i0145.y), float(_i0145.z)));
    _TMP18 = float(_TMP13);
    _R20143 = _i0145 - (2.00000000E+000*_TMP33)*_TMP18;
    _TMP13 = dot(vec3(float(_TMP34.x), float(_TMP34.y), float(_TMP34.z)), vec3(float(_R20143.x), float(_R20143.y), float(_R20143.z)));
    _TMP15 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP15));
    _TMP16 = float(_TMP14);
    _TMP19 = pow(float(_TMP16), float(_specular_params.x));
    _TMP17 = float(_TMP19);
    _specularPhong0143 = _averageLightColor.xyz*_TMP17;
    _TMP9 = _specularPhong0143*_specular_params.y;
    _diffuseLight0139 = _diffuseLight0139 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0139 = _diffuseLight0139 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0139);
    _specularLight0157 = _TMP9*_result0126.xyz;
    _TMP950157 = _colorLayer00122.xyz*_diffuseLight0139 + _specularLight0157;
    _TMP0 = vec4(_TMP950157.x, _TMP950157.y, _TMP950157.z, _colorLayer00122.w);
    _TMP23._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0158 = float(_input1._texcoord4);
    _b0160 = vec3(float(_TMP23._color[0].x), float(_TMP23._color[0].y), float(_TMP23._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0158*(_b0160 - _fog_color.xyz);
    _TMP23._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP23._color[0];
    return;
} 
