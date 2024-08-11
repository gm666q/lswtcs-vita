//SharedShaders/0x8d6204f6.ios_vcode uklgonzale Wed Mar 12 17:09:14 2014

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
vec4 _C0090[4];
vec3 _v0094;
vec3 _TMP860094[3];
vec3 _r0096;
vec4 _objectPosition0105;
vec4 _r0109;
vec4 _v0109;
vec4 _r0111;
vec4 _r0117;
vec4 _M0117[4];
vec4 _v0123;
vec4 _b0125;
float _b0129;
float _a0131;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
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
    _C0090[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0090[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0090[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0090[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0090[0].x), float(_C0090[0].y), float(_C0090[0].z), float(_C0090[0].w));
    _TMP11[1] = vec4(float(_C0090[1].x), float(_C0090[1].y), float(_C0090[1].z), float(_C0090[1].w));
    _TMP11[2] = vec4(float(_C0090[2].x), float(_C0090[2].y), float(_C0090[2].z), float(_C0090[2].w));
    _TMP11[3] = vec4(float(_C0090[3].x), float(_C0090[3].y), float(_C0090[3].z), float(_C0090[3].w));
    _v0094 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP132.x = _TMP11[0].x;
    _TMP133.y = _TMP11[0].y;
    _TMP134.z = _TMP11[0].z;
    _TMP860094[0] = vec3(float(_TMP132.x), float(_TMP133.y), float(_TMP134.z));
    _TMP135.x = _TMP11[1].x;
    _TMP136.y = _TMP11[1].y;
    _TMP137.z = _TMP11[1].z;
    _TMP860094[1] = vec3(float(_TMP135.x), float(_TMP136.y), float(_TMP137.z));
    _TMP138.x = _TMP11[2].x;
    _TMP139.y = _TMP11[2].y;
    _TMP140.z = _TMP11[2].z;
    _TMP860094[2] = vec3(float(_TMP138.x), float(_TMP139.y), float(_TMP140.z));
    _r0096 = _v0094.x*_TMP860094[0];
    _r0096 = _r0096 + _v0094.y*_TMP860094[1];
    _r0096 = _r0096 + _v0094.z*_TMP860094[2];
    _TMP14 = vec3(float(_r0096.x), float(_r0096.y), float(_r0096.z));
    _TMP17 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP17))];
    _TMP15 = TEXCOORD0.xy + _uvOffset0;
    _objectPosition0105 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0109 = vec4(_objectPosition0105.x, _objectPosition0105.y, _objectPosition0105.z, 1.00000000E+000);
    _r0109 = _v0109.x*_world[0];
    _r0109 = _r0109 + _v0109.y*_world[1];
    _r0109 = _r0109 + _v0109.z*_world[2];
    _r0109 = _r0109 + _v0109.w*_world[3];
    _r0111 = _r0109.x*_viewProj[0];
    _r0111 = _r0111 + _r0109.y*_viewProj[1];
    _r0111 = _r0111 + _r0109.z*_viewProj[2];
    _r0111 = _r0111 + _r0109.w*_viewProj[3];
    _M0117[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0117[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0117[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0117[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0117 = cg_Vertex.x*_M0117[0];
    _r0117 = _r0117 + cg_Vertex.y*_M0117[1];
    _r0117 = _r0117 + cg_Vertex.z*_M0117[2];
    _r0117 = _r0117 + cg_Vertex.w*_M0117[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP14.x), float(_TMP14.y), float(_TMP14.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP15.x), float(_TMP15.y)) + (5.00000007E-002*float(_fxAttributes.z))*vec2(float(_TMP12.x), float(_TMP12.y));
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0123 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0125 = vec4(float(_v0123.x), float(_v0123.y), float(_v0123.z), float(_v0123.w));
    _TMP6 = (_b0125);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0117.xyz);
    _b0129 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0129);
    _dist = float(_TMP1);
    _a0131 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0131), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.x = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0117.xyz;
    gl_Position = _r0111;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
