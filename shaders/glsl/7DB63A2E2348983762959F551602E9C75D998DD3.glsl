//SharedShaders/0x9261665a.ios_vcode uklgonzale Wed Mar 12 15:13:16 2014

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
    float _texcoord1;
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
vec2 _TMP13;
vec4 _TMP11[4];
vec4 _C0071[4];
vec4 _r0078;
vec4 _v0078;
vec4 _r0080;
vec4 _r0086;
vec4 _M0086[4];
vec4 _v0090;
vec4 _b0092;
float _b0096;
float _a0098;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
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
    _TMP13 = TEXCOORD0.xy + _uvOffset0;
    _v0078 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0078 = _v0078.x*_world[0];
    _r0078 = _r0078 + _v0078.y*_world[1];
    _r0078 = _r0078 + _v0078.z*_world[2];
    _r0078 = _r0078 + _v0078.w*_world[3];
    _r0080 = _r0078.x*_viewProj[0];
    _r0080 = _r0080 + _r0078.y*_viewProj[1];
    _r0080 = _r0080 + _r0078.z*_viewProj[2];
    _r0080 = _r0080 + _r0078.w*_viewProj[3];
    _M0086[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0086[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0086[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0086[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0086 = cg_Vertex.x*_M0086[0];
    _r0086 = _r0086 + cg_Vertex.y*_M0086[1];
    _r0086 = _r0086 + cg_Vertex.z*_M0086[2];
    _r0086 = _r0086 + cg_Vertex.w*_M0086[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP13.x), float(_TMP13.y));
    _v0090 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0092 = vec4(float(_v0090.x), float(_v0090.y), float(_v0090.z), float(_v0090.w));
    _TMP6 = (_b0092);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0086.xyz);
    _b0096 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0096);
    _dist = float(_TMP1);
    _a0098 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0098), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord1 = float(_dd);
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_TexCoord1.x = _TMP9._texcoord1;
    gl_Position = _r0080;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
