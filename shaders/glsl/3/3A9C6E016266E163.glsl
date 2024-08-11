//C:\sagadata\SharedShaders/0x32aa96df.ios_vcode ukjbell Wed Nov 13 18:08:03 2013

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
};

struct FragmentOutput {
    vec4 _color[1];
};

VertexOutput _TMP3;
vec4 _TMP0;
vec4 _v0058;
vec4 _b0060;
attribute vec4 COLOR;
uniform vec4 _kTint;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;

 void main()
{


    _v0058 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0060 = vec4(float(_v0058.x), float(_v0058.y), float(_v0058.z), float(_v0058.w));
    _TMP0 = (_b0060);
    _TMP3._varying_colorSet0 = vec4(float(_TMP0.x), float(_TMP0.y), float(_TMP0.z), float(_TMP0.w));
    gl_Position = cg_Vertex;
    cg_FrontColor = vec4(float(_TMP3._varying_colorSet0.x), float(_TMP3._varying_colorSet0.y), float(_TMP3._varying_colorSet0.z), float(_TMP3._varying_colorSet0.w));
    return;
} 
