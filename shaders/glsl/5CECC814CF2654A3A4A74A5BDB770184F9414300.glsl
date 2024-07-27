//SharedShaders/0x8e69804c.ios_vcode uklgonzale Wed Mar 12 14:32:15 2014

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
    vec2 _texcoord1;
    float _texcoord2;
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
vec4 _C0089[4];
vec3 _v0093;
vec3 _TMP850093[3];
vec3 _r0095;
vec4 _r0100;
vec4 _v0100;
vec4 _r0102;
vec4 _r0108;
vec4 _M0108[4];
vec4 _v0112;
vec4 _b0114;
vec3 _r0123;
float _b0127;
float _a0129;
attribute vec4 NORMAL;
attribute vec4 COLOR;
vec3 _TMP130;
vec3 _TMP131;
vec3 _TMP132;
vec3 _TMP133;
vec3 _TMP134;
vec3 _TMP135;
vec3 _TMP136;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
vec3 _TMP140;
vec3 _TMP141;
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
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0089[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0089[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0089[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0089[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0089[0].x), float(_C0089[0].y), float(_C0089[0].z), float(_C0089[0].w));
    _TMP17[1] = vec4(float(_C0089[1].x), float(_C0089[1].y), float(_C0089[1].z), float(_C0089[1].w));
    _TMP17[2] = vec4(float(_C0089[2].x), float(_C0089[2].y), float(_C0089[2].z), float(_C0089[2].w));
    _TMP17[3] = vec4(float(_C0089[3].x), float(_C0089[3].y), float(_C0089[3].z), float(_C0089[3].w));
    _v0093 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP130.x = _TMP17[0].x;
    _TMP131.y = _TMP17[0].y;
    _TMP132.z = _TMP17[0].z;
    _TMP850093[0] = vec3(float(_TMP130.x), float(_TMP131.y), float(_TMP132.z));
    _TMP133.x = _TMP17[1].x;
    _TMP134.y = _TMP17[1].y;
    _TMP135.z = _TMP17[1].z;
    _TMP850093[1] = vec3(float(_TMP133.x), float(_TMP134.y), float(_TMP135.z));
    _TMP136.x = _TMP17[2].x;
    _TMP137.y = _TMP17[2].y;
    _TMP138.z = _TMP17[2].z;
    _TMP850093[2] = vec3(float(_TMP136.x), float(_TMP137.y), float(_TMP138.z));
    _r0095 = _v0093.x*_TMP850093[0];
    _r0095 = _r0095 + _v0093.y*_TMP850093[1];
    _r0095 = _r0095 + _v0093.z*_TMP850093[2];
    _TMP19 = vec3(float(_r0095.x), float(_r0095.y), float(_r0095.z));
    _v0100 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0100 = _v0100.x*_world[0];
    _r0100 = _r0100 + _v0100.y*_world[1];
    _r0100 = _r0100 + _v0100.z*_world[2];
    _r0100 = _r0100 + _v0100.w*_world[3];
    _r0102 = _r0100.x*_viewProj[0];
    _r0102 = _r0102 + _r0100.y*_viewProj[1];
    _r0102 = _r0102 + _r0100.z*_viewProj[2];
    _r0102 = _r0102 + _r0100.w*_viewProj[3];
    _M0108[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0108[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0108[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0108[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0108 = cg_Vertex.x*_M0108[0];
    _r0108 = _r0108 + cg_Vertex.y*_M0108[1];
    _r0108 = _r0108 + cg_Vertex.z*_M0108[2];
    _r0108 = _r0108 + cg_Vertex.w*_M0108[3];
    _TMP15._texcoord0.xyzw = vec4(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z), 1.00000000E+000);
    _v0112 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0114 = vec4(float(_v0112.x), float(_v0112.y), float(_v0112.z), float(_v0112.w));
    _TMP8 = (_b0114);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP139.x = _ps2ShineMtx[0].x;
    _TMP139.y = _ps2ShineMtx[0].y;
    _TMP139.z = _ps2ShineMtx[0].z;
    _r0123 = _TMP4.x*_TMP139;
    _TMP140.x = _ps2ShineMtx[1].x;
    _TMP140.y = _ps2ShineMtx[1].y;
    _TMP140.z = _ps2ShineMtx[1].z;
    _r0123 = _r0123 + _TMP4.y*_TMP140;
    _TMP141.x = _ps2ShineMtx[2].x;
    _TMP141.y = _ps2ShineMtx[2].y;
    _TMP141.z = _ps2ShineMtx[2].z;
    _r0123 = _r0123 + _TMP4.z*_TMP141;
    _TMP15._texcoord1.xy = vec2(float(_r0123.x), float(_r0123.y));
    _TMP0 = length(_r0108.xyz);
    _b0127 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0127);
    _dist = float(_TMP1);
    _a0129 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0129), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP15._texcoord2;
    cg_TexCoord0 = _TMP15._texcoord0;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0102;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
