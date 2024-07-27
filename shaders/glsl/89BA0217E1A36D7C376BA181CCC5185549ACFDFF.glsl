//SharedShaders/0x4e000cd8.ios_vcode uklgonzale Tue Mar 11 16:25:50 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    float _texcoord3;
};

struct FragmentOutput {
    vec4 _color[1];
};

VertexOutput _TMP15;
float _TMP2;
float _TMP6;
float _TMP1;
float _TMP0;
vec3 _TMP4;
vec3 _TMP19;
float _TMP10;
float _TMP9;
float _TMP12;
float _TMP11;
vec4 _TMP8;
vec2 _TMP20;
vec4 _TMP17[4];
vec4 _C0092[4];
vec3 _v0096;
vec3 _TMP880096[3];
vec3 _r0098;
vec4 _r0105;
vec4 _v0105;
vec4 _r0107;
vec4 _r0113;
vec4 _M0113[4];
vec4 _v0118;
vec4 _b0120;
vec3 _r0129;
float _b0133;
float _a0135;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP136;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
vec3 _TMP140;
vec3 _TMP141;
vec3 _TMP142;
vec3 _TMP143;
vec3 _TMP144;
vec3 _TMP145;
vec3 _TMP146;
vec3 _TMP147;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0092[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0092[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0092[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0092[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0092[0].x), float(_C0092[0].y), float(_C0092[0].z), float(_C0092[0].w));
    _TMP17[1] = vec4(float(_C0092[1].x), float(_C0092[1].y), float(_C0092[1].z), float(_C0092[1].w));
    _TMP17[2] = vec4(float(_C0092[2].x), float(_C0092[2].y), float(_C0092[2].z), float(_C0092[2].w));
    _TMP17[3] = vec4(float(_C0092[3].x), float(_C0092[3].y), float(_C0092[3].z), float(_C0092[3].w));
    _v0096 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP136.x = _TMP17[0].x;
    _TMP137.y = _TMP17[0].y;
    _TMP138.z = _TMP17[0].z;
    _TMP880096[0] = vec3(float(_TMP136.x), float(_TMP137.y), float(_TMP138.z));
    _TMP139.x = _TMP17[1].x;
    _TMP140.y = _TMP17[1].y;
    _TMP141.z = _TMP17[1].z;
    _TMP880096[1] = vec3(float(_TMP139.x), float(_TMP140.y), float(_TMP141.z));
    _TMP142.x = _TMP17[2].x;
    _TMP143.y = _TMP17[2].y;
    _TMP144.z = _TMP17[2].z;
    _TMP880096[2] = vec3(float(_TMP142.x), float(_TMP143.y), float(_TMP144.z));
    _r0098 = _v0096.x*_TMP880096[0];
    _r0098 = _r0098 + _v0096.y*_TMP880096[1];
    _r0098 = _r0098 + _v0096.z*_TMP880096[2];
    _TMP19 = vec3(float(_r0098.x), float(_r0098.y), float(_r0098.z));
    _TMP20 = TEXCOORD0.xy + _uvOffset0;
    _v0105 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0105 = _v0105.x*_world[0];
    _r0105 = _r0105 + _v0105.y*_world[1];
    _r0105 = _r0105 + _v0105.z*_world[2];
    _r0105 = _r0105 + _v0105.w*_world[3];
    _r0107 = _r0105.x*_viewProj[0];
    _r0107 = _r0107 + _r0105.y*_viewProj[1];
    _r0107 = _r0107 + _r0105.z*_viewProj[2];
    _r0107 = _r0107 + _r0105.w*_viewProj[3];
    _M0113[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0113[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0113[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0113[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0113 = cg_Vertex.x*_M0113[0];
    _r0113 = _r0113 + cg_Vertex.y*_M0113[1];
    _r0113 = _r0113 + cg_Vertex.z*_M0113[2];
    _r0113 = _r0113 + cg_Vertex.w*_M0113[3];
    _TMP15._texcoord0.xyzw = vec4(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z), 1.00000000E+000);
    _TMP15._texcoord1.xy = vec2(float(_TMP20.x), float(_TMP20.y));
    _v0118 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0120 = vec4(float(_v0118.x), float(_v0118.y), float(_v0118.z), float(_v0118.w));
    _TMP8 = (_b0120);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP145.x = _ps2ShineMtx[0].x;
    _TMP145.y = _ps2ShineMtx[0].y;
    _TMP145.z = _ps2ShineMtx[0].z;
    _r0129 = _TMP4.x*_TMP145;
    _TMP146.x = _ps2ShineMtx[1].x;
    _TMP146.y = _ps2ShineMtx[1].y;
    _TMP146.z = _ps2ShineMtx[1].z;
    _r0129 = _r0129 + _TMP4.y*_TMP146;
    _TMP147.x = _ps2ShineMtx[2].x;
    _TMP147.y = _ps2ShineMtx[2].y;
    _TMP147.z = _ps2ShineMtx[2].z;
    _r0129 = _r0129 + _TMP4.z*_TMP147;
    _TMP15._texcoord2.xy = vec2(float(_r0129.x), float(_r0129.y));
    _TMP0 = length(_r0113.xyz);
    _b0133 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0133);
    _dist = float(_TMP1);
    _a0135 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0135), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP15._texcoord2;
    cg_TexCoord0 = _TMP15._texcoord0;
    cg_TexCoord3.x = _TMP15._texcoord3;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0107;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
