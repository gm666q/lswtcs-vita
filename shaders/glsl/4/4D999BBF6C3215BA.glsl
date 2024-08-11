//SharedShaders/0xcb56717a.ios_vcode uklgonzale Wed Mar 12 14:32:09 2014

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
float _TMP2;
float _TMP4;
float _TMP1;
float _TMP0;
vec4 _TMP6;
vec4 _TMP11[4];
vec4 _C0071[4];
vec4 _r0076;
vec4 _v0076;
vec4 _r0078;
vec4 _r0084;
vec4 _M0084[4];
vec4 _v0087;
vec4 _b0089;
float _b0093;
float _a0095;
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

    float _dist;
    float _dd;

    _C0071[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0071[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0071[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0071[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0071[0].x), float(_C0071[0].y), float(_C0071[0].z), float(_C0071[0].w));
    _TMP11[1] = vec4(float(_C0071[1].x), float(_C0071[1].y), float(_C0071[1].z), float(_C0071[1].w));
    _TMP11[2] = vec4(float(_C0071[2].x), float(_C0071[2].y), float(_C0071[2].z), float(_C0071[2].w));
    _TMP11[3] = vec4(float(_C0071[3].x), float(_C0071[3].y), float(_C0071[3].z), float(_C0071[3].w));
    _v0076 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0076 = _v0076.x*_world[0];
    _r0076 = _r0076 + _v0076.y*_world[1];
    _r0076 = _r0076 + _v0076.z*_world[2];
    _r0076 = _r0076 + _v0076.w*_world[3];
    _r0078 = _r0076.x*_viewProj[0];
    _r0078 = _r0078 + _r0076.y*_viewProj[1];
    _r0078 = _r0078 + _r0076.z*_viewProj[2];
    _r0078 = _r0078 + _r0076.w*_viewProj[3];
    _M0084[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0084[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0084[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0084[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0084 = cg_Vertex.x*_M0084[0];
    _r0084 = _r0084 + cg_Vertex.y*_M0084[1];
    _r0084 = _r0084 + cg_Vertex.z*_M0084[2];
    _r0084 = _r0084 + cg_Vertex.w*_M0084[3];
    _v0087 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0089 = vec4(float(_v0087.x), float(_v0087.y), float(_v0087.z), float(_v0087.w));
    _TMP6 = (_b0089);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0084.xyz);
    _b0093 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0093);
    _dist = float(_TMP1);
    _a0095 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0095), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord0 = float(_dd);
    cg_TexCoord0.x = _TMP9._texcoord0;
    gl_Position = _r0078;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 