//SharedShaders/0x2ba0f489.ios_vcode uklgonzale Wed Mar 12 14:33:32 2014

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
VertexInput _TMP8;
vec4 _TMP6;
vec4 _TMP12;
vec2 _TMP15;
vec3 _TMP14;
vec4 _TMP11[4];
float _TMP17;
vec4 _C0087[4];
vec3 _v0091;
vec3 _TMP830091[3];
vec3 _r0093;
vec4 _objectPosition0102;
vec4 _r0106;
vec4 _v0106;
vec4 _r0108;
vec4 _r0114;
vec4 _M0114[4];
vec4 _v0119;
vec4 _b0121;
float _b0125;
float _a0127;
attribute vec4 NORMAL;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
vec3 _TMP128;
vec3 _TMP129;
vec3 _TMP130;
vec3 _TMP131;
vec3 _TMP132;
vec3 _TMP133;
vec3 _TMP134;
vec3 _TMP135;
vec3 _TMP136;
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
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord2;

 void main()
{

    float _dist;
    float _dd;

    _TMP8._colorSet0 = COLOR;
    _C0087[0] = _world[0].x*_vs_view[0] + _world[0].y*_vs_view[1] + _world[0].z*_vs_view[2] + _world[0].w*_vs_view[3];
    _C0087[1] = _world[1].x*_vs_view[0] + _world[1].y*_vs_view[1] + _world[1].z*_vs_view[2] + _world[1].w*_vs_view[3];
    _C0087[2] = _world[2].x*_vs_view[0] + _world[2].y*_vs_view[1] + _world[2].z*_vs_view[2] + _world[2].w*_vs_view[3];
    _C0087[3] = _world[3].x*_vs_view[0] + _world[3].y*_vs_view[1] + _world[3].z*_vs_view[2] + _world[3].w*_vs_view[3];
    _TMP11[0] = vec4(float(_C0087[0].x), float(_C0087[0].y), float(_C0087[0].z), float(_C0087[0].w));
    _TMP11[1] = vec4(float(_C0087[1].x), float(_C0087[1].y), float(_C0087[1].z), float(_C0087[1].w));
    _TMP11[2] = vec4(float(_C0087[2].x), float(_C0087[2].y), float(_C0087[2].z), float(_C0087[2].w));
    _TMP11[3] = vec4(float(_C0087[3].x), float(_C0087[3].y), float(_C0087[3].z), float(_C0087[3].w));
    _v0091 = vec3(float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).x), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).y), float((NORMAL.xyz*2.00000000E+000 - 1.00000000E+000).z));
    _TMP128.x = _TMP11[0].x;
    _TMP129.y = _TMP11[0].y;
    _TMP130.z = _TMP11[0].z;
    _TMP830091[0] = vec3(float(_TMP128.x), float(_TMP129.y), float(_TMP130.z));
    _TMP131.x = _TMP11[1].x;
    _TMP132.y = _TMP11[1].y;
    _TMP133.z = _TMP11[1].z;
    _TMP830091[1] = vec3(float(_TMP131.x), float(_TMP132.y), float(_TMP133.z));
    _TMP134.x = _TMP11[2].x;
    _TMP135.y = _TMP11[2].y;
    _TMP136.z = _TMP11[2].z;
    _TMP830091[2] = vec3(float(_TMP134.x), float(_TMP135.y), float(_TMP136.z));
    _r0093 = _v0091.x*_TMP830091[0];
    _r0093 = _r0093 + _v0091.y*_TMP830091[1];
    _r0093 = _r0093 + _v0091.z*_TMP830091[2];
    _TMP14 = vec3(float(_r0093.x), float(_r0093.y), float(_r0093.z));
    _TMP17 = NORMAL.w*3.10000000E+001;
    _TMP12 = _waterTable[(int(_TMP17))];
    _TMP15 = TEXCOORD0.xy + _uvOffset0;
    _objectPosition0102 = cg_Vertex + vec4(0.00000000E+000, float(_TMP12.w), 0.00000000E+000, 0.00000000E+000);
    _v0106 = vec4(_objectPosition0102.x, _objectPosition0102.y, _objectPosition0102.z, 1.00000000E+000);
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
    _TMP9._texcoord0.xyzw = vec4(float(_TMP14.x), float(_TMP14.y), float(_TMP14.z), 1.00000000E+000);
    _TMP9._texcoord1.xy = vec2(float(_TMP15.x), float(_TMP15.y)) + (5.00000007E-002*float(_fxAttributes.z))*vec2(float(_TMP12.x), float(_TMP12.y));
    _TMP8._colorSet0.w = COLOR.w*1.50000000E+000;
    _v0119 = vec4(float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).x)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).y)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).z)), float(float(((_TMP8._colorSet0*_kTint)*2.00000000E+000).w)));
    _b0121 = vec4(float(_v0119.x), float(_v0119.y), float(_v0119.z), float(_v0119.w));
    _TMP6 = (_b0121);
    _TMP9._varying_colorSet0 = vec4(float(_TMP6.x), float(_TMP6.y), float(_TMP6.z), float(_TMP6.w));
    _TMP0 = length(_r0114.xyz);
    _b0125 = _TMP0 - float(_fog_params.x);
    _TMP1 = max(0.00000000E+000, _b0125);
    _dist = float(_TMP1);
    _a0127 = _dist/_fog_params.z;
    _TMP4 = min(float(_a0127), 1.00000000E+000);
    _TMP2 = float(_TMP4);
    _dd = float((1.00000000E+000 - float(_TMP2)));
    _TMP9._texcoord2 = float(_dd);
    cg_TexCoord2.x = _TMP9._texcoord2;
    cg_TexCoord0 = _TMP9._texcoord0;
    cg_TexCoord1.xy = _TMP9._texcoord1;
    gl_Position = _r0108;
    cg_FrontColor = vec4(float(_TMP9._varying_colorSet0.x), float(_TMP9._varying_colorSet0.y), float(_TMP9._varying_colorSet0.z), float(_TMP9._varying_colorSet0.w));
    return;
} 
