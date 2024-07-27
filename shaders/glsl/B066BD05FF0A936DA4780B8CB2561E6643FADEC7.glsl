//SharedShaders/0x56170470.ios_vcode uklgonzale Wed Mar 12 14:31:46 2014

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
vec3 _TMP13;
vec4 _TMP11[4];
vec4 _C0083[4];
vec3 _v0087;
vec3 _TMP790087[3];
vec3 _r0089;
vec4 _r0096;
vec4 _v0096;
vec4 _r0098;
vec4 _r0104;
vec4 _M0104[4];
vec4 _v0109;
vec4 _b0111;
float _b0115;
float _a0117;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP118;
vec3 _TMP119;
vec3 _TMP120;
vec3 _TMP121;
vec3 _TMP122;
vec3 _TMP123;
vec3 _TMP124;
vec3 _TMP125;
vec3 _TMP126;
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
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _C0083[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0083[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0083[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0083[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0083[0].x), float(_C0083[0].y), float(_C0083[0].z), float(_C0083[0].w));
    _TMP11[1] = vec4(float(_C0083[1].x), float(_C0083[1].y), float(_C0083[1].z), float(_C0083[1].w));
    _TMP11[2] = vec4(float(_C0083[2].x), float(_C0083[2].y), float(_C0083[2].z), float(_C0083[2].w));
    _TMP11[3] = vec4(float(_C0083[3].x), float(_C0083[3].y), float(_C0083[3].z), float(_C0083[3].w));
    _v0087 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP118.x = _TMP11[0].x;
    _TMP119.y = _TMP11[0].y;
    _TMP120.z = _TMP11[0].z;
    _TMP790087[0] = vec3(float(_TMP118.x), float(_TMP119.y), float(_TMP120.z));
    _TMP121.x = _TMP11[1].x;
    _TMP122.y = _TMP11[1].y;
    _TMP123.z = _TMP11[1].z;
    _TMP790087[1] = vec3(float(_TMP121.x), float(_TMP122.y), float(_TMP123.z));
    _TMP124.x = _TMP11[2].x;
    _TMP125.y = _TMP11[2].y;
    _TMP126.z = _TMP11[2].z;
    _TMP790087[2] = vec3(float(_TMP124.x), float(_TMP125.y), float(_TMP126.z));
    _r0089 = _v0087.x*_TMP790087[0];
    _r0089 = _r0089 + _v0087.y*_TMP790087[1];
    _r0089 = _r0089 + _v0087.z*_TMP790087[2];
    _TMP13 = vec3(float(_r0089.x), float(_r0089.y), float(_r0089.z));
    _TMP14 = TEXCOORD0.xy + _uvOffset0;
    _v0096 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0096 = _v0096.x*_world[0];
    _r0096 = _r0096 + _v0096.y*_world[1];
    _r0096 = _r0096 + _v0096.z*_world[2];
    _r0096 = _r0096 + _v0096.w*_world[3];
    _r0098 = _r0096.x*_viewProj[0];
    _r0098 = _r0098 + _r0096.y*_viewProj[1];
    _r0098 = _r0098 + _r0096.z*_viewProj[2];
    _r0098 = _r0098 + _r0096.w*_viewProj[3];
    _M0104[0] = vec4(float(_TMP11[0].x), float(_TMP11[0].y), float(_TMP11[0].z), float(_TMP11[0].w));
    _M0104[1] = vec4(float(_TMP11[1].x), float(_TMP11[1].y), float(_TMP11[1].z), float(_TMP11[1].w));
    _M0104[2] = vec4(float(_TMP11[2].x), float(_TMP11[2].y), float(_TMP11[2].z), float(_TMP11[2].w));
    _M0104[3] = vec4(float(_TMP11[3].x), float(_TMP11[3].y), float(_TMP11[3].z), float(_TMP11[3].w));
    _r0104 = cg_Vertex.x*_M0104[0];
    _r0104 = _r0104 + cg_Vertex.y*_M0104[1];
    _r0104 = _r0104 + cg_Vertex.z*_M0104[2];
    _r0104 = _r0104 + cg_Vertex.w*_M0104[3];
    _TMP9._texcoord0.xyzw = vec4(float(_TMP13.x), float(_TMP13.y), float(_TMP13.z), 1.00000000E+000);
    _TMP9._texcoord1.xy = vec2(float(_TMP14.x), float(_TMP14.y));
    _v0109 = vec4(float(float(((COLOR*_kTint)*2.00000000E+000).x)), float(float(((COLOR*_kTint)*2.00000000E+000).y)), float(float(((COLOR*_kTint)*2.00000000E+000).z)), float(float(((COLOR*_kTint)*2.00000000E+000).w)));
    _b0111 = vec4(float(_v0109.x), float(_v0109.y), float(_v0109.z), float(_v0109.w));
    _TMP6 = (_b0111);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0104.xyz);
    _b0115 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0115);
    _dist = float(_TMP1);
    _a0117 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0117), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord1.xy = _TMP9._texcoord1;
    gl_Position = _r0098;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
