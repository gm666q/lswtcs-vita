//C:\sagadata\SharedShaders/0x0bcaf142.ios_vcode ukjbell Wed Nov 13 18:08:04 2013

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    float _texcoord0;
};

struct FragmentOutput {
    vec4 _color[1];
};

VertexOutput _TMP9;
float _TMP1;
float _TMP4;
float _TMP3;
float _TMP0;
vec4 _TMP6;
vec4 _TMP11[4];
vec4 _C0068[4];
vec4 _r0073;
vec4 _v0073;
vec4 _r0075;
vec4 _r0081;
vec4 _M0081[4];
vec4 _v0084;
vec4 _b0086;
float _b0090;
float _a0092;
attribute vec4 COLOR;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord0;

 void main()
{

    float _eyePositionLength;
    float _dist;
    float _dd;

    _C0068[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0068[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0068[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0068[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0068[0].x), float(_C0068[0].y), float(_C0068[0].z), float(_C0068[0].w));
    _TMP11[1] = vec4(float(_C0068[1].x), float(_C0068[1].y), float(_C0068[1].z), float(_C0068[1].w));
    _TMP11[2] = vec4(float(_C0068[2].x), float(_C0068[2].y), float(_C0068[2].z), float(_C0068[2].w));
    _TMP11[3] = vec4(float(_C0068[3].x), float(_C0068[3].y), float(_C0068[3].z), float(_C0068[3].w));
    _v0073 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0073 = _v0073.x*_world[0];
    _r0073 = _r0073 + _v0073.y*_world[1];
    _r0073 = _r0073 + _v0073.z*_world[2];
    _r0073 = _r0073 + _v0073.w*_world[3];
    _r0075 = _r0073.x*_viewProj[0];
    _r0075 = _r0075 + _r0073.y*_viewProj[1];
    _r0075 = _r0075 + _r0073.z*_viewProj[2];
    _r0075 = _r0075 + _r0073.w*_viewProj[3];
    _M0081[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0081[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0081[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0081[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0081 = cg_Vertex.x*_M0081[0];
    _r0081 = _r0081 + cg_Vertex.y*_M0081[1];
    _r0081 = _r0081 + cg_Vertex.z*_M0081[2];
    _r0081 = _r0081 + cg_Vertex.w*_M0081[3];
    _v0084 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0086 = vec4(float(_v0084.x), float(_v0084.y), float(_v0084.z), float(_v0084.w));
    _TMP6 = (_b0086);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0081.xyz);
    _eyePositionLength = float(_TMP0);
    _b0090 = _eyePositionLength - _fog_params.x;
    _TMP3 = max(0.00000000E+000, float(_b0090));
    _dist = float(_TMP3);
    _a0092 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0092), 1.00000000E+000);
    _TMP1 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP1)));
    _TMP9._texcoord0 = float(_dd);
    cg_TexCoord0.x = _TMP9._texcoord0;
    gl_Position = _r0075;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
