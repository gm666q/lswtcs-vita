//SharedShaders/0x0850fb3f.ios_vcode uklgonzale Wed Mar 12 16:52:44 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _uvSet01;
    vec4 _colorSet0;
    vec4 _colorSet1;
    vec2 _uvSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _varying_colorSet1;
    vec2 _texcoord0;
    vec2 _texcoord1;
    float _texcoord2;
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
vec2 _TMP13;
vec4 _TMP11[4];
vec4 _C0080[4];
vec4 _r0089;
vec4 _v0089;
vec4 _r0091;
vec4 _r0097;
vec4 _M0097[4];
vec4 _v0102;
vec4 _b0104;
float _b0109;
float _a0111;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
attribute vec4 SPECULAR;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_FrontSecondaryColor;
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
    _TMP13 = TEXCOORD0.xy + _uvOffset0;
    _TMP14.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
    _v0089 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0089 = _v0089.x*_world[0];
    _r0089 = _r0089 + _v0089.y*_world[1];
    _r0089 = _r0089 + _v0089.z*_world[2];
    _r0089 = _r0089 + _v0089.w*_world[3];
    _r0091 = _r0089.x*_viewProj[0];
    _r0091 = _r0091 + _r0089.y*_viewProj[1];
    _r0091 = _r0091 + _r0089.z*_viewProj[2];
    _r0091 = _r0091 + _r0089.w*_viewProj[3];
    _M0097[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0097[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0097[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0097[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0097 = cg_Vertex.x*_M0097[0];
    _r0097 = _r0097 + cg_Vertex.y*_M0097[1];
    _r0097 = _r0097 + cg_Vertex.z*_M0097[2];
    _r0097 = _r0097 + cg_Vertex.w*_M0097[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP13.x), float(_TMP13.y));
    _TMP9._texcoord1.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _v0102 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0104 = vec4(float(_v0102.x), float(_v0102.y), float(_v0102.z), float(_v0102.w));
    _TMP6 = (_b0104);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0097.xyz);
    _b0109 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0109);
    _dist = float(_TMP1);
    _a0111 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0111), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP9._texcoord2;
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_FrontSecondaryColor = vec4(float(SPECULAR.x), float(SPECULAR.y), float(SPECULAR.z), float(SPECULAR.w));
    cg_TexCoord1.xy = _TMP9._texcoord1;
    gl_Position = _r0091;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
