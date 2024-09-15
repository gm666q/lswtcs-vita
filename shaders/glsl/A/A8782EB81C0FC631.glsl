//SharedShaders/0x6d2fd0c7.ios_vcode uklgonzale Tue Mar 11 16:28:49 2014

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
VertexInput _TMP8;
vec4 _TMP6;
vec4 _TMP12;
vec2 _TMP15;
vec3 _TMP14;
vec4 _TMP11[4];
float _TMP17;
vec4 _C0095[4];
vec3 _v0099;
vec3 _TMP910099[3];
vec3 _r0101;
vec4 _objectPosition0110;
vec4 _r0114;
vec4 _v0114;
vec4 _r0116;
vec4 _r0122;
vec4 _M0122[4];
vec4 _v0128;
vec4 _b0130;
float _b0134;
float _a0136;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP137;
vec3 _TMP138;
vec3 _TMP139;
vec3 _TMP140;
vec3 _TMP141;
vec3 _TMP142;
vec3 _TMP143;
vec3 _TMP144;
vec3 _TMP145;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _waterTable[32];
uniform vec4 _fxAttributes;
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
    _TMP137.x = _TMP11[0].x;
    _TMP138.y = _TMP11[0].y;
    _TMP139.z = _TMP11[0].z;
    _TMP910099[0] = vec3(float(_TMP137.x), float(_TMP138.y), float(_TMP139.z));
    _TMP140.x = _TMP11[1].x;
    _TMP141.y = _TMP11[1].y;
    _TMP142.z = _TMP11[1].z;
    _TMP910099[1] = vec3(float(_TMP140.x), float(_TMP141.y), float(_TMP142.z));
    _TMP143.x = _TMP11[2].x;
    _TMP144.y = _TMP11[2].y;
    _TMP145.z = _TMP11[2].z;
    _TMP910099[2] = vec3(float(_TMP143.x), float(_TMP144.y), float(_TMP145.z));
    _r0101 = _v0099.x*_TMP910099[0];
    _r0101 = _r0101 + _v0099.y*_TMP910099[1];
    _r0101 = _r0101 + _v0099.z*_TMP910099[2];
    _TMP14 = vec3(float(_r0101.x), float(_r0101.y), float(_r0101.z));
    _TMP17 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP17))];
    _TMP15 = TEXCOORD0.xy + _uvOffset0;
    _objectPosition0110 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0114 = vec4(_objectPosition0110.x, _objectPosition0110.y, _objectPosition0110.z, 1.00000000E+000);
    _r0114 = _v0114.x*_world[0];
    _r0114 = _r0114 + _v0114.y*_world[1];
    _r0114 = _r0114 + _v0114.z*_world[2];
    _r0114 = _r0114 + _v0114.w*_world[3];
    _r0116 = _r0114.x*_viewProj[0];
    _r0116 = _r0116 + _r0114.y*_viewProj[1];
    _r0116 = _r0116 + _r0114.z*_viewProj[2];
    _r0116 = _r0116 + _r0114.w*_viewProj[3];
    _M0122[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0122[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0122[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0122[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0122 = cg_Vertex.x*_M0122[0];
    _r0122 = _r0122 + cg_Vertex.y*_M0122[1];
    _r0122 = _r0122 + cg_Vertex.z*_M0122[2];
    _r0122 = _r0122 + cg_Vertex.w*_M0122[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP14.x), float(_TMP14.y), float(_TMP14.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP15.x), float(_TMP15.y)) + (5.00000007E-002*float(_fxAttributes.z))*vec2(float(_TMP12.x), float(_TMP12.y));
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0128 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0130 = vec4(float(_v0128.x), float(_v0128.y), float(_v0128.z), float(_v0128.w));
    _TMP6 = (_b0130);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0122.xyz);
    _b0134 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0134);
    _dist = float(_TMP1);
    _a0136 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0136), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.x = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0122.xyz;
    gl_Position = _r0116;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
