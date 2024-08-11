//SharedShaders/0x9c0f0d19.ios_vcode uklgonzale Wed Mar 12 20:10:32 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _colorSet0;
    vec2 _uvSet0;
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
vec4 _C0079[4];
vec4 _r0086;
vec4 _v0086;
vec4 _r0088;
vec4 _r0094;
vec4 _M0094[4];
vec4 _v0098;
vec4 _b0100;
float _b0104;
float _a0106;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec2 _uvOffset0;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 void main()
{

    float _dist;
    float _dd;

    _C0079[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0079[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0079[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0079[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0079[0].x), float(_C0079[0].y), float(_C0079[0].z), float(_C0079[0].w));
    _TMP11[1] = vec4(float(_C0079[1].x), float(_C0079[1].y), float(_C0079[1].z), float(_C0079[1].w));
    _TMP11[2] = vec4(float(_C0079[2].x), float(_C0079[2].y), float(_C0079[2].z), float(_C0079[2].w));
    _TMP11[3] = vec4(float(_C0079[3].x), float(_C0079[3].y), float(_C0079[3].z), float(_C0079[3].w));
    _TMP13 = TEXCOORD0.xy + _uvOffset0;
    _v0086 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0086 = _v0086.x*_world[0];
    _r0086 = _r0086 + _v0086.y*_world[1];
    _r0086 = _r0086 + _v0086.z*_world[2];
    _r0086 = _r0086 + _v0086.w*_world[3];
    _r0088 = _r0086.x*_viewProj[0];
    _r0088 = _r0088 + _r0086.y*_viewProj[1];
    _r0088 = _r0088 + _r0086.z*_viewProj[2];
    _r0088 = _r0088 + _r0086.w*_viewProj[3];
    _M0094[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0094[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0094[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0094[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0094 = cg_Vertex.x*_M0094[0];
    _r0094 = _r0094 + cg_Vertex.y*_M0094[1];
    _r0094 = _r0094 + cg_Vertex.z*_M0094[2];
    _r0094 = _r0094 + cg_Vertex.w*_M0094[3];
    _TMP9._texcoord0.xy = vec2(float(_TMP13.x), float(_TMP13.y));
    _v0098 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0100 = vec4(float(_v0098.x), float(_v0098.y), float(_v0098.z), float(_v0098.w));
    _TMP6 = (_b0100);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0094.xyz);
    _b0104 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0104);
    _dist = float(_TMP1);
    _a0106 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0106), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord1 = float(_dd);
    cg_TexCoord0.xy = _TMP9._texcoord0;
    cg_TexCoord1.x = _TMP9._texcoord1;
    gl_Position = _r0088;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
