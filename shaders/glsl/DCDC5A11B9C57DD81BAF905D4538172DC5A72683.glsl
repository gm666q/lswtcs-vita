//SharedShaders/0xa3c47fdd.ios_vcode uklgonzale Wed Mar 12 19:04:14 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
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
vec4 _C0090[4];
vec3 _v0094;
vec3 _TMP860094[3];
vec3 _r0096;
vec4 _r0105;
vec4 _v0105;
vec4 _r0107;
vec4 _r0113;
vec4 _M0113[4];
vec4 _v0120;
vec4 _b0122;
float _b0127;
float _a0129;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
attribute vec4 SPECULAR;
vec3 _TMP130;
vec3 _TMP131;
vec3 _TMP132;
vec3 _TMP133;
vec3 _TMP134;
vec3 _TMP135;
vec3 _TMP136;
vec3 _TMP137;
vec3 _TMP138;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec2 _uvOffset0;
uniform vec2 _uvOffset1;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0090[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0090[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0090[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0090[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0090[0].x), float(_C0090[0].y), float(_C0090[0].z), float(_C0090[0].w));
    _TMP11[1] = vec4(float(_C0090[1].x), float(_C0090[1].y), float(_C0090[1].z), float(_C0090[1].w));
    _TMP11[2] = vec4(float(_C0090[2].x), float(_C0090[2].y), float(_C0090[2].z), float(_C0090[2].w));
    _TMP11[3] = vec4(float(_C0090[3].x), float(_C0090[3].y), float(_C0090[3].z), float(_C0090[3].w));
    _v0094 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP130.x = _TMP11[0].x;
    _TMP131.y = _TMP11[0].y;
    _TMP132.z = _TMP11[0].z;
    _TMP860094[0] = vec3(float(_TMP130.x), float(_TMP131.y), float(_TMP132.z));
    _TMP133.x = _TMP11[1].x;
    _TMP134.y = _TMP11[1].y;
    _TMP135.z = _TMP11[1].z;
    _TMP860094[1] = vec3(float(_TMP133.x), float(_TMP134.y), float(_TMP135.z));
    _TMP136.x = _TMP11[2].x;
    _TMP137.y = _TMP11[2].y;
    _TMP138.z = _TMP11[2].z;
    _TMP860094[2] = vec3(float(_TMP136.x), float(_TMP137.y), float(_TMP138.z));
    _r0096 = _v0094.x*_TMP860094[0];
    _r0096 = _r0096 + _v0094.y*_TMP860094[1];
    _r0096 = _r0096 + _v0094.z*_TMP860094[2];
    _TMP13 = vec3(float(_r0096.x), float(_r0096.y), float(_r0096.z));
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _TMP15 = TEXCOORD0.zw + _uvOffset1;
    _v0105 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0105 = _v0105.x*_world[0];
    _r0105 = _r0105 + _v0105.y*_world[1];
    _r0105 = _r0105 + _v0105.z*_world[2];
    _r0105 = _r0105 + _v0105.w*_world[3];
    _r0107 = _r0105.x*_viewProj[0];
    _r0107 = _r0107 + _r0105.y*_viewProj[1];
    _r0107 = _r0107 + _r0105.z*_viewProj[2];
    _r0107 = _r0107 + _r0105.w*_viewProj[3];
    _M0113[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0113[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0113[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0113[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0113 = cg_Vertex.x*_M0113[0];
    _r0113 = _r0113 + cg_Vertex.y*_M0113[1];
    _r0113 = _r0113 + cg_Vertex.z*_M0113[2];
    _r0113 = _r0113 + cg_Vertex.w*_M0113[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _TMP9._texcoord3.xy = vec2(float(_TMP15.x), float(_TMP15.y));
    _v0120 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0122 = vec4(float(_v0120.x), float(_v0120.y), float(_v0120.z), float(_v0120.w));
    _TMP6 = (_b0122);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0113.xyz);
    _b0127 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0127);
    _dist = float(_TMP1);
    _a0129 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0129), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_FrontSecondaryColor = vec4(float(SPECULAR.x), float(SPECULAR.y), float(SPECULAR.z), float(SPECULAR.w));
    cg_TexCoord3.xy = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0113.xyz;
    cg_TexCoord4.x = _TMP9._texcoord4;
    gl_Position = _r0107;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
