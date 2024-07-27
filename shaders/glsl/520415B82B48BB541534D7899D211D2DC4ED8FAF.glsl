//SharedShaders/0x34d403dc.ios_vcode uklgonzale Tue Mar 11 16:25:44 2014

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
VertexInput _TMP8;
vec4 _TMP6;
vec3 _TMP14;
vec4 _TMP11[4];
vec4 _TMP12;
float _TMP16;
vec4 _C0083[4];
vec3 _v0087;
vec3 _TMP790087[3];
vec3 _r0089;
vec4 _objectPosition0096;
vec4 _r0100;
vec4 _v0100;
vec4 _r0102;
vec4 _r0108;
vec4 _M0108[4];
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
uniform vec4 _waterTable[32];
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 void main()
{

    float _dist;
    float _dd;

    _TMP8._colorSet0 = COLOR;
    _C0083[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0083[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0083[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0083[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0083[0].x), float(_C0083[0].y), float(_C0083[0].z), float(_C0083[0].w));
    _TMP11[1] = vec4(float(_C0083[1].x), float(_C0083[1].y), float(_C0083[1].z), float(_C0083[1].w));
    _TMP11[2] = vec4(float(_C0083[2].x), float(_C0083[2].y), float(_C0083[2].z), float(_C0083[2].w));
    _TMP11[3] = vec4(float(_C0083[3].x), float(_C0083[3].y), float(_C0083[3].z), float(_C0083[3].w));
    _v0087 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP121.x = _TMP11[0].x;
    _TMP122.y = _TMP11[0].y;
    _TMP123.z = _TMP11[0].z;
    _TMP790087[0] = vec3(float(_TMP121.x), float(_TMP122.y), float(_TMP123.z));
    _TMP124.x = _TMP11[1].x;
    _TMP125.y = _TMP11[1].y;
    _TMP126.z = _TMP11[1].z;
    _TMP790087[1] = vec3(float(_TMP124.x), float(_TMP125.y), float(_TMP126.z));
    _TMP127.x = _TMP11[2].x;
    _TMP128.y = _TMP11[2].y;
    _TMP129.z = _TMP11[2].z;
    _TMP790087[2] = vec3(float(_TMP127.x), float(_TMP128.y), float(_TMP129.z));
    _r0089 = _v0087.x*_TMP790087[0];
    _r0089 = _r0089 + _v0087.y*_TMP790087[1];
    _r0089 = _r0089 + _v0087.z*_TMP790087[2];
    _TMP14 = vec3(float(_r0089.x), float(_r0089.y), float(_r0089.z));
    _TMP16 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP16))];
    _objectPosition0096 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0100 = vec4(_objectPosition0096.x, _objectPosition0096.y, _objectPosition0096.z, 1.00000000E+000);
    _r0100 = _v0100.x*_world[0];
    _r0100 = _r0100 + _v0100.y*_world[1];
    _r0100 = _r0100 + _v0100.z*_world[2];
    _r0100 = _r0100 + _v0100.w*_world[3];
    _r0102 = _r0100.x*_viewProj[0];
    _r0102 = _r0102 + _r0100.y*_viewProj[1];
    _r0102 = _r0102 + _r0100.z*_viewProj[2];
    _r0102 = _r0102 + _r0100.w*_viewProj[3];
    _M0108[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0108[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0108[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0108[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0108 = cg_Vertex.x*_M0108[0];
    _r0108 = _r0108 + cg_Vertex.y*_M0108[1];
    _r0108 = _r0108 + cg_Vertex.z*_M0108[2];
    _r0108 = _r0108 + cg_Vertex.w*_M0108[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP14.x), float(_TMP14.y), float(_TMP14.z), 1.00000000E+000);
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0112 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0114 = vec4(float(_v0112.x), float(_v0112.y), float(_v0112.z), float(_v0112.w));
    _TMP6 = (_b0114);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0108.xyz);
    _b0118 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0118);
    _dist = float(_TMP1);
    _a0120 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0120), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord1 = float(_dd);
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord1.x = _TMP9._texcoord1;
    gl_Position = _r0102;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
