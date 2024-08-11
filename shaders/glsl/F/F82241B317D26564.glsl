//C:\sagadata\SharedShaders/0x98ce3edf.ios_pcode ukjbell Wed Nov 13 18:12:23 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
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

FragmentOutput _TMP23;
vec3 _TMP10;
vec4 _TMP0;
vec3 _TMP9;
float _TMP17;
float _TMP16;
float _TMP19;
float _TMP15;
float _TMP14;
vec3 _TMP33;
float _TMP13;
vec3 _TMP32;
float _TMP18;
float _TMP35;
float _TMP34;
float _TMP8;
float _TMP7;
float _TMP6;
float _TMP5;
vec4 _TMP4;
vec4 _TMP3;
vec3 _TMP2;
float _TMP12;
float _TMP11;
vec3 _TMP1;
VertexOutput _input1;
vec3 _v0096;
vec4 _colorLayer00118;
vec4 _result0122;
vec3 _diffuseLight0137;
vec3 _R20139;
vec3 _specularPhong0139;
vec3 _i0141;
vec3 _TMP920153;
vec3 _specularLight0153;
float _falloff0154;
vec3 _b0156;
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
uniform sampler2D _layer0_sampler;
uniform sampler2D _specular_sampler;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _v0096 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0096, _v0096);
    _TMP12 = inversesqrt(_TMP11);
    _TMP1 = _TMP12*_v0096;
    _TMP33 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord0.xyz;
    _TMP32 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _TMP3 = texture(_layer0_sampler, cg_TexCoord2.xy);
    _colorLayer00118 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer00118.w = _colorLayer00118.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00118 = _colorLayer00118*_input1._varying_colorSet0;
    _TMP4 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0122 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP5 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP14);
    _TMP34 = _TMP6*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP7 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP14);
    _TMP35 = _TMP8*_vs_lightPosition1.w;
    _diffuseLight0137 = _TMP34*_vs_lightColor0.xyz;
    _diffuseLight0137 = _diffuseLight0137 + _TMP35*_vs_lightColor1.xyz;
    _i0141 = -_averageLightDir.xyz;
    _TMP13 = dot(vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)), vec3(float(_i0141.x), float(_i0141.y), float(_i0141.z)));
    _TMP18 = float(_TMP13);
    _R20139 = _i0141 - (2.00000000E+000*_TMP32)*_TMP18;
    _TMP13 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_R20139.x), float(_R20139.y), float(_R20139.z)));
    _TMP15 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP15));
    _TMP16 = float(_TMP14);
    _TMP19 = pow(float(_TMP16), float(_specular_params.x));
    _TMP17 = float(_TMP19);
    _specularPhong0139 = _averageLightColor.xyz*_TMP17;
    _TMP9 = _specularPhong0139*_specular_params.y;
    _diffuseLight0137 = _diffuseLight0137 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0137 = _diffuseLight0137 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0137);
    _specularLight0153 = _TMP9*_result0122.xyz;
    _TMP920153 = _colorLayer00118.xyz*_diffuseLight0137 + _specularLight0153;
    _TMP0 = vec4(_TMP920153.x, _TMP920153.y, _TMP920153.z, _colorLayer00118.w);
    _TMP23._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0154 = float(_input1._texcoord3);
    _b0156 = vec3(float(_TMP23._color[0].x), float(_TMP23._color[0].y), float(_TMP23._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0154*(_b0156 - _fog_color.xyz);
    _TMP23._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP23._color[0];
    return;
} 
