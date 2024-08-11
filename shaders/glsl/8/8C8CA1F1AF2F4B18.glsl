//SharedShaders/0x5f235ccd.ios_pcode uklgonzale Wed Mar 12 15:14:37 2014

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
    vec2 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP16;
vec3 _TMP8;
vec4 _TMP0;
float _TMP29;
float _TMP28;
vec4 _TMP7;
float _TMP6;
float _TMP5;
float _TMP12;
vec3 _TMP26;
float _TMP11;
float _TMP4;
float _TMP3;
vec4 _TMP2;
vec3 _TMP1;
float _TMP10;
float _TMP9;
VertexOutput _input1;
vec4 _colorLayer00103;
vec3 _diffuseLight0118;
vec3 _lightmapCol0118;
vec3 _TMP850124;
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
uniform sampler2D _layer0_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord3 = cg_TexCoord3.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP9 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP10 = inversesqrt(_TMP9);
    _TMP1 = _TMP10*cg_TexCoord0.xyz;
    _TMP26 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP2 = texture(_layer0_sampler, cg_TexCoord1.xy);
    _colorLayer00103 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer00103.w = _colorLayer00103.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00103 = _colorLayer00103*_input1._varying_colorSet0;
    _TMP11 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP3 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP3));
    _TMP4 = float(_TMP12);
    _TMP28 = _TMP4*_vs_lightPosition0.w;
    _TMP11 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP26.x), float(_TMP26.y), float(_TMP26.z)));
    _TMP5 = float(_TMP11);
    _TMP12 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP12);
    _TMP29 = _TMP6*_vs_lightPosition1.w;
    _TMP7 = texture(_lightmap0, cg_TexCoord2.xy);
    _lightmapCol0118 = vec3(float(_TMP7.x), float(_TMP7.y), float(_TMP7.z));
    _diffuseLight0118 = _lightmapCol0118;
    if (cg_TexCoord2.x <= 0.00000000E+000) {         _diffuseLight0118 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _diffuseLight0118 = _diffuseLight0118 + _TMP28*_vs_lightColor0.xyz;
    _diffuseLight0118 = _diffuseLight0118 + _TMP29*_vs_lightColor1.xyz;
    _diffuseLight0118 = _diffuseLight0118 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0118 = _diffuseLight0118 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0118);
    _TMP850124 = _colorLayer00103.xyz*_diffuseLight0118;
    _TMP0 = vec4(_TMP850124.x, _TMP850124.y, _TMP850124.z, _colorLayer00103.w);
    _TMP16._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0125 = float(_input1._texcoord3);
    _b0127 = vec3(float(_TMP16._color[0].x), float(_TMP16._color[0].y), float(_TMP16._color[0].z));
    _TMP8 = _fog_color.xyz + _falloff0125*(_b0127 - _fog_color.xyz);
    _TMP16._color[0].xyz = vec3(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z));
    cg_FragColor = _TMP16._color[0];
    return;
} 
