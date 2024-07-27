//SharedShaders/0xf1ad5425.ios_vcode uklgonzale Wed Mar 12 20:12:08 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _uvSet01;
    vec4 _uvSet23;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
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
vec2 _TMP16;
vec2 _TMP15;
vec2 _TMP14;
vec2 _TMP13;
vec4 _TMP11[4];
vec4 _C0085[4];
vec4 _r0098;
vec4 _v0098;
vec4 _r0100;
vec4 _r0106;
vec4 _M0106[4];
vec4 _v0113;
vec4 _b0115;
float _b0120;
float _a0122;
attribute vec4 TEXCOORD0;
attribute vec4 TEXCOORD1;
attribute vec4 COLOR;
attribute vec4 SPECULAR;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
uniform vec2 _uvOffset0;
uniform vec2 _uvOffset1;
uniform vec2 _uvOffset2;
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

    _C0085[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0085[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0085[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0085[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0085[0].x), float(_C0085[0].y), float(_C0085[0].z), float(_C0085[0].w));
    _TMP11[1] = vec4(float(_C0085[1].x), float(_C0085[1].y), float(_C0085[1].z), float(_C0085[1].w));
    _TMP11[2] = vec4(float(_C0085[2].x), float(_C0085[2].y), float(_C0085[2].z), float(_C0085[2].w));
    _TMP11[3] = vec4(float(_C0085[3].x), float(_C0085[3].y), float(_C0085[3].z), float(_C0085[3].w));
    _TMP13 = TEXCOORD0.xy + _uvOffset0;
    _TMP14 = TEXCOORD0.zw + _uvOffset1;
    _TMP15 = TEXCOORD1.xy + _uvOffset2;
    _TMP16.xy = vec2(float((vec2(float(TEXCOORD1.z), float(TEXCOORD1.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD1.z), float(TEXCOORD1.w)) + _lightmapOffset.xy).y));
    _v0098 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0098 = _v0098.x*_world[0];
    _r0098 = _r0098 + _v0098.y*_world[1];
    _r0098 = _r0098 + _v0098.z*_world[2];
    _r0098 = _r0098 + _v0098.w*_world[3];
    _r0100 = _r0098.x*_viewProj[0];
    _r0100 = _r0100 + _r0098.y*_viewProj[1];
    _r0100 = _r0100 + _r0098.z*_viewProj[2];
    _r0100 = _r0100 + _r0098.w*_viewProj[3];
    _M0106[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0106[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0106[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0106[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0106 = cg_Vertex.x*_M0106[0];
    _r0106 = _r0106 + cg_Vertex.y*_M0106[1];
    _r0106 = _r0106 + cg_Vertex.z*_M0106[2];
    _r0106 = _r0106 + cg_Vertex.w*_M0106[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP13.x), float(_TMP13.y));
    _TMP9._texcoord1.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _TMP9._texcoord2.xy = vec2(float(_TMP15.x), float(_TMP15.y));
    _TMP9._texcoord3.xy = vec2(float(_TMP16.x), float(_TMP16.y));
    _v0113 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0115 = vec4(float(_v0113.x), float(_v0113.y), float(_v0113.z), float(_v0113.w));
    _TMP6 = (_b0115);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0106.xyz);
    _b0120 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0120);
    _dist = float(_TMP1);
    _a0122 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0122), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord4 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_FrontSecondaryColor = vec4(float(SPECULAR.x), float(SPECULAR.y), float(SPECULAR.z), float(SPECULAR.w));
    cg_TexCoord3.xy = _TMP9._texcoord3;
    cg_TexCoord1.xy = _TMP9._texcoord1;
    cg_TexCoord4.x = _TMP9._texcoord4;
    gl_Position = _r0100;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
