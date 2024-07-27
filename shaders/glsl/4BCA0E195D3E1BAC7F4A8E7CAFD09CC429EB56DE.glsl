//SharedShaders/0xb8faf653.ios_vcode uklgonzale Wed Mar 12 17:09:13 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet2;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec4 _texcoord0;
    vec3 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
    vec2 _texcoord4;
    float _texcoord5;
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
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0089[4];
vec3 _v0093;
vec3 _TMP850093[3];
vec3 _r0095;
vec4 _r0106;
vec4 _v0106;
vec4 _r0108;
vec4 _r0114;
vec4 _M0114[4];
vec4 _v0122;
vec4 _b0124;
float _b0129;
float _a0131;
attribute vec4 NORMAL;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
attribute vec4 SPECULAR;
attribute vec4 TEXCOORD1;
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
uniform vec4 _lightmapOffset;
uniform vec2 _uvOffset0;
uniform vec2 _uvOffset1;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord3;
varying vec4 cg_FrontSecondaryColor;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord5;
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
    _TMP132.x = _TMP11[0].x;
    _TMP133.y = _TMP11[0].y;
    _TMP134.z = _TMP11[0].z;
    _TMP850093[0] = vec3(float(_TMP132.x), float(_TMP133.y), float(_TMP134.z));
    _TMP135.x = _TMP11[1].x;
    _TMP136.y = _TMP11[1].y;
    _TMP137.z = _TMP11[1].z;
    _TMP850093[1] = vec3(float(_TMP135.x), float(_TMP136.y), float(_TMP137.z));
    _TMP138.x = _TMP11[2].x;
    _TMP139.y = _TMP11[2].y;
    _TMP140.z = _TMP11[2].z;
    _TMP850093[2] = vec3(float(_TMP138.x), float(_TMP139.y), float(_TMP140.z));
    _r0095 = _v0093.x*_TMP850093[0];
    _r0095 = _r0095 + _v0093.y*_TMP850093[1];
    _r0095 = _r0095 + _v0093.z*_TMP850093[2];
    _TMP13 = vec3(float(_r0095.x), float(_r0095.y), float(_r0095.z));
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _TMP15 = TEXCOORD0.zw + _uvOffset1;
    _TMP16.xy = vec2(float((vec2(float(TEXCOORD1.x), float(TEXCOORD1.y)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD1.x), float(TEXCOORD1.y)) + _lightmapOffset.xy).y));
    _v0106 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0106 = _v0106.x*_world[0];
    _r0106 = _r0106 + _v0106.y*_world[1];
    _r0106 = _r0106 + _v0106.z*_world[2];
    _r0106 = _r0106 + _v0106.w*_world[3];
    _r0108 = _r0106.x*_viewProj[0];
    _r0108 = _r0108 + _r0106.y*_viewProj[1];
    _r0108 = _r0108 + _r0106.z*_viewProj[2];
    _r0108 = _r0108 + _r0106.w*_viewProj[3];
    _M0114[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0114[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0114[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0114[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0114 = cg_Vertex.x*_M0114[0];
    _r0114 = _r0114 + cg_Vertex.y*_M0114[1];
    _r0114 = _r0114 + cg_Vertex.z*_M0114[2];
    _r0114 = _r0114 + cg_Vertex.w*_M0114[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _TMP9._texcoord2.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _TMP9._texcoord3.xy = vec2(float(_TMP15.x), float(_TMP15.y));
    _TMP9._texcoord4.xy = vec2(float(_TMP16.x), float(_TMP16.y));
    _v0122 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0124 = vec4(float(_v0122.x), float(_v0122.y), float(_v0122.z), float(_v0122.w));
    _TMP6 = (_b0124);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0114.xyz);
    _b0129 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0129);
    _dist = float(_TMP1);
    _a0131 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0131), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord5 = float(_dd);
    cg_TexCoord2.xy = _TMP9._texcoord2;
    cg_TexCoord5.x = _TMP9._texcoord5;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_FrontSecondaryColor = vec4(float(SPECULAR.x), float(SPECULAR.y), float(SPECULAR.z), float(SPECULAR.w));
    cg_TexCoord3.xy = _TMP9._texcoord3;
    cg_TexCoord1.xyz = _r0114.xyz;
    cg_TexCoord4.xy = _TMP9._texcoord4;
    gl_Position = _r0108;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
