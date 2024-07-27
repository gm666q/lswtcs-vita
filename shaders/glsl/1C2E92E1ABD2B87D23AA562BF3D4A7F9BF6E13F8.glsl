//SharedShaders/0x179d886e.ios_vcode uklgonzale Tue Mar 11 16:24:43 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
    vec4 _blendWeight0;
    vec4 _blendIndices0;
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

VertexOutput _TMP17;
float _TMP2;
float _TMP8;
float _TMP1;
float _TMP0;
vec3 _TMP6;
vec3 _TMP22;
float _TMP12;
float _TMP11;
float _TMP14;
float _TMP13;
vec4 _TMP10;
vec2 _TMP23;
vec4 _TMP20;
vec4 _TMP19[4];
vec4 _TMP5;
vec4 _C0097[4];
vec3 _normal0099;
vec3 _v0101;
vec3 _r0103;
vec3 _M0103[3];
vec3 _r0105;
vec3 _M0105[3];
vec3 _v0107;
vec3 _v0113;
vec3 _TMP910113[3];
vec3 _r0115;
vec4 _skinMatrix00120[4];
vec4 _skinMatrix10120[4];
vec4 _r0122;
vec4 _r0124;
vec4 _r0128;
vec4 _r0130;
vec4 _r0136;
vec4 _M0136[4];
vec4 _v0142;
vec4 _b0144;
vec3 _r0153;
float _b0157;
float _a0159;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 BLENDWEIGHT0;
attribute vec4 BLENDINDICES0;
attribute vec4 TEXCOORD0;
vec3 _TMP160;
vec3 _TMP161;
vec3 _TMP162;
vec3 _TMP163;
vec3 _TMP164;
vec3 _TMP165;
vec3 _TMP166;
vec3 _TMP167;
vec3 _TMP168;
vec3 _TMP169;
vec3 _TMP170;
vec3 _TMP171;
vec3 _TMP172;
vec3 _TMP173;
vec3 _TMP174;
vec3 _TMP175;
vec3 _TMP176;
vec3 _TMP177;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _skinMatrix[36];
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

    _C0097[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0097[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0097[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0097[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP19[0] = vec4(float(_C0097[0].x), float(_C0097[0].y), float(_C0097[0].z), float(_C0097[0].w));
    _TMP19[1] = vec4(float(_C0097[1].x), float(_C0097[1].y), float(_C0097[1].z), float(_C0097[1].w));
    _TMP19[2] = vec4(float(_C0097[2].x), float(_C0097[2].y), float(_C0097[2].z), float(_C0097[2].w));
    _TMP19[3] = vec4(float(_C0097[3].x), float(_C0097[3].y), float(_C0097[3].z), float(_C0097[3].w));
    _normal0099 = NORMAL.xyz*2.00000000E+000 - 1.00000000E+000;
    _TMP160.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].x;
    _TMP160.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].y;
    _TMP160.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].z;
    _TMP161.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].x;
    _TMP161.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].y;
    _TMP161.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].z;
    _TMP162.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].x;
    _TMP162.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].y;
    _TMP162.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].z;
    _M0103[0] = vec3(float(_TMP160.x), float(_TMP160.y), float(_TMP160.z));
    _M0103[1] = vec3(float(_TMP161.x), float(_TMP161.y), float(_TMP161.z));
    _M0103[2] = vec3(float(_TMP162.x), float(_TMP162.y), float(_TMP162.z));
    _r0103 = _normal0099.x*_M0103[0];
    _r0103 = _r0103 + _normal0099.y*_M0103[1];
    _r0103 = _r0103 + _normal0099.z*_M0103[2];
    _TMP163.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].x;
    _TMP163.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].y;
    _TMP163.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].z;
    _TMP164.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].x;
    _TMP164.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].y;
    _TMP164.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].z;
    _TMP165.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].x;
    _TMP165.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].y;
    _TMP165.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].z;
    _M0105[0] = vec3(float(_TMP163.x), float(_TMP163.y), float(_TMP163.z));
    _M0105[1] = vec3(float(_TMP164.x), float(_TMP164.y), float(_TMP164.z));
    _M0105[2] = vec3(float(_TMP165.x), float(_TMP165.y), float(_TMP165.z));
    _r0105 = _normal0099.x*_M0105[0];
    _r0105 = _r0105 + _normal0099.y*_M0105[1];
    _r0105 = _r0105 + _normal0099.z*_M0105[2];
    _v0107 = _r0103*BLENDWEIGHT0.x + _r0105*(1.00000000E+000 - BLENDWEIGHT0.x);
    _TMP13 = dot(vec3(float(_v0107.x), float(_v0107.y), float(_v0107.z)), vec3(float(_v0107.x), float(_v0107.y), float(_v0107.z)));
    _TMP11 = float(_TMP13);
    _TMP14 = inversesqrt(float(_TMP11));
    _TMP12 = float(_TMP14);
    _v0101 = _TMP12*_v0107;
    _v0113 = vec3(float(_v0101.x), float(_v0101.y), float(_v0101.z));
    _TMP166.x = _TMP19[0].x;
    _TMP167.y = _TMP19[0].y;
    _TMP168.z = _TMP19[0].z;
    _TMP910113[0] = vec3(float(_TMP166.x), float(_TMP167.y), float(_TMP168.z));
    _TMP169.x = _TMP19[1].x;
    _TMP170.y = _TMP19[1].y;
    _TMP171.z = _TMP19[1].z;
    _TMP910113[1] = vec3(float(_TMP169.x), float(_TMP170.y), float(_TMP171.z));
    _TMP172.x = _TMP19[2].x;
    _TMP173.y = _TMP19[2].y;
    _TMP174.z = _TMP19[2].z;
    _TMP910113[2] = vec3(float(_TMP172.x), float(_TMP173.y), float(_TMP174.z));
    _r0115 = _v0113.x*_TMP910113[0];
    _r0115 = _r0115 + _v0113.y*_TMP910113[1];
    _r0115 = _r0115 + _v0113.z*_TMP910113[2];
    _TMP22 = vec3(float(_r0115.x), float(_r0115.y), float(_r0115.z));
    _TMP23 = TEXCOORD0.xy + _uvOffset0;
    _skinMatrix00120[0] = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)];
    _skinMatrix00120[1] = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)];
    _skinMatrix00120[2] = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)];
    _skinMatrix00120[3] = _skinMatrix[(4*int(BLENDINDICES0.x) + 3)];
    _skinMatrix10120[0] = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)];
    _skinMatrix10120[1] = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)];
    _skinMatrix10120[2] = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)];
    _skinMatrix10120[3] = _skinMatrix[(4*int(BLENDINDICES0.y) + 3)];
    _r0122 = cg_Vertex.x*_skinMatrix00120[0];
    _r0122 = _r0122 + cg_Vertex.y*_skinMatrix00120[1];
    _r0122 = _r0122 + cg_Vertex.z*_skinMatrix00120[2];
    _r0122 = _r0122 + cg_Vertex.w*_skinMatrix00120[3];
    _r0124 = cg_Vertex.x*_skinMatrix10120[0];
    _r0124 = _r0124 + cg_Vertex.y*_skinMatrix10120[1];
    _r0124 = _r0124 + cg_Vertex.z*_skinMatrix10120[2];
    _r0124 = _r0124 + cg_Vertex.w*_skinMatrix10120[3];
    _TMP5 = vec4(float((_r0122*float(BLENDWEIGHT0.x) + _r0124*float(BLENDWEIGHT0.y)).x), float((_r0122*float(BLENDWEIGHT0.x) + _r0124*float(BLENDWEIGHT0.y)).y), float((_r0122*float(BLENDWEIGHT0.x) + _r0124*float(BLENDWEIGHT0.y)).z), float((_r0122*float(BLENDWEIGHT0.x) + _r0124*float(BLENDWEIGHT0.y)).w));
    _TMP20 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _r0128 = _TMP20.x*_world[0];
    _r0128 = _r0128 + _TMP20.y*_world[1];
    _r0128 = _r0128 + _TMP20.z*_world[2];
    _r0128 = _r0128 + _TMP20.w*_world[3];
    _r0130 = _r0128.x*_viewProj[0];
    _r0130 = _r0130 + _r0128.y*_viewProj[1];
    _r0130 = _r0130 + _r0128.z*_viewProj[2];
    _r0130 = _r0130 + _r0128.w*_viewProj[3];
    _M0136[0] = vec4(float(_TMP19[0].x), float(_TMP19[0].y), float(_TMP19[0].z), float(_TMP19[0].w));
    _M0136[1] = vec4(float(_TMP19[1].x), float(_TMP19[1].y), float(_TMP19[1].z), float(_TMP19[1].w));
    _M0136[2] = vec4(float(_TMP19[2].x), float(_TMP19[2].y), float(_TMP19[2].z), float(_TMP19[2].w));
    _M0136[3] = vec4(float(_TMP19[3].x), float(_TMP19[3].y), float(_TMP19[3].z), float(_TMP19[3].w));
    _r0136 = _TMP20.x*_M0136[0];
    _r0136 = _r0136 + _TMP20.y*_M0136[1];
    _r0136 = _r0136 + _TMP20.z*_M0136[2];
    _r0136 = _r0136 + _TMP20.w*_M0136[3];
    _TMP17._texcoord0.xyzw = vec4(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z), 1.00000000E+000);
    _TMP17._texcoord2.xy = vec2(float(_TMP23.x), float(_TMP23.y));
    _v0142 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0144 = vec4(float(_v0142.x), float(_v0142.y), float(_v0142.z), float(_v0142.w));
    _TMP10 = (_b0144);
    _TMP17._varying_colorSet0 = vec4(float(_TMP10.x), float(_TMP10.y), float(_TMP10.z), float(_TMP10.w));
    _TMP13 = dot(vec3(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z)), vec3(float(_TMP22.x), float(_TMP22.y), float(_TMP22.z)));
    _TMP11 = float(_TMP13);
    _TMP14 = inversesqrt(float(_TMP11));
    _TMP12 = float(_TMP14);
    _TMP6 = _TMP12*_TMP22;
    _TMP175.x = _ps2ShineMtx[0].x;
    _TMP175.y = _ps2ShineMtx[0].y;
    _TMP175.z = _ps2ShineMtx[0].z;
    _r0153 = _TMP6.x*_TMP175;
    _TMP176.x = _ps2ShineMtx[1].x;
    _TMP176.y = _ps2ShineMtx[1].y;
    _TMP176.z = _ps2ShineMtx[1].z;
    _r0153 = _r0153 + _TMP6.y*_TMP176;
    _TMP177.x = _ps2ShineMtx[2].x;
    _TMP177.y = _ps2ShineMtx[2].y;
    _TMP177.z = _ps2ShineMtx[2].z;
    _r0153 = _r0153 + _TMP6.z*_TMP177;
    _TMP17._texcoord3.xy = vec2(float(_r0153.x), float(_r0153.y));
    _TMP0 = length(_r0136.xyz);
    _b0157 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0157);
    _dist = float(_TMP1);
    _a0159 = _dist/_fog_params.z;
    _TMP8 = min(float(_a0159), 1.00000000E+000);
    _TMP2 = float(_TMP8);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP17._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP17._texcoord2;
    cg_TexCoord0 = _TMP17._texcoord0;
    cg_TexCoord3.xy = _TMP17._texcoord3;
    cg_TexCoord1.xyz = _r0136.xyz;
    cg_TexCoord4.x = _TMP17._texcoord4;
    gl_Position = _r0130;
    cg_FrontColor = vec4(float(_TMP17._varying_colorSet0.x), float(_TMP17._varying_colorSet0.y), float(_TMP17._varying_colorSet0.z), float(_TMP17._varying_colorSet0.w));
    return;
} 