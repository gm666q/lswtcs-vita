//SharedShaders/0x19a2539c.ios_vcode uklgonzale Wed Mar 12 15:14:41 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
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
vec2 _TMP21;
vec2 _TMP20;
vec4 _TMP17[4];
vec4 _C0087[4];
vec3 _v0091;
vec3 _TMP830091[3];
vec3 _r0093;
vec4 _r0102;
vec4 _v0102;
vec4 _r0104;
vec4 _r0110;
vec4 _M0110[4];
vec4 _v0115;
vec4 _b0117;
vec3 _r0126;
float _b0130;
float _a0132;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
vec3 _TMP133;
vec3 _TMP134;
vec3 _TMP135;
vec3 _TMP136;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
vec3 _TMP140;
vec3 _TMP141;
vec3 _TMP142;
vec3 _TMP143;
vec3 _TMP144;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
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

    _C0087[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0087[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0087[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0087[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0087[0].x), float(_C0087[0].y), float(_C0087[0].z), float(_C0087[0].w));
    _TMP17[1] = vec4(float(_C0087[1].x), float(_C0087[1].y), float(_C0087[1].z), float(_C0087[1].w));
    _TMP17[2] = vec4(float(_C0087[2].x), float(_C0087[2].y), float(_C0087[2].z), float(_C0087[2].w));
    _TMP17[3] = vec4(float(_C0087[3].x), float(_C0087[3].y), float(_C0087[3].z), float(_C0087[3].w));
    _v0091 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP133.x = _TMP17[0].x;
    _TMP134.y = _TMP17[0].y;
    _TMP135.z = _TMP17[0].z;
    _TMP830091[0] = vec3(float(_TMP133.x), float(_TMP134.y), float(_TMP135.z));
    _TMP136.x = _TMP17[1].x;
    _TMP137.y = _TMP17[1].y;
    _TMP138.z = _TMP17[1].z;
    _TMP830091[1] = vec3(float(_TMP136.x), float(_TMP137.y), float(_TMP138.z));
    _TMP139.x = _TMP17[2].x;
    _TMP140.y = _TMP17[2].y;
    _TMP141.z = _TMP17[2].z;
    _TMP830091[2] = vec3(float(_TMP139.x), float(_TMP140.y), float(_TMP141.z));
    _r0093 = _v0091.x*_TMP830091[0];
    _r0093 = _r0093 + _v0091.y*_TMP830091[1];
    _r0093 = _r0093 + _v0091.z*_TMP830091[2];
    _TMP19 = vec3(float(_r0093.x), float(_r0093.y), float(_r0093.z));
    _TMP20 = TEXCOORD0.xy + _uvOffset0;
    _TMP21.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
    _v0102 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0102 = _v0102.x*_world[0];
    _r0102 = _r0102 + _v0102.y*_world[1];
    _r0102 = _r0102 + _v0102.z*_world[2];
    _r0102 = _r0102 + _v0102.w*_world[3];
    _r0104 = _r0102.x*_viewProj[0];
    _r0104 = _r0104 + _r0102.y*_viewProj[1];
    _r0104 = _r0104 + _r0102.z*_viewProj[2];
    _r0104 = _r0104 + _r0102.w*_viewProj[3];
    _M0110[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0110[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0110[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0110[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0110 = cg_Vertex.x*_M0110[0];
    _r0110 = _r0110 + cg_Vertex.y*_M0110[1];
    _r0110 = _r0110 + cg_Vertex.z*_M0110[2];
    _r0110 = _r0110 + cg_Vertex.w*_M0110[3];
    _TMP15._texcoord0.xy = vec2(float(_TMP20.x), float(_TMP20.y));
    _TMP15._texcoord1.xy = vec2(float(_TMP21.x), float(_TMP21.y));
    _v0115 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0117 = vec4(float(_v0115.x), float(_v0115.y), float(_v0115.z), float(_v0115.w));
    _TMP8 = (_b0117);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP142.x = _ps2ShineMtx[0].x;
    _TMP142.y = _ps2ShineMtx[0].y;
    _TMP142.z = _ps2ShineMtx[0].z;
    _r0126 = _TMP4.x*_TMP142;
    _TMP143.x = _ps2ShineMtx[1].x;
    _TMP143.y = _ps2ShineMtx[1].y;
    _TMP143.z = _ps2ShineMtx[1].z;
    _r0126 = _r0126 + _TMP4.y*_TMP143;
    _TMP144.x = _ps2ShineMtx[2].x;
    _TMP144.y = _ps2ShineMtx[2].y;
    _TMP144.z = _ps2ShineMtx[2].z;
    _r0126 = _r0126 + _TMP4.z*_TMP144;
    _TMP15._texcoord2.xy = vec2(float(_r0126.x), float(_r0126.y));
    _TMP0 = length(_r0110.xyz);
    _b0130 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0130);
    _dist = float(_TMP1);
    _a0132 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0132), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP15._texcoord2;
    cg_TexCoord0.xy = _TMP15._texcoord0;
    cg_TexCoord3.x = _TMP15._texcoord3;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0104;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 