//SharedShaders/0x83a19ae2.ios_vcode uklgonzale Wed Mar 12 16:44:07 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
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
vec4 _TMP17[4];
vec4 _C0080[4];
vec3 _v0084;
vec3 _TMP760084[3];
vec3 _r0086;
vec4 _r0091;
vec4 _v0091;
vec4 _r0093;
vec4 _r0099;
vec4 _M0099[4];
vec4 _v0102;
vec4 _b0104;
vec3 _r0113;
float _b0117;
float _a0119;
attribute vec4 NORMAL;
attribute vec4 COLOR;
vec3 _TMP120;
vec3 _TMP121;
vec3 _TMP122;
vec3 _TMP123;
vec3 _TMP124;
vec3 _TMP125;
vec3 _TMP126;
vec3 _TMP127;
vec3 _TMP128;
vec3 _TMP129;
vec3 _TMP130;
vec3 _TMP131;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 void main()
{

    float _dist;
    float _dd;

    _C0080[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0080[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0080[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0080[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0080[0].x), float(_C0080[0].y), float(_C0080[0].z), float(_C0080[0].w));
    _TMP17[1] = vec4(float(_C0080[1].x), float(_C0080[1].y), float(_C0080[1].z), float(_C0080[1].w));
    _TMP17[2] = vec4(float(_C0080[2].x), float(_C0080[2].y), float(_C0080[2].z), float(_C0080[2].w));
    _TMP17[3] = vec4(float(_C0080[3].x), float(_C0080[3].y), float(_C0080[3].z), float(_C0080[3].w));
    _v0084 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP120.x = _TMP17[0].x;
    _TMP121.y = _TMP17[0].y;
    _TMP122.z = _TMP17[0].z;
    _TMP760084[0] = vec3(float(_TMP120.x), float(_TMP121.y), float(_TMP122.z));
    _TMP123.x = _TMP17[1].x;
    _TMP124.y = _TMP17[1].y;
    _TMP125.z = _TMP17[1].z;
    _TMP760084[1] = vec3(float(_TMP123.x), float(_TMP124.y), float(_TMP125.z));
    _TMP126.x = _TMP17[2].x;
    _TMP127.y = _TMP17[2].y;
    _TMP128.z = _TMP17[2].z;
    _TMP760084[2] = vec3(float(_TMP126.x), float(_TMP127.y), float(_TMP128.z));
    _r0086 = _v0084.x*_TMP760084[0];
    _r0086 = _r0086 + _v0084.y*_TMP760084[1];
    _r0086 = _r0086 + _v0084.z*_TMP760084[2];
    _TMP19 = vec3(float(_r0086.x), float(_r0086.y), float(_r0086.z));
    _v0091 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0091 = _v0091.x*_world[0];
    _r0091 = _r0091 + _v0091.y*_world[1];
    _r0091 = _r0091 + _v0091.z*_world[2];
    _r0091 = _r0091 + _v0091.w*_world[3];
    _r0093 = _r0091.x*_viewProj[0];
    _r0093 = _r0093 + _r0091.y*_viewProj[1];
    _r0093 = _r0093 + _r0091.z*_viewProj[2];
    _r0093 = _r0093 + _r0091.w*_viewProj[3];
    _M0099[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0099[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0099[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0099[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0099 = cg_Vertex.x*_M0099[0];
    _r0099 = _r0099 + cg_Vertex.y*_M0099[1];
    _r0099 = _r0099 + cg_Vertex.z*_M0099[2];
    _r0099 = _r0099 + cg_Vertex.w*_M0099[3];
    _v0102 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0104 = vec4(float(_v0102.x), float(_v0102.y), float(_v0102.z), float(_v0102.w));
    _TMP8 = (_b0104);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP129.x = _ps2ShineMtx[0].x;
    _TMP129.y = _ps2ShineMtx[0].y;
    _TMP129.z = _ps2ShineMtx[0].z;
    _r0113 = _TMP4.x*_TMP129;
    _TMP130.x = _ps2ShineMtx[1].x;
    _TMP130.y = _ps2ShineMtx[1].y;
    _TMP130.z = _ps2ShineMtx[1].z;
    _r0113 = _r0113 + _TMP4.y*_TMP130;
    _TMP131.x = _ps2ShineMtx[2].x;
    _TMP131.y = _ps2ShineMtx[2].y;
    _TMP131.z = _ps2ShineMtx[2].z;
    _r0113 = _r0113 + _TMP4.z*_TMP131;
    _TMP15._texcoord0.xy = vec2(float(_r0113.x), float(_r0113.y));
    _TMP0 = length(_r0099.xyz);
    _b0117 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0117);
    _dist = float(_TMP1);
    _a0119 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0119), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord1 = float(_dd);
    cg_TexCoord0.xy = _TMP15._texcoord0;
    cg_TexCoord1.x = _TMP15._texcoord1;
    gl_Position = _r0093;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
