//SharedShaders/0x4899209e.ios_vcode uklgonzale Tue Mar 11 16:30:22 2014

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
    float _texcoord3;
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
vec2 _TMP14;
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0089[4];
vec3 _v0093;
vec3 _TMP850093[3];
vec3 _r0095;
vec4 _r0102;
vec4 _v0102;
vec4 _r0104;
vec4 _r0110;
vec4 _M0110[4];
vec4 _v0116;
vec4 _b0118;
float _b0122;
float _a0124;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP125;
vec3 _TMP126;
vec3 _TMP127;
vec3 _TMP128;
vec3 _TMP129;
vec3 _TMP130;
vec3 _TMP131;
vec3 _TMP132;
vec3 _TMP133;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
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

    _C0089[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0089[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0089[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0089[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0089[0].x), float(_C0089[0].y), float(_C0089[0].z), float(_C0089[0].w));
    _TMP11[1] = vec4(float(_C0089[1].x), float(_C0089[1].y), float(_C0089[1].z), float(_C0089[1].w));
    _TMP11[2] = vec4(float(_C0089[2].x), float(_C0089[2].y), float(_C0089[2].z), float(_C0089[2].w));
    _TMP11[3] = vec4(float(_C0089[3].x), float(_C0089[3].y), float(_C0089[3].z), float(_C0089[3].w));
    _v0093 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP125.x = _TMP11[0].x;
    _TMP126.y = _TMP11[0].y;
    _TMP127.z = _TMP11[0].z;
    _TMP850093[0] = vec3(float(_TMP125.x), float(_TMP126.y), float(_TMP127.z));
    _TMP128.x = _TMP11[1].x;
    _TMP129.y = _TMP11[1].y;
    _TMP130.z = _TMP11[1].z;
    _TMP850093[1] = vec3(float(_TMP128.x), float(_TMP129.y), float(_TMP130.z));
    _TMP131.x = _TMP11[2].x;
    _TMP132.y = _TMP11[2].y;
    _TMP133.z = _TMP11[2].z;
    _TMP850093[2] = vec3(float(_TMP131.x), float(_TMP132.y), float(_TMP133.z));
    _r0095 = _v0093.x*_TMP850093[0];
    _r0095 = _r0095 + _v0093.y*_TMP850093[1];
    _r0095 = _r0095 + _v0093.z*_TMP850093[2];
    _TMP13 = vec3(float(_r0095.x), float(_r0095.y), float(_r0095.z));
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _v0102 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0102 = _v0102.x*_world[0];
    _r0102 = _r0102 + _v0102.y*_world[1];
    _r0102 = _r0102 + _v0102.z*_world[2];
    _r0102 = _r0102 + _v0102.w*_world[3];
    _r0104 = _r0102.x*_viewProj[0];
    _r0104 = _r0104 + _r0102.y*_viewProj[1];
    _r0104 = _r0104 + _r0102.z*_viewProj[2];
    _r0104 = _r0104 + _r0102.w*_viewProj[3];
    _M0110[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0110[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0110[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0110[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0110 = cg_Vertex.x*_M0110[0];
    _r0110 = _r0110 + cg_Vertex.y*_M0110[1];
    _r0110 = _r0110 + cg_Vertex.z*_M0110[2];
    _r0110 = _r0110 + cg_Vertex.w*_M0110[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _v0116 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0118 = vec4(float(_v0116.x), float(_v0116.y), float(_v0116.z), float(_v0116.w));
    _TMP6 = (_b0118);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0110.xyz);
    _b0122 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0122);
    _dist = float(_TMP1);
    _a0124 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0124), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.x = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0110.xyz;
    gl_Position = _r0104;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
