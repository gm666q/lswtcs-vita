//SharedShaders/0x1d0df3e6.ios_vcode uklgonzale Wed Mar 12 18:58:22 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _uvSet23;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
};

struct FragmentOutput {
    vec4 _color[1];
};

VertexOutput _TMP9;
float _TMP2;
float _TMP4;
float _TMP1;
float _TMP0;
VertexInput _TMP8;
vec4 _TMP6;
vec2 _TMP15;
vec4 _TMP12;
vec2 _TMP14;
vec4 _TMP11[4];
float _TMP17;
vec4 _C0081[4];
vec4 _objectPosition0092;
vec4 _r0096;
vec4 _v0096;
vec4 _r0098;
vec4 _r0104;
vec4 _M0104[4];
vec4 _v0109;
vec4 _b0111;
float _b0115;
float _a0117;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD1;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
uniform vec4 _waterTable[32];
uniform vec4 _fxAttributes;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _TMP8._colorSet0 = COLOR;
    _C0081[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0081[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0081[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0081[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0081[0].x), float(_C0081[0].y), float(_C0081[0].z), float(_C0081[0].w));
    _TMP11[1] = vec4(float(_C0081[1].x), float(_C0081[1].y), float(_C0081[1].z), float(_C0081[1].w));
    _TMP11[2] = vec4(float(_C0081[2].x), float(_C0081[2].y), float(_C0081[2].z), float(_C0081[2].w));
    _TMP11[3] = vec4(float(_C0081[3].x), float(_C0081[3].y), float(_C0081[3].z), float(_C0081[3].w));
    _TMP17 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP17))];
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _TMP15.xy = vec2(float((vec2(float(TEXCOORD1.z), float(TEXCOORD1.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD1.z), float(TEXCOORD1.w)) + _lightmapOffset.xy).y));
    _objectPosition0092 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0096 = vec4(_objectPosition0092.x, _objectPosition0092.y, _objectPosition0092.z, 1.00000000E+000);
    _r0096 = _v0096.x*_world[0];
    _r0096 = _r0096 + _v0096.y*_world[1];
    _r0096 = _r0096 + _v0096.z*_world[2];
    _r0096 = _r0096 + _v0096.w*_world[3];
    _r0098 = _r0096.x*_viewProj[0];
    _r0098 = _r0098 + _r0096.y*_viewProj[1];
    _r0098 = _r0098 + _r0096.z*_viewProj[2];
    _r0098 = _r0098 + _r0096.w*_viewProj[3];
    _M0104[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0104[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0104[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0104[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0104 = cg_Vertex.x*_M0104[0];
    _r0104 = _r0104 + cg_Vertex.y*_M0104[1];
    _r0104 = _r0104 + cg_Vertex.z*_M0104[2];
    _r0104 = _r0104 + cg_Vertex.w*_M0104[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP14.x), float(_TMP14.y)) + (5.00000007E-002*float(_fxAttributes.z))*vec2(float(_TMP12.x), float(_TMP12.y));
    _TMP9._texcoord1.xy = vec2(float(_TMP15.x), float(_TMP15.y));
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0109 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0111 = vec4(float(_v0109.x), float(_v0109.y), float(_v0109.z), float(_v0109.w));
    _TMP6 = (_b0111);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0104.xyz);
    _b0115 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0115);
    _dist = float(_TMP1);
    _a0117 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0117), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP9._texcoord2;
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_TexCoord1.xy = _TMP9._texcoord1;
    gl_Position = _r0098;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
