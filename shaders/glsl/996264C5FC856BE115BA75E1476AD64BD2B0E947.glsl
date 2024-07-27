//SharedShaders/0x42d67c65.ios_pcode uklgonzale Wed Mar 12 20:43:39 2014

precision lowp float;

vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
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
float _TMP36;
float _TMP35;
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
vec3 _v0102;
vec4 _colorLayer00126;
vec4 _colorLayer10126;
vec4 _TMP129;
vec3 _TMP950130;
vec4 _result0132;
vec3 _diffuseLight0147;
vec3 _R20149;
vec3 _specularPhong0149;
vec3 _i0151;
vec3 _TMP940163;
vec3 _specularLight0163;
float _falloff0164;
vec3 _b0166;
uniform highp vec4 _vs_sceneAmbientColor;
uniform highp vec4 _vs_lightColor0;
uniform highp vec4 _vs_lightColor1;
uniform highp vec4 _vs_lightPosition0;
uniform highp vec4 _vs_lightPosition1;
uniform vec4 _fog_color;
uniform vec4 _averageLightColor;
uniform vec4 _averageLightDir;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform vec4 _ambientColor;
uniform vec4 _incandescentGlow;
uniform vec4 _specular_params;
uniform sampler2D _layer1_sampler;
uniform sampler2D _specular_sampler;
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
    _v0102 = -cg_TexCoord1.xyz;
    _TMP11 = dot(_v0102, _v0102);
    _TMP12 = inversesqrt(_TMP11);
    _TMP1 = _TMP12*_v0102;
    _TMP33 = vec3(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z));
    _TMP11 = dot(cg_TexCoord0.xyz, cg_TexCoord0.xyz);
    _TMP12 = inversesqrt(_TMP11);
    _TMP2 = _TMP12*cg_TexCoord0.xyz;
    _TMP32 = vec3(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z));
    _colorLayer00126 = _layer0_diffuse*_input1._varying_colorSet0;
    _colorLayer00126.w = _colorLayer00126.w*_layer_kOpacities.x;
    _TMP3 = texture(_layer1_sampler, cg_TexCoord2.xy);
    _colorLayer10126 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer10126.w = _colorLayer10126.w*_layer1_diffuse.w;
    _colorLayer10126.xyz = _colorLayer10126.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10126.w = _colorLayer10126.w*_layer_kOpacities.y;
    _TMP950130 = _colorLayer00126.xyz*(_colorLayer10126.xyz*_colorLayer10126.w + vec3(1.00000000E+000 - _colorLayer10126.w, 1.00000000E+000 - _colorLayer10126.w, 1.00000000E+000 - _colorLayer10126.w));
    _TMP129 = vec4(_TMP950130.x, _TMP950130.y, _TMP950130.z, _colorLayer00126.w);
    _TMP4 = texture(_specular_sampler, cg_TexCoord2.xy);
    _result0132 = vec4(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z), float(_TMP4.w));
    _TMP13 = dot(vec3(float(_vs_lightPosition0.x), float(_vs_lightPosition0.y), float(_vs_lightPosition0.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP5 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP5));
    _TMP6 = float(_TMP14);
    _TMP35 = _TMP6*_vs_lightPosition0.w;
    _TMP13 = dot(vec3(float(_vs_lightPosition1.x), float(_vs_lightPosition1.y), float(_vs_lightPosition1.z)), vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)));
    _TMP7 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP7));
    _TMP8 = float(_TMP14);
    _TMP36 = _TMP8*_vs_lightPosition1.w;
    _diffuseLight0147 = _TMP35*_vs_lightColor0.xyz;
    _diffuseLight0147 = _diffuseLight0147 + _TMP36*_vs_lightColor1.xyz;
    _i0151 = -_averageLightDir.xyz;
    _TMP13 = dot(vec3(float(_TMP32.x), float(_TMP32.y), float(_TMP32.z)), vec3(float(_i0151.x), float(_i0151.y), float(_i0151.z)));
    _TMP18 = float(_TMP13);
    _R20149 = _i0151 - (2.00000000E+000*_TMP32)*_TMP18;
    _TMP13 = dot(vec3(float(_TMP33.x), float(_TMP33.y), float(_TMP33.z)), vec3(float(_R20149.x), float(_R20149.y), float(_R20149.z)));
    _TMP15 = float(_TMP13);
    _TMP14 = max(0.00000000E+000, float(_TMP15));
    _TMP16 = float(_TMP14);
    _TMP19 = pow(float(_TMP16), float(_specular_params.x));
    _TMP17 = float(_TMP19);
    _specularPhong0149 = _averageLightColor.xyz*_TMP17;
    _TMP9 = _specularPhong0149*_specular_params.y;
    _diffuseLight0147 = _diffuseLight0147 + _ambientColor.xyz + _vs_sceneAmbientColor.xyz;
    _diffuseLight0147 = _diffuseLight0147 + _incandescentGlow.xyz*(vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000) - _diffuseLight0147);
    _specularLight0163 = _TMP9*_result0132.xyz;
    _TMP940163 = _TMP129.xyz*_diffuseLight0147 + _specularLight0163;
    _TMP0 = vec4(_TMP940163.x, _TMP940163.y, _TMP940163.z, _TMP129.w);
    _TMP23._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0164 = float(_input1._texcoord3);
    _b0166 = vec3(float(_TMP23._color[0].x), float(_TMP23._color[0].y), float(_TMP23._color[0].z));
    _TMP10 = _fog_color.xyz + _falloff0164*(_b0166 - _fog_color.xyz);
    _TMP23._color[0].xyz = vec3(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z));
    cg_FragColor = _TMP23._color[0];
    return;
} 
