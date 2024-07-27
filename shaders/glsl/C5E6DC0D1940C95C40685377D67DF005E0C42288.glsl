//SharedShaders/0x6fffd899.ios_vcode uklgonzale Wed Mar 12 14:34:22 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _uvSet01;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec2 _texcoord0;
    float _texcoord1;
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
vec2 _TMP13;
vec4 _TMP11[4];
vec4 _C0072[4];
vec4 _r0079;
vec4 _v0079;
vec4 _r0081;
vec4 _r0087;
vec4 _M0087[4];
vec4 _v0091;
vec4 _b0093;
float _b0097;
float _a0099;
attribute vec4 TEXCOORD0;
attribute vec4 COLOR;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _lightmapOffset;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 void main()
{

    float _dist;
    float _dd;

    _C0072[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0072[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0072[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0072[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0072[0].x), float(_C0072[0].y), float(_C0072[0].z), float(_C0072[0].w));
    _TMP11[1] = vec4(float(_C0072[1].x), float(_C0072[1].y), float(_C0072[1].z), float(_C0072[1].w));
    _TMP11[2] = vec4(float(_C0072[2].x), float(_C0072[2].y), float(_C0072[2].z), float(_C0072[2].w));
    _TMP11[3] = vec4(float(_C0072[3].x), float(_C0072[3].y), float(_C0072[3].z), float(_C0072[3].w));
    _TMP13.xy = vec2(float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).x), float((vec2(float(TEXCOORD0.z), float(TEXCOORD0.w)) + _lightmapOffset.xy).y));
    _v0079 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0079 = _v0079.x*_world[0];
    _r0079 = _r0079 + _v0079.y*_world[1];
    _r0079 = _r0079 + _v0079.z*_world[2];
    _r0079 = _r0079 + _v0079.w*_world[3];
    _r0081 = _r0079.x*_viewProj[0];
    _r0081 = _r0081 + _r0079.y*_viewProj[1];
    _r0081 = _r0081 + _r0079.z*_viewProj[2];
    _r0081 = _r0081 + _r0079.w*_viewProj[3];
    _M0087[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0087[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0087[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0087[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0087 = cg_Vertex.x*_M0087[0];
    _r0087 = _r0087 + cg_Vertex.y*_M0087[1];
    _r0087 = _r0087 + cg_Vertex.z*_M0087[2];
    _r0087 = _r0087 + cg_Vertex.w*_M0087[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP13.x), float(_TMP13.y));
    _v0091 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0093 = vec4(float(_v0091.x), float(_v0091.y), float(_v0091.z), float(_v0091.w));
    _TMP6 = (_b0093);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0087.xyz);
    _b0097 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0097);
    _dist = float(_TMP1);
    _a0099 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0099), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord1 = float(_dd);
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_TexCoord1.x = _TMP9._texcoord1;
    gl_Position = _r0081;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 