//SharedShaders/0x1ed3f551.ios_vcode uklgonzale Tue Mar 11 16:28:37 2014

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
vec4 _TMP8;
vec2 _TMP21;
vec3 _TMP20;
vec4 _TMP18;
vec4 _TMP17[4];
vec4 _TMP5;
float _TMP10;
float _TMP9;
float _TMP12;
float _TMP11;
vec4 _C0091[4];
vec3 _normal0093;
vec3 _v0095;
vec3 _r0097;
vec3 _M0097[3];
vec3 _r0099;
vec3 _M0099[3];
vec3 _v0101;
vec3 _v0107;
vec3 _TMP850107[3];
vec3 _r0109;
vec4 _skinMatrix00114[4];
vec4 _skinMatrix10114[4];
vec4 _r0116;
vec4 _r0118;
vec4 _r0122;
vec4 _r0124;
vec4 _r0130;
vec4 _M0130[4];
vec4 _v0135;
vec4 _b0137;
float _b0141;
float _a0143;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 BLENDWEIGHT0;
attribute vec4 BLENDINDICES0;
attribute vec4 TEXCOORD0;
vec3 _TMP144;
vec3 _TMP145;
vec3 _TMP146;
vec3 _TMP147;
vec3 _TMP148;
vec3 _TMP149;
vec3 _TMP150;
vec3 _TMP151;
vec3 _TMP152;
vec3 _TMP153;
vec3 _TMP154;
vec3 _TMP155;
vec3 _TMP156;
vec3 _TMP157;
vec3 _TMP158;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _skinMatrix[36];
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

    _C0091[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0091[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0091[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0091[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0091[0].x), float(_C0091[0].y), float(_C0091[0].z), float(_C0091[0].w));
    _TMP17[1] = vec4(float(_C0091[1].x), float(_C0091[1].y), float(_C0091[1].z), float(_C0091[1].w));
    _TMP17[2] = vec4(float(_C0091[2].x), float(_C0091[2].y), float(_C0091[2].z), float(_C0091[2].w));
    _TMP17[3] = vec4(float(_C0091[3].x), float(_C0091[3].y), float(_C0091[3].z), float(_C0091[3].w));
    _normal0093 = NORMAL.xyz*2.00000000E+000 - 1.00000000E+000;
    _TMP144.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].x;
    _TMP144.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].y;
    _TMP144.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)].z;
    _TMP145.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].x;
    _TMP145.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].y;
    _TMP145.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)].z;
    _TMP146.x = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].x;
    _TMP146.y = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].y;
    _TMP146.z = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)].z;
    _M0097[0] = vec3(float(_TMP144.x), float(_TMP144.y), float(_TMP144.z));
    _M0097[1] = vec3(float(_TMP145.x), float(_TMP145.y), float(_TMP145.z));
    _M0097[2] = vec3(float(_TMP146.x), float(_TMP146.y), float(_TMP146.z));
    _r0097 = _normal0093.x*_M0097[0];
    _r0097 = _r0097 + _normal0093.y*_M0097[1];
    _r0097 = _r0097 + _normal0093.z*_M0097[2];
    _TMP147.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].x;
    _TMP147.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].y;
    _TMP147.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)].z;
    _TMP148.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].x;
    _TMP148.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].y;
    _TMP148.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)].z;
    _TMP149.x = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].x;
    _TMP149.y = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].y;
    _TMP149.z = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)].z;
    _M0099[0] = vec3(float(_TMP147.x), float(_TMP147.y), float(_TMP147.z));
    _M0099[1] = vec3(float(_TMP148.x), float(_TMP148.y), float(_TMP148.z));
    _M0099[2] = vec3(float(_TMP149.x), float(_TMP149.y), float(_TMP149.z));
    _r0099 = _normal0093.x*_M0099[0];
    _r0099 = _r0099 + _normal0093.y*_M0099[1];
    _r0099 = _r0099 + _normal0093.z*_M0099[2];
    _v0101 = _r0097*BLENDWEIGHT0.x + _r0099*(1.00000000E+000 - BLENDWEIGHT0.x);
    _TMP11 = dot(vec3(float(_v0101.x), float(_v0101.y), float(_v0101.z)), vec3(float(_v0101.x), float(_v0101.y), float(_v0101.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _v0095 = _TMP10*_v0101;
    _v0107 = vec3(float(_v0095.x), float(_v0095.y), float(_v0095.z));
    _TMP150.x = _TMP17[0].x;
    _TMP151.y = _TMP17[0].y;
    _TMP152.z = _TMP17[0].z;
    _TMP850107[0] = vec3(float(_TMP150.x), float(_TMP151.y), float(_TMP152.z));
    _TMP153.x = _TMP17[1].x;
    _TMP154.y = _TMP17[1].y;
    _TMP155.z = _TMP17[1].z;
    _TMP850107[1] = vec3(float(_TMP153.x), float(_TMP154.y), float(_TMP155.z));
    _TMP156.x = _TMP17[2].x;
    _TMP157.y = _TMP17[2].y;
    _TMP158.z = _TMP17[2].z;
    _TMP850107[2] = vec3(float(_TMP156.x), float(_TMP157.y), float(_TMP158.z));
    _r0109 = _v0107.x*_TMP850107[0];
    _r0109 = _r0109 + _v0107.y*_TMP850107[1];
    _r0109 = _r0109 + _v0107.z*_TMP850107[2];
    _TMP20 = vec3(float(_r0109.x), float(_r0109.y), float(_r0109.z));
    _TMP21 = TEXCOORD0.xy + _uvOffset0;
    _skinMatrix00114[0] = _skinMatrix[(4*int(BLENDINDICES0.x) + 0)];
    _skinMatrix00114[1] = _skinMatrix[(4*int(BLENDINDICES0.x) + 1)];
    _skinMatrix00114[2] = _skinMatrix[(4*int(BLENDINDICES0.x) + 2)];
    _skinMatrix00114[3] = _skinMatrix[(4*int(BLENDINDICES0.x) + 3)];
    _skinMatrix10114[0] = _skinMatrix[(4*int(BLENDINDICES0.y) + 0)];
    _skinMatrix10114[1] = _skinMatrix[(4*int(BLENDINDICES0.y) + 1)];
    _skinMatrix10114[2] = _skinMatrix[(4*int(BLENDINDICES0.y) + 2)];
    _skinMatrix10114[3] = _skinMatrix[(4*int(BLENDINDICES0.y) + 3)];
    _r0116 = cg_Vertex.x*_skinMatrix00114[0];
    _r0116 = _r0116 + cg_Vertex.y*_skinMatrix00114[1];
    _r0116 = _r0116 + cg_Vertex.z*_skinMatrix00114[2];
    _r0116 = _r0116 + cg_Vertex.w*_skinMatrix00114[3];
    _r0118 = cg_Vertex.x*_skinMatrix10114[0];
    _r0118 = _r0118 + cg_Vertex.y*_skinMatrix10114[1];
    _r0118 = _r0118 + cg_Vertex.z*_skinMatrix10114[2];
    _r0118 = _r0118 + cg_Vertex.w*_skinMatrix10114[3];
    _TMP5 = vec4(float((_r0116*float(BLENDWEIGHT0.x) + _r0118*float(BLENDWEIGHT0.y)).x), float((_r0116*float(BLENDWEIGHT0.x) + _r0118*float(BLENDWEIGHT0.y)).y), float((_r0116*float(BLENDWEIGHT0.x) + _r0118*float(BLENDWEIGHT0.y)).z), float((_r0116*float(BLENDWEIGHT0.x) + _r0118*float(BLENDWEIGHT0.y)).w));
    _TMP18 = vec4(float(_TMP5.x), float(_TMP5.y), float(_TMP5.z), float(_TMP5.w));
    _r0122 = _TMP18.x*_world[0];
    _r0122 = _r0122 + _TMP18.y*_world[1];
    _r0122 = _r0122 + _TMP18.z*_world[2];
    _r0122 = _r0122 + _TMP18.w*_world[3];
    _r0124 = _r0122.x*_viewProj[0];
    _r0124 = _r0124 + _r0122.y*_viewProj[1];
    _r0124 = _r0124 + _r0122.z*_viewProj[2];
    _r0124 = _r0124 + _r0122.w*_viewProj[3];
    _M0130[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0130[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0130[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0130[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0130 = _TMP18.x*_M0130[0];
    _r0130 = _r0130 + _TMP18.y*_M0130[1];
    _r0130 = _r0130 + _TMP18.z*_M0130[2];
    _r0130 = _r0130 + _TMP18.w*_M0130[3];
    _TMP15._texcoord0.xyzw = vec4(float(_TMP20.x), float(_TMP20.y), float(_TMP20.z), 1.00000000E+000);
    _TMP15._texcoord1.xy = vec2(float(_TMP21.x), float(_TMP21.y));
    _v0135 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0137 = vec4(float(_v0135.x), float(_v0135.y), float(_v0135.z), float(_v0135.w));
    _TMP8 = (_b0137);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP0 = length(_r0130.xyz);
    _b0141 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0141);
    _dist = float(_TMP1);
    _a0143 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0143), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP15._texcoord2;
    cg_TexCoord0 = _TMP15._texcoord0;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0124;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
