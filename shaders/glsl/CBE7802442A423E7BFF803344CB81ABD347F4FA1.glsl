//C:\sagadata\SharedShaders/0x04c1c9d8.ios_vcode ukjbell Wed Nov 13 18:08:02 2013

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
};

struct FragmentOutput {
    vec4 _color[1];
};

VertexOutput _TMP3;
vec4 _TMP0;
vec2 _TMP5;
vec4 _v0065;
vec4 _b0067;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
uniform vec4 _kTint;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord0;

 void main()
{


    _TMP5 = TEXCOORD0.xy + _uvOffset0;
    _TMP3._texcoord0.xy = vec2(float(_TMP5.x), float(_TMP5.y));
    _v0065 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0067 = vec4(float(_v0065.x), float(_v0065.y), float(_v0065.z), float(_v0065.w));
    _TMP0 = (_b0067);
    _TMP3._varying_colorSet0 = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    cg_TexCoord0.xy = _TMP3._texcoord0;
    gl_Position = cg_Vertex;
    cg_FrontColor = vec4(float(_TMP3._varying_colorSet0.x), float(_TMP3._varying_colorSet0.y), float(_TMP3._varying_colorSet0.z), float(_TMP3._varying_colorSet0.w));
    return;
} 
