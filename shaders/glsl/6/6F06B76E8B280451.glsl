//C:\sagadata\SharedShaders/0xc92a8f48.ios_pcode ukjbell Wed Nov 13 18:12:59 2013

precision mediump float;
vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP9;
vec3 _TMP5;
vec4 _TMP0;
vec4 _TMP4;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00086;
vec4 _colorLayer10086;
vec4 _TMP91;
vec3 _TMP770092;
vec3 _diffuseLight0097;
vec3 _lightmapCol0097;
vec3 _TMP740101;
float _falloff0102;
vec3 _b0104;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying mediump vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._texcoord2 = cg_TexCoord2.x;
    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00086 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00086.w = _colorLayer00086.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00086 = _colorLayer00086*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord0.xy);
    _colorLayer10086 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10086.w = _colorLayer10086.w*_layer1_diffuse.w;
    _colorLayer10086.xyz = _colorLayer10086.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10086.w = _colorLayer10086.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP770092 = _colorLayer00086.xyz + _colorLayer10086.xyz*_colorLayer10086.w;
    _TMP91 = vec4(_TMP770092.x, _TMP770092.y, _TMP770092.z, _colorLayer00086.w);
    _TMP4 = texture(_lightmap0, cg_TexCoord1.xy);
    _lightmapCol0097 = vec3(float(_TMP4.x), float(_TMP4.y), float(_TMP4.z));
    _diffuseLight0097 = _lightmapCol0097;
    if (cg_TexCoord1.x <= 0.00000000E+000) {         _diffuseLight0097 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP740101 = _TMP91.xyz*_diffuseLight0097;
    _TMP0 = vec4(_TMP740101.x, _TMP740101.y, _TMP740101.z, _TMP91.w);
    _TMP9._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0102 = float(_input1._texcoord2);
    _b0104 = vec3(float(_TMP9._color[0].x), float(_TMP9._color[0].y), float(_TMP9._color[0].z));
    _TMP5 = _fog_color.xyz + _falloff0102*(_b0104 - _fog_color.xyz);
    _TMP9._color[0].xyz = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    cg_FragColor = _TMP9._color[0];
    return;
} 
