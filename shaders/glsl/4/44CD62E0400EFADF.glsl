//SharedShaders/0x32751c0d.ios_vcode uklgonzale Wed Mar 12 20:28:17 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
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
vec4 _C0083[4];
vec3 _v0087;
vec3 _TMP790087[3];
vec3 _r0089;
vec4 _r0096;
vec4 _v0096;
vec4 _r0098;
vec4 _r0104;
vec4 _M0104[4];
vec4 _v0108;
vec4 _b0110;
vec3 _r0119;
float _b0123;
float _a0125;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
vec3 _TMP126;
vec3 _TMP127;
vec3 _TMP128;
vec3 _TMP129;
vec3 _TMP130;
vec3 _TMP131;
vec3 _TMP132;
vec3 _TMP133;
vec3 _TMP134;
vec3 _TMP135;
vec3 _TMP136;
vec3 _TMP137;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _ps2ShineMtx[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0083[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0083[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0083[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0083[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP17[0] = vec4(float(_C0083[0].x), float(_C0083[0].y), float(_C0083[0].z), float(_C0083[0].w));
    _TMP17[1] = vec4(float(_C0083[1].x), float(_C0083[1].y), float(_C0083[1].z), float(_C0083[1].w));
    _TMP17[2] = vec4(float(_C0083[2].x), float(_C0083[2].y), float(_C0083[2].z), float(_C0083[2].w));
    _TMP17[3] = vec4(float(_C0083[3].x), float(_C0083[3].y), float(_C0083[3].z), float(_C0083[3].w));
    _v0087 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP126.x = _TMP17[0].x;
    _TMP127.y = _TMP17[0].y;
    _TMP128.z = _TMP17[0].z;
    _TMP790087[0] = vec3(float(_TMP126.x), float(_TMP127.y), float(_TMP128.z));
    _TMP129.x = _TMP17[1].x;
    _TMP130.y = _TMP17[1].y;
    _TMP131.z = _TMP17[1].z;
    _TMP790087[1] = vec3(float(_TMP129.x), float(_TMP130.y), float(_TMP131.z));
    _TMP132.x = _TMP17[2].x;
    _TMP133.y = _TMP17[2].y;
    _TMP134.z = _TMP17[2].z;
    _TMP790087[2] = vec3(float(_TMP132.x), float(_TMP133.y), float(_TMP134.z));
    _r0089 = _v0087.x*_TMP790087[0];
    _r0089 = _r0089 + _v0087.y*_TMP790087[1];
    _r0089 = _r0089 + _v0087.z*_TMP790087[2];
    _TMP19 = vec3(float(_r0089.x), float(_r0089.y), float(_r0089.z));
    _TMP20.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
    _v0096 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0096 = _v0096.x*_world[0];
    _r0096 = _r0096 + _v0096.y*_world[1];
    _r0096 = _r0096 + _v0096.z*_world[2];
    _r0096 = _r0096 + _v0096.w*_world[3];
    _r0098 = _r0096.x*_viewProj[0];
    _r0098 = _r0098 + _r0096.y*_viewProj[1];
    _r0098 = _r0098 + _r0096.z*_viewProj[2];
    _r0098 = _r0098 + _r0096.w*_viewProj[3];
    _M0104[0] = vec4(float(_TMP17[0].x), float(_TMP17[0].y), float(_TMP17[0].z), float(_TMP17[0].w));
    _M0104[1] = vec4(float(_TMP17[1].x), float(_TMP17[1].y), float(_TMP17[1].z), float(_TMP17[1].w));
    _M0104[2] = vec4(float(_TMP17[2].x), float(_TMP17[2].y), float(_TMP17[2].z), float(_TMP17[2].w));
    _M0104[3] = vec4(float(_TMP17[3].x), float(_TMP17[3].y), float(_TMP17[3].z), float(_TMP17[3].w));
    _r0104 = cg_Vertex.x*_M0104[0];
    _r0104 = _r0104 + cg_Vertex.y*_M0104[1];
    _r0104 = _r0104 + cg_Vertex.z*_M0104[2];
    _r0104 = _r0104 + cg_Vertex.w*_M0104[3];
    _TMP15._texcoord0.xy = vec2(float(_TMP20.x), float(_TMP20.y));
    _v0108 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0110 = vec4(float(_v0108.x), float(_v0108.y), float(_v0108.z), float(_v0108.w));
    _TMP8 = (_b0110);
    _TMP15._varying_colorSet0 = vec4(float(_TMP8.x), float(_TMP8.y), float(_TMP8.z), float(_TMP8.w));
    _TMP11 = dot(vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)), vec3(float(_TMP19.x), float(_TMP19.y), float(_TMP19.z)));
    _TMP9 = float(_TMP11);
    _TMP12 = inversesqrt(float(_TMP9));
    _TMP10 = float(_TMP12);
    _TMP4 = _TMP10*_TMP19;
    _TMP135.x = _ps2ShineMtx[0].x;
    _TMP135.y = _ps2ShineMtx[0].y;
    _TMP135.z = _ps2ShineMtx[0].z;
    _r0119 = _TMP4.x*_TMP135;
    _TMP136.x = _ps2ShineMtx[1].x;
    _TMP136.y = _ps2ShineMtx[1].y;
    _TMP136.z = _ps2ShineMtx[1].z;
    _r0119 = _r0119 + _TMP4.y*_TMP136;
    _TMP137.x = _ps2ShineMtx[2].x;
    _TMP137.y = _ps2ShineMtx[2].y;
    _TMP137.z = _ps2ShineMtx[2].z;
    _r0119 = _r0119 + _TMP4.z*_TMP137;
    _TMP15._texcoord1.xy = vec2(float(_r0119.x), float(_r0119.y));
    _TMP0 = length(_r0104.xyz);
    _b0123 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0123);
    _dist = float(_TMP1);
    _a0125 = _dist/_fog_params.z;
    _TMP6 = min(float(_a0125), 1.00000000E+000);
    _TMP2 = float(_TMP6);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP15._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP15._texcoord2;
    cg_TexCoord0.xy = _TMP15._texcoord0;
    cg_TexCoord1.xy = _TMP15._texcoord1;
    gl_Position = _r0098;
    cg_FrontColor = vec4(float(_TMP15._varying_colorSet0.x), float(_TMP15._varying_colorSet0.y), float(_TMP15._varying_colorSet0.z), float(_TMP15._varying_colorSet0.w));
    return;
} 
