//SharedShaders/0x2123cf3d.ios_vcode uklgonzale Wed Mar 12 15:01:24 2014

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
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    float _texcoord4;
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
vec2 _TMP15;
vec2 _TMP14;
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0084[4];
vec3 _v0088;
vec3 _TMP800088[3];
vec3 _r0090;
vec4 _r0099;
vec4 _v0099;
vec4 _r0101;
vec4 _r0107;
vec4 _M0107[4];
vec4 _v0114;
vec4 _b0116;
float _b0120;
float _a0122;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
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
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
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

    _C0084[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0084[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0084[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0084[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0084[0].x), float(_C0084[0].y), float(_C0084[0].z), float(_C0084[0].w));
    _TMP11[1] = vec4(float(_C0084[1].x), float(_C0084[1].y), float(_C0084[1].z), float(_C0084[1].w));
    _TMP11[2] = vec4(float(_C0084[2].x), float(_C0084[2].y), float(_C0084[2].z), float(_C0084[2].w));
    _TMP11[3] = vec4(float(_C0084[3].x), float(_C0084[3].y), float(_C0084[3].z), float(_C0084[3].w));
    _v0088 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP123.x = _TMP11[0].x;
    _TMP124.y = _TMP11[0].y;
    _TMP125.z = _TMP11[0].z;
    _TMP800088[0] = vec3(float(_TMP123.x), float(_TMP124.y), float(_TMP125.z));
    _TMP126.x = _TMP11[1].x;
    _TMP127.y = _TMP11[1].y;
    _TMP128.z = _TMP11[1].z;
    _TMP800088[1] = vec3(float(_TMP126.x), float(_TMP127.y), float(_TMP128.z));
    _TMP129.x = _TMP11[2].x;
    _TMP130.y = _TMP11[2].y;
    _TMP131.z = _TMP11[2].z;
    _TMP800088[2] = vec3(float(_TMP129.x), float(_TMP130.y), float(_TMP131.z));
    _r0090 = _v0088.x*_TMP800088[0];
    _r0090 = _r0090 + _v0088.y*_TMP800088[1];
    _r0090 = _r0090 + _v0088.z*_TMP800088[2];
    _TMP13 = vec3(float(_r0090.x), float(_r0090.y), float(_r0090.z));
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _TMP15.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
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
    _TMP9._texcoord2.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _TMP9._texcoord3.xy = vec2(float(_TMP15.x), float(_TMP15.y));
    _v0114 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0116 = vec4(float(_v0114.x), float(_v0114.y), float(_v0114.z), float(_v0114.w));
    _TMP6 = (_b0116);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0107.xyz);
    _b0120 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0120);
    _dist = float(_TMP1);
    _a0122 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0122), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.xy = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0107.xyz;
    cg_TexCoord4.x = _TMP9._texcoord4;
    gl_Position = _r0101;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
