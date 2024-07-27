//SharedShaders/0x119d862b.ios_vcode uklgonzale Wed Mar 12 20:28:16 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
    vec3 _texcoord1;
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
vec4 _TMP6;
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0088[4];
vec3 _v0092;
vec3 _TMP840092[3];
vec3 _r0094;
vec4 _r0099;
vec4 _v0099;
vec4 _r0101;
vec4 _r0107;
vec4 _M0107[4];
vec4 _v0112;
vec4 _b0114;
float _b0118;
float _a0120;
attribute vec4 NORMAL;
attribute vec4 COLOR;
vec3 _TMP121;
vec3 _TMP122;
vec3 _TMP123;
vec3 _TMP124;
vec3 _TMP125;
vec3 _TMP126;
vec3 _TMP127;
vec3 _TMP128;
vec3 _TMP129;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0088[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0088[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0088[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0088[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0088[0].x), float(_C0088[0].y), float(_C0088[0].z), float(_C0088[0].w));
    _TMP11[1] = vec4(float(_C0088[1].x), float(_C0088[1].y), float(_C0088[1].z), float(_C0088[1].w));
    _TMP11[2] = vec4(float(_C0088[2].x), float(_C0088[2].y), float(_C0088[2].z), float(_C0088[2].w));
    _TMP11[3] = vec4(float(_C0088[3].x), float(_C0088[3].y), float(_C0088[3].z), float(_C0088[3].w));
    _v0092 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP121.x = _TMP11[0].x;
    _TMP122.y = _TMP11[0].y;
    _TMP123.z = _TMP11[0].z;
    _TMP840092[0] = vec3(float(_TMP121.x), float(_TMP122.y), float(_TMP123.z));
    _TMP124.x = _TMP11[1].x;
    _TMP125.y = _TMP11[1].y;
    _TMP126.z = _TMP11[1].z;
    _TMP840092[1] = vec3(float(_TMP124.x), float(_TMP125.y), float(_TMP126.z));
    _TMP127.x = _TMP11[2].x;
    _TMP128.y = _TMP11[2].y;
    _TMP129.z = _TMP11[2].z;
    _TMP840092[2] = vec3(float(_TMP127.x), float(_TMP128.y), float(_TMP129.z));
    _r0094 = _v0092.x*_TMP840092[0];
    _r0094 = _r0094 + _v0092.y*_TMP840092[1];
    _r0094 = _r0094 + _v0092.z*_TMP840092[2];
    _TMP13 = vec3(float(_r0094.x), float(_r0094.y), float(_r0094.z));
    _v0099 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0099 = _v0099.x*_world[0];
    _r0099 = _r0099 + _v0099.y*_world[1];
    _r0099 = _r0099 + _v0099.z*_world[2];
    _r0099 = _r0099 + _v0099.w*_world[3];
    _r0101 = _r0099.x*_viewProj[0];
    _r0101 = _r0101 + _r0099.y*_viewProj[1];
    _r0101 = _r0101 + _r0099.z*_viewProj[2];
    _r0101 = _r0101 + _r0099.w*_viewProj[3];
    _M0107[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0107[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0107[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0107[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0107 = cg_Vertex.x*_M0107[0];
    _r0107 = _r0107 + cg_Vertex.y*_M0107[1];
    _r0107 = _r0107 + cg_Vertex.z*_M0107[2];
    _r0107 = _r0107 + cg_Vertex.w*_M0107[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _v0112 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0114 = vec4(float(_v0112.x), float(_v0112.y), float(_v0112.z), float(_v0112.w));
    _TMP6 = (_b0114);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0107.xyz);
    _b0118 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0118);
    _dist = float(_TMP1);
    _a0120 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0120), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord1.xyz = _r0107.xyz;
    gl_Position = _r0101;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
