//SharedShaders/0x83ba1a5b.ios_vcode uklgonzale Wed Mar 12 14:48:17 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
    vec2 _uvSet0;
    vec2 _uvSet2;
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
VertexInput _TMP8;
vec4 _TMP6;
vec2 _TMP16;
vec4 _TMP12;
vec2 _TMP15;
vec3 _TMP14;
vec4 _TMP11[4];
float _TMP18;
vec4 _C0095[4];
vec3 _v0099;
vec3 _TMP910099[3];
vec3 _r0101;
vec4 _objectPosition0112;
vec4 _r0116;
vec4 _v0116;
vec4 _r0118;
vec4 _r0124;
vec4 _M0124[4];
vec4 _v0131;
vec4 _b0133;
float _b0137;
float _a0139;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
attribute vec4 TEXCOORD1;
vec3 _TMP140;
vec3 _TMP141;
vec3 _TMP142;
vec3 _TMP143;
vec3 _TMP144;
vec3 _TMP145;
vec3 _TMP146;
vec3 _TMP147;
vec3 _TMP148;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
uniform vec4 _waterTable[32];
uniform vec4 _fxAttributes;
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

    _TMP8._colorSet0 = COLOR;
    _C0095[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0095[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0095[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0095[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0095[0].x), float(_C0095[0].y), float(_C0095[0].z), float(_C0095[0].w));
    _TMP11[1] = vec4(float(_C0095[1].x), float(_C0095[1].y), float(_C0095[1].z), float(_C0095[1].w));
    _TMP11[2] = vec4(float(_C0095[2].x), float(_C0095[2].y), float(_C0095[2].z), float(_C0095[2].w));
    _TMP11[3] = vec4(float(_C0095[3].x), float(_C0095[3].y), float(_C0095[3].z), float(_C0095[3].w));
    _v0099 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP140.x = _TMP11[0].x;
    _TMP141.y = _TMP11[0].y;
    _TMP142.z = _TMP11[0].z;
    _TMP910099[0] = vec3(float(_TMP140.x), float(_TMP141.y), float(_TMP142.z));
    _TMP143.x = _TMP11[1].x;
    _TMP144.y = _TMP11[1].y;
    _TMP145.z = _TMP11[1].z;
    _TMP910099[1] = vec3(float(_TMP143.x), float(_TMP144.y), float(_TMP145.z));
    _TMP146.x = _TMP11[2].x;
    _TMP147.y = _TMP11[2].y;
    _TMP148.z = _TMP11[2].z;
    _TMP910099[2] = vec3(float(_TMP146.x), float(_TMP147.y), float(_TMP148.z));
    _r0101 = _v0099.x*_TMP910099[0];
    _r0101 = _r0101 + _v0099.y*_TMP910099[1];
    _r0101 = _r0101 + _v0099.z*_TMP910099[2];
    _TMP14 = vec3(float(_r0101.x), float(_r0101.y), float(_r0101.z));
    _TMP18 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP18))];
    _TMP15 = TEXCOORD0.xy + _uvOffset0;
    _TMP16.xy = vec2(float((vec2(float(TEXCOORD1.x), float(TEXCOORD1.y)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD1.x), float(TEXCOORD1.y)) + _lightmapOffset.xy).y));
    _objectPosition0112 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0116 = vec4(_objectPosition0112.x, _objectPosition0112.y, _objectPosition0112.z, 1.00000000E+000);
    _r0116 = _v0116.x*_world[0];
    _r0116 = _r0116 + _v0116.y*_world[1];
    _r0116 = _r0116 + _v0116.z*_world[2];
    _r0116 = _r0116 + _v0116.w*_world[3];
    _r0118 = _r0116.x*_viewProj[0];
    _r0118 = _r0118 + _r0116.y*_viewProj[1];
    _r0118 = _r0118 + _r0116.z*_viewProj[2];
    _r0118 = _r0118 + _r0116.w*_viewProj[3];
    _M0124[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0124[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0124[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0124[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0124 = cg_Vertex.x*_M0124[0];
    _r0124 = _r0124 + cg_Vertex.y*_M0124[1];
    _r0124 = _r0124 + cg_Vertex.z*_M0124[2];
    _r0124 = _r0124 + cg_Vertex.w*_M0124[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP14.x), float(_TMP14.y), float(_TMP14.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP15.x), float(_TMP15.y)) + (5.00000007E-002*float(_fxAttributes.z))*vec2(float(_TMP12.x), float(_TMP12.y));
    _TMP9._texcoord3.xy = vec2(float(_TMP16.x), float(_TMP16.y));
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0131 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0133 = vec4(float(_v0131.x), float(_v0131.y), float(_v0131.z), float(_v0131.w));
    _TMP6 = (_b0133);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0124.xyz);
    _b0137 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0137);
    _dist = float(_TMP1);
    _a0139 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0139), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.xy = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0124.xyz;
    cg_TexCoord4.x = _TMP9._texcoord4;
    gl_Position = _r0118;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
