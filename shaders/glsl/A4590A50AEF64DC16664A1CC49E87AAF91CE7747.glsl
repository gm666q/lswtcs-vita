//SharedShaders/0x37df8766.ios_vcode uklgonzale Tue Mar 11 16:20:18 2014

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
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
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
vec4 _C0093[4];
vec3 _v0097;
vec3 _TMP890097[3];
vec3 _r0099;
vec4 _r0106;
vec4 _v0106;
vec4 _r0108;
vec4 _r0114;
vec4 _M0114[4];
vec4 _v0120;
vec4 _b0122;
vec3 _r0131;
float _b0135;
float _a0137;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
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
vec3 _TMP148;
vec3 _TMP149;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0093[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0093[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0093[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0093[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0093[0].x), float(_C0093[0].y), float(_C0093[0].z), float(_C0093[0].w));
    _TMP17[1] = vec4(float(_C0093[1].x), float(_C0093[1].y), float(_C0093[1].z), float(_C0093[1].w));
    _TMP17[2] = vec4(float(_C0093[2].x), float(_C0093[2].y), float(_C0093[2].z), float(_C0093[2].w));
    _TMP17[3] = vec4(float(_C0093[3].x), float(_C0093[3].y), float(_C0093[3].z), float(_C0093[3].w));
    _v0097 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP138.x = _TMP17[0].x;
    _TMP139.y = _TMP17[0].y;
    _TMP140.z = _TMP17[0].z;
    _TMP890097[0] = vec3(float(_TMP138.x), float(_TMP139.y), float(_TMP140.z));
    _TMP141.x = _TMP17[1].x;
    _TMP142.y = _TMP17[1].y;
    _TMP143.z = _TMP17[1].z;
    _TMP890097[1] = vec3(float(_TMP141.x), float(_TMP142.y), float(_TMP143.z));
    _TMP144.x = _TMP17[2].x;
    _TMP145.y = _TMP17[2].y;
    _TMP146.z = _TMP17[2].z;
    _TMP890097[2] = vec3(float(_TMP144.x), float(_TMP145.y), float(_TMP146.z));
    _r0099 = _v0097.x*_TMP890097[0];
    _r0099 = _r0099 + _v0097.y*_TMP890097[1];
    _r0099 = _r0099 + _v0097.z*_TMP890097[2];
    _TMP19 = vec3(float(_r0099.x), float(_r0099.y), float(_r0099.z));
    _TMP20 = TEXCOORD0.xy + _uvOffset0;
    _v0106 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0106 = _v0106.x*_world[0];
    _r0106 = _r0106 + _v0106.y*_world[1];
    _r0106 = _r0106 + _v0106.z*_world[2];
    _r0106 = _r0106 + _v0106.w*_world[3];
    _r0108 = _r0106.x*_viewProj[0];
    _r0108 = _r0108 + _r0106.y*_viewProj[1];
    _r0108 = _r0108 + _r0106.z*_viewProj[2];
    _r0108 = _r0108 + _r0106.w*_viewProj[3];
    _M0114[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0114[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0114[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0114[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0114 = cg_Vertex.x*_M0114[0];
    _r0114 = _r0114 + cg_Vertex.y*_M0114[1];
    _r0114 = _r0114 + cg_Vertex.z*_M0114[2];
    _r0114 = _r0114 + cg_Vertex.w*_M0114[3];
    _TMP15._texcoord0.xyzw = vec4(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z), 1.00000000E+000);
    _TMP15._texcoord2.xy = vec2(float(_TMP20.x), float(_TMP20.y));
    _v0120 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0122 = vec4(float(_v0120.x), float(_v0120.y), float(_v0120.z), float(_v0120.w));
    _TMP8 = (_b0122);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP147.x = _ps2ShineMtx[0].x;
    _TMP147.y = _ps2ShineMtx[0].y;
    _TMP147.z = _ps2ShineMtx[0].z;
    _r0131 = _TMP4.x*_TMP147;
    _TMP148.x = _ps2ShineMtx[1].x;
    _TMP148.y = _ps2ShineMtx[1].y;
    _TMP148.z = _ps2ShineMtx[1].z;
    _r0131 = _r0131 + _TMP4.y*_TMP148;
    _TMP149.x = _ps2ShineMtx[2].x;
    _TMP149.y = _ps2ShineMtx[2].y;
    _TMP149.z = _ps2ShineMtx[2].z;
    _r0131 = _r0131 + _TMP4.z*_TMP149;
    _TMP15._texcoord3.xy = vec2(float(_r0131.x), float(_r0131.y));
    _TMP0 = length(_r0114.xyz);
    _b0135 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0135);
    _dist = float(_TMP1);
    _a0137 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0137), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP15._texcoord2;
    cg_TexCoord0 = _TMP15._texcoord0;
    cg_TexCoord3.xy = _TMP15._texcoord3;
    cg_TexCoord1.xyz = _r0114.xyz;
    cg_TexCoord4.x = _TMP15._texcoord4;
    gl_Position = _r0108;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
