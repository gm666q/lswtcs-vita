//SharedShaders/0x4444e784.ios_vcode uklgonzale Wed Mar 12 17:37:57 2014

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
    vec2 _texcoord0;
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
vec2 _TMP20;
vec4 _TMP17[4];
vec4 _C0086[4];
vec3 _v0090;
vec3 _TMP820090[3];
vec3 _r0092;
vec4 _r0099;
vec4 _v0099;
vec4 _r0101;
vec4 _r0107;
vec4 _M0107[4];
vec4 _v0111;
vec4 _b0113;
vec3 _r0122;
float _b0126;
float _a0128;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP129;
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
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0086[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0086[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0086[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0086[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0086[0].x), float(_C0086[0].y), float(_C0086[0].z), float(_C0086[0].w));
    _TMP17[1] = vec4(float(_C0086[1].x), float(_C0086[1].y), float(_C0086[1].z), float(_C0086[1].w));
    _TMP17[2] = vec4(float(_C0086[2].x), float(_C0086[2].y), float(_C0086[2].z), float(_C0086[2].w));
    _TMP17[3] = vec4(float(_C0086[3].x), float(_C0086[3].y), float(_C0086[3].z), float(_C0086[3].w));
    _v0090 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP129.x = _TMP17[0].x;
    _TMP130.y = _TMP17[0].y;
    _TMP131.z = _TMP17[0].z;
    _TMP820090[0] = vec3(float(_TMP129.x), float(_TMP130.y), float(_TMP131.z));
    _TMP132.x = _TMP17[1].x;
    _TMP133.y = _TMP17[1].y;
    _TMP134.z = _TMP17[1].z;
    _TMP820090[1] = vec3(float(_TMP132.x), float(_TMP133.y), float(_TMP134.z));
    _TMP135.x = _TMP17[2].x;
    _TMP136.y = _TMP17[2].y;
    _TMP137.z = _TMP17[2].z;
    _TMP820090[2] = vec3(float(_TMP135.x), float(_TMP136.y), float(_TMP137.z));
    _r0092 = _v0090.x*_TMP820090[0];
    _r0092 = _r0092 + _v0090.y*_TMP820090[1];
    _r0092 = _r0092 + _v0090.z*_TMP820090[2];
    _TMP19 = vec3(float(_r0092.x), float(_r0092.y), float(_r0092.z));
    _TMP20 = TEXCOORD0.xy + _uvOffset0;
    _v0099 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0099 = _v0099.x*_world[0];
    _r0099 = _r0099 + _v0099.y*_world[1];
    _r0099 = _r0099 + _v0099.z*_world[2];
    _r0099 = _r0099 + _v0099.w*_world[3];
    _r0101 = _r0099.x*_viewProj[0];
    _r0101 = _r0101 + _r0099.y*_viewProj[1];
    _r0101 = _r0101 + _r0099.z*_viewProj[2];
    _r0101 = _r0101 + _r0099.w*_viewProj[3];
    _M0107[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0107[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0107[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0107[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0107 = cg_Vertex.x*_M0107[0];
    _r0107 = _r0107 + cg_Vertex.y*_M0107[1];
    _r0107 = _r0107 + cg_Vertex.z*_M0107[2];
    _r0107 = _r0107 + cg_Vertex.w*_M0107[3];
    _TMP15._texcoord0.xy = vec2(float(_TMP20.x), float(_TMP20.y));
    _v0111 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0113 = vec4(float(_v0111.x), float(_v0111.y), float(_v0111.z), float(_v0111.w));
    _TMP8 = (_b0113);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP138.x = _ps2ShineMtx[0].x;
    _TMP138.y = _ps2ShineMtx[0].y;
    _TMP138.z = _ps2ShineMtx[0].z;
    _r0122 = _TMP4.x*_TMP138;
    _TMP139.x = _ps2ShineMtx[1].x;
    _TMP139.y = _ps2ShineMtx[1].y;
    _TMP139.z = _ps2ShineMtx[1].z;
    _r0122 = _r0122 + _TMP4.y*_TMP139;
    _TMP140.x = _ps2ShineMtx[2].x;
    _TMP140.y = _ps2ShineMtx[2].y;
    _TMP140.z = _ps2ShineMtx[2].z;
    _r0122 = _r0122 + _TMP4.z*_TMP140;
    _TMP15._texcoord1.xy = vec2(float(_r0122.x), float(_r0122.y));
    _TMP0 = length(_r0107.xyz);
    _b0126 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0126);
    _dist = float(_TMP1);
    _a0128 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0128), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP15._texcoord2;
    cg_TexCoord0.xy = _TMP15._texcoord0;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0101;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
