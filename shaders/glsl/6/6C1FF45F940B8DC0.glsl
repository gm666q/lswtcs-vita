//C:\sagadata\SharedShaders/0xd8423fbb.ios_pcode ukjbell Wed Nov 13 18:13:50 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec4 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP15;
vec3 _TMP7;
vec4 _TMP0;
float _TMP28;
float _TMP27;
vec4 _TMP6;
float _TMP5;
float _TMP4;
float _TMP11;
vec3 _TMP24;
float _TMP10;
float _TMP3;
float _TMP2;
vec3 _TMP1;
float _TMP9;
float _TMP8;
VertexOutput _input1;
vec4 _colorLayer00107;
vec4 _colorLayer10107;
vec4 _TMP108;
vec3 _TMP870109;
vec3 _diffuseLight0122;
vec3 _lightmapCol0122;
vec3 _TMP830128;
float _falloff0129;
vec3 _b0131;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP8 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP9 = inversesqrt(_TMP8);
    _TMP1 = _TMP9*cg_TexCoord0.xyz;
    _TMP24 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _colorLayer00107 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00107.w = _colorLayer00107.w*_layer_kOpacities.x;
    _colorLayer10107.xyz = _layer1_diffuse.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10107.w = _layer1_diffuse.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP870109 = _colorLayer00107.xyz*(1.00000000E+000 - _colorLayer10107.w) + _colorLayer10107.xyz*_colorLayer10107.w;
    _TMP108 = vec4(_TMP870109.x, _TMP870109.y, _TMP870109.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00107.w)*(1.00000000E+000 - _colorLayer10107.w));
    _TMP10 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP2 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP2));
    _TMP3 = float(_TMP11);
    _TMP27 = _TMP3*_vs_lightPosition0.w;
    _TMP10 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP24.x), float(_TMP24.y), float(_TMP24.z)));
    _TMP4 = float(_TMP10);
    _TMP11 = max(0.00000000E+000, float(_TMP4));
    _TMP5 = float(_TMP11);
    _TMP28 = _TMP5*_vs_lightPosition1.w;
    _TMP6 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0122 = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    _diffuseLight0122 = _lightmapCol0122;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0122 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _diffuseLight0122 = _diffuseLight0122 + _TMP27*_vs_lightColor0.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _TMP28*_vs_lightColor1.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0122 = _diffuseLight0122 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0122);
    _TMP830128 = _TMP108.xyz*_diffuseLight0122;
    _TMP0 = vec4(_TMP830128.x, _TMP830128.y, _TMP830128.z, _TMP108.w);
    _TMP15._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0129 = float(_input1._texcoord2);
    _b0131 = vec3(float(_TMP15._color[0].x), float(_TMP15._color[0].y), float(_TMP15._color[0].z));
    _TMP7 = _fog_color.xyz + _falloff0129*(_b0131 - _fog_color.xyz);
    _TMP15._color[0].xyz = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    cg_FragColor = _TMP15._color[0];
    return;
} 
