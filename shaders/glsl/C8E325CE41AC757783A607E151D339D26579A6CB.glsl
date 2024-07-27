//C:\sagadata\SharedShaders/0xdcc084dc.ios_pcode ukjbell Wed Nov 13 18:16:07 2013

precision lowp float;

vec4 texture(sampler2D sampler, mediump vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }



struct VertexInput {
    vec4 _uvSet01;
    vec4 _uvSet23;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
};

struct FragmentOutput {
    vec4 _color[1];
};

FragmentOutput _TMP10;
vec3 _TMP6;
vec4 _TMP0;
vec4 _TMP5;
vec4 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VertexOutput _input1;
vec4 _colorLayer00096;
vec4 _colorLayer10096;
vec4 _colorLayer20096;
vec4 _TMP101;
vec3 _TMP860102;
vec4 _TMP105;
vec3 _TMP860106;
vec3 _diffuseLight0111;
vec3 _lightmapCol0111;
vec3 _TMP820115;
float _falloff0116;
vec3 _b0118;
uniform vec4 _fog_color;
uniform vec4 _layer0_diffuse;
uniform vec4 _layer1_diffuse;
uniform vec4 _layer2_diffuse;
uniform vec4 _layer_kOpacities;
uniform sampler2D _layer0_sampler;
uniform sampler2D _layer1_sampler;
uniform sampler2D _layer2_sampler;
uniform sampler2D _lightmap0;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying mediump vec4 cg_TexCoord1;
varying mediump vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying mediump vec4 cg_TexCoord0;
varying mediump vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 void main()
{


    _input1._varying_colorSet1 = vec4(float(cg_FrontSecondaryColor.x), float(cg_FrontSecondaryColor.y), float(cg_FrontSecondaryColor.z), float(cg_FrontSecondaryColor.w));
    _input1._texcoord4 = cg_TexCoord4.x;
    _input1._varying_colorSet0 = vec4(float(cg_FrontColor.x), float(cg_FrontColor.y), float(cg_FrontColor.z), float(cg_FrontColor.w));
    _TMP1 = texture(_layer0_sampler, cg_TexCoord0.xy);
    _colorLayer00096 = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _colorLayer00096.w = _colorLayer00096.w*_layer0_diffuse.w*_layer_kOpacities.x;
    _colorLayer00096 = _colorLayer00096*_input1._varying_colorSet0;
    _TMP2 = texture(_layer1_sampler, cg_TexCoord1.xy);
    _colorLayer10096 = vec4(float(_TMP2.x), float(_TMP2.y), float(_TMP2.z), float(_TMP2.w));
    _colorLayer10096.w = _colorLayer10096.w*_layer1_diffuse.w;
    _colorLayer10096.xyz = _colorLayer10096.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer10096.w = _colorLayer10096.w*_input1._varying_colorSet1.x*_layer_kOpacities.y;
    _TMP860102 = _colorLayer00096.xyz*(1.00000000E+000 - _colorLayer10096.w) + _colorLayer10096.xyz*_colorLayer10096.w;
    _TMP101 = vec4(_TMP860102.x, _TMP860102.y, _TMP860102.z, 1.00000000E+000 - (1.00000000E+000 - _colorLayer00096.w)*(1.00000000E+000 - _colorLayer10096.w));
    _TMP3 = texture(_layer2_sampler, cg_TexCoord2.xy);
    _colorLayer20096 = vec4(float(_TMP3.x), float(_TMP3.y), float(_TMP3.z), float(_TMP3.w));
    _colorLayer20096.w = _colorLayer20096.w*_layer2_diffuse.w;
    _colorLayer20096.xyz = _colorLayer20096.xyz*_input1._varying_colorSet0.xyz;
    _colorLayer20096.w = _colorLayer20096.w*_input1._varying_colorSet1.y*_layer_kOpacities.z;
    _TMP860106 = _TMP101.xyz*(1.00000000E+000 - _colorLayer20096.w) + _colorLayer20096.xyz*_colorLayer20096.w;
    _TMP105 = vec4(_TMP860106.x, _TMP860106.y, _TMP860106.z, 1.00000000E+000 - (1.00000000E+000 - _TMP101.w)*(1.00000000E+000 - _colorLayer20096.w));
    _TMP5 = texture(_lightmap0, cg_TexCoord3.xy);
    _lightmapCol0111 = vec3(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z));
    _diffuseLight0111 = _lightmapCol0111;
    if (cg_TexCoord3.x <= 0.00000000E+000) {         _diffuseLight0111 = vec3( 1.00000000E+000, 1.00000000E+000, 1.00000000E+000);
    }     _TMP820115 = _TMP105.xyz*_diffuseLight0111;
    _TMP0 = vec4(_TMP820115.x, _TMP820115.y, _TMP820115.z, _TMP105.w);
    _TMP10._color[0] = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    _falloff0116 = float(_input1._texcoord4);
    _b0118 = vec3(float(_TMP10._color[0].x), float(_TMP10._color[0].y), float(_TMP10._color[0].z));
    _TMP6 = _fog_color.xyz + _falloff0116*(_b0118 - _fog_color.xyz);
    _TMP10._color[0].xyz = vec3(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z));
    cg_FragColor = _TMP10._color[0];
    return;
} 
