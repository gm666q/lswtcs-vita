//SharedShaders/0x15305724.ios_vcode uklgonzale Tue Mar 11 16:25:14 2014

precision highp float;



struct VertexInput {
    vec4 _position;
    vec4 _normal;
    vec4 _colorSet0;
};

struct VertexOutput {
    vec4 _varying_position;
    vec4 _varying_colorSet0;
    vec4 _texcoord0;
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
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0079[4];
vec3 _v0083;
vec3 _TMP750083[3];
vec3 _r0085;
vec4 _r0090;
vec4 _v0090;
vec4 _r0092;
vec4 _r0098;
vec4 _M0098[4];
vec4 _v0102;
vec4 _b0104;
float _b0108;
float _a0110;
attribute vec4 NORMAL;
attribute vec4 COLOR;
vec3 _TMP111;
vec3 _TMP112;
vec3 _TMP113;
vec3 _TMP114;
vec3 _TMP115;
vec3 _TMP116;
vec3 _TMP117;
vec3 _TMP118;
vec3 _TMP119;
uniform vec4 _viewProj[4];
uniform vec4 _vs_view[4];
uniform vec4 _world[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
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
    _v0083 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP111.x = _TMP11[0].x;
    _TMP112.y = _TMP11[0].y;
    _TMP113.z = _TMP11[0].z;
    _TMP750083[0] = vec3(float(_TMP111.x), float(_TMP112.y), float(_TMP113.z));
    _TMP114.x = _TMP11[1].x;
    _TMP115.y = _TMP11[1].y;
    _TMP116.z = _TMP11[1].z;
    _TMP750083[1] = vec3(float(_TMP114.x), float(_TMP115.y), float(_TMP116.z));
    _TMP117.x = _TMP11[2].x;
    _TMP118.y = _TMP11[2].y;
    _TMP119.z = _TMP11[2].z;
    _TMP750083[2] = vec3(float(_TMP117.x), float(_TMP118.y), float(_TMP119.z));
    _r0085 = _v0083.x*_TMP750083[0];
    _r0085 = _r0085 + _v0083.y*_TMP750083[1];
    _r0085 = _r0085 + _v0083.z*_TMP750083[2];
    _TMP13 = vec3(float(_r0085.x), float(_r0085.y), float(_r0085.z));
    _v0090 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0090 = _v0090.x*_world[0];
    _r0090 = _r0090 + _v0090.y*_world[1];
    _r0090 = _r0090 + _v0090.z*_world[2];
    _r0090 = _r0090 + _v0090.w*_world[3];
    _r0092 = _r0090.x*_viewProj[0];
    _r0092 = _r0092 + _r0090.y*_viewProj[1];
    _r0092 = _r0092 + _r0090.z*_viewProj[2];
    _r0092 = _r0092 + _r0090.w*_viewProj[3];
    _M0098[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0098[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0098[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0098[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0098 = cg_Vertex.x*_M0098[0];
    _r0098 = _r0098 + cg_Vertex.y*_M0098[1];
    _r0098 = _r0098 + cg_Vertex.z*_M0098[2];
    _r0098 = _r0098 + cg_Vertex.w*_M0098[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _v0102 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0104 = vec4(float(_v0102.x), float(_v0102.y), float(_v0102.z), float(_v0102.w));
    _TMP6 = (_b0104);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0098.xyz);
    _b0108 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0108);
    _dist = float(_TMP1);
    _a0110 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0110), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord1 = float(_dd);
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord1.x = _TMP9._texcoord1;
    gl_Position = _r0092;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
