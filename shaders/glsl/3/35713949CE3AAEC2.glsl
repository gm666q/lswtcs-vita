//SharedShaders/0x16205327.ios_vcode uklgonzale Wed Mar 12 14:37:35 2014

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
vec4 _C0080[4];
vec3 _v0084;
vec3 _TMP760084[3];
vec3 _r0086;
vec4 _r0093;
vec4 _v0093;
vec4 _r0095;
vec4 _r0101;
vec4 _M0101[4];
vec4 _v0107;
vec4 _b0109;
float _b0113;
float _a0115;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
vec3 _TMP116;
vec3 _TMP117;
vec3 _TMP118;
vec3 _TMP119;
vec3 _TMP120;
vec3 _TMP121;
vec3 _TMP122;
vec3 _TMP123;
vec3 _TMP124;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
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

    _C0080[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0080[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0080[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0080[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0080[0].x), float(_C0080[0].y), float(_C0080[0].z), float(_C0080[0].w));
    _TMP11[1] = vec4(float(_C0080[1].x), float(_C0080[1].y), float(_C0080[1].z), float(_C0080[1].w));
    _TMP11[2] = vec4(float(_C0080[2].x), float(_C0080[2].y), float(_C0080[2].z), float(_C0080[2].w));
    _TMP11[3] = vec4(float(_C0080[3].x), float(_C0080[3].y), float(_C0080[3].z), float(_C0080[3].w));
    _v0084 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP116.x = _TMP11[0].x;
    _TMP117.y = _TMP11[0].y;
    _TMP118.z = _TMP11[0].z;
    _TMP760084[0] = vec3(float(_TMP116.x), float(_TMP117.y), float(_TMP118.z));
    _TMP119.x = _TMP11[1].x;
    _TMP120.y = _TMP11[1].y;
    _TMP121.z = _TMP11[1].z;
    _TMP760084[1] = vec3(float(_TMP119.x), float(_TMP120.y), float(_TMP121.z));
    _TMP122.x = _TMP11[2].x;
    _TMP123.y = _TMP11[2].y;
    _TMP124.z = _TMP11[2].z;
    _TMP760084[2] = vec3(float(_TMP122.x), float(_TMP123.y), float(_TMP124.z));
    _r0086 = _v0084.x*_TMP760084[0];
    _r0086 = _r0086 + _v0084.y*_TMP760084[1];
    _r0086 = _r0086 + _v0084.z*_TMP760084[2];
    _TMP13 = vec3(float(_r0086.x), float(_r0086.y), float(_r0086.z));
    _TMP14.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
    _v0093 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0093 = _v0093.x*_world[0];
    _r0093 = _r0093 + _v0093.y*_world[1];
    _r0093 = _r0093 + _v0093.z*_world[2];
    _r0093 = _r0093 + _v0093.w*_world[3];
    _r0095 = _r0093.x*_viewProj[0];
    _r0095 = _r0095 + _r0093.y*_viewProj[1];
    _r0095 = _r0095 + _r0093.z*_viewProj[2];
    _r0095 = _r0095 + _r0093.w*_viewProj[3];
    _M0101[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0101[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0101[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0101[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0101 = cg_Vertex.x*_M0101[0];
    _r0101 = _r0101 + cg_Vertex.y*_M0101[1];
    _r0101 = _r0101 + cg_Vertex.z*_M0101[2];
    _r0101 = _r0101 + cg_Vertex.w*_M0101[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _v0107 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0109 = vec4(float(_v0107.x), float(_v0107.y), float(_v0107.z), float(_v0107.w));
    _TMP6 = (_b0109);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0101.xyz);
    _b0113 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0113);
    _dist = float(_TMP1);
    _a0115 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0115), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord3 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord3.x = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0101.xyz;
    gl_Position = _r0095;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
