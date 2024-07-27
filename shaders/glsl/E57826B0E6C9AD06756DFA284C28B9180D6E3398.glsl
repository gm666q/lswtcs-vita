precision highp float;

//NU2API TEXTURES : 0 
//NU2API CONSTANTS : 8 	_faceOnMag 84, 	_faceOnMtx 80, 	_faceOnTranslation 89, 	_fog_params 48, 	_kTint 40, 	_view 12, 	_viewMtx 85, 	_viewProj 0, 
//NU2API ATTRIBS : 0 

//#version 130

struct VS_IN {
    vec3 _pos;
    vec4 _color;
    vec2 _texcoord;
    vec2 _size;
};

struct VS_OUT {
    vec4 _pos1;
    vec4 _color1;
    vec2 _texcoord1;
    vec3 _fog;
};

struct PSOutput {
    vec4 _color2;
};

vec4 _r0016;
vec4 _r0018;
vec4 _v0018;
vec4 _r0020;
vec3 _a0022;
float _TMP23;
float _x0024;
vec4 _r0028;
attribute vec4 COLOR;
attribute vec2 TEXCOORD0;
attribute vec2 TEXCOORD1;
uniform vec4 _viewProj[4];
uniform vec4 _view[4];
uniform vec4 _kTint;
uniform vec4 _fog_params;
uniform vec4 _faceOnMtx[4];
uniform vec4 _faceOnMag;
uniform vec4 _viewMtx[4];
uniform vec4 _faceOnTranslation;
attribute vec3 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 // main procedure, the original name was faceOn_vx
void main()
{

    VS_OUT _OUT;
    vec4 _vVertexPos;
    vec4 _vCenterPos;
    float _fVertexToEyeDistance;
    float _dd;

    _vVertexPos = vec4(TEXCOORD1.x, TEXCOORD1.y, 0.00000000E+000, 1.00000000E+000);
    _vVertexPos.xyz = _vVertexPos.xyz*_faceOnMag.x;
    _r0016 = _vVertexPos.x*_viewMtx[0];
    _r0016 = _r0016 + _vVertexPos.y*_viewMtx[1];
    _r0016 = _r0016 + _vVertexPos.z*_viewMtx[2];
    _r0016 = _r0016 + _vVertexPos.w*_viewMtx[3];
    _v0018 = vec4(cg_Vertex.x, cg_Vertex.y, cg_Vertex.z, 1.00000000E+000);
    _r0018 = _v0018.x*_faceOnMtx[0];
    _r0018 = _r0018 + _v0018.y*_faceOnMtx[1];
    _r0018 = _r0018 + _v0018.z*_faceOnMtx[2];
    _r0018 = _r0018 + _v0018.w*_faceOnMtx[3];
    _vCenterPos.xyz = _r0018.xyz + _faceOnTranslation.xyz;
    _vVertexPos.xyz = _r0016.xyz + _vCenterPos.xyz;
    _r0020 = _vVertexPos.x*_view[0];
    _r0020 = _r0020 + _vVertexPos.y*_view[1];
    _r0020 = _r0020 + _vVertexPos.z*_view[2];
    _r0020 = _r0020 + _r0016.w*_view[3];
    _a0022 = _r0020.xyz/_r0020.w;
    _fVertexToEyeDistance = length(_a0022);
    _dd = _fVertexToEyeDistance*_fog_params.w;
    _x0024 = _dd*_dd;
    _TMP23 = pow(2.71828198E+000, _x0024);
    _OUT._fog.x = 1.00000000E+000/_TMP23;
    _OUT._fog.y = 0.00000000E+000;
    _OUT._fog.z = 0.00000000E+000;
    _r0028 = _vVertexPos.x*_viewProj[0];
    _r0028 = _r0028 + _vVertexPos.y*_viewProj[1];
    _r0028 = _r0028 + _vVertexPos.z*_viewProj[2];
    _r0028 = _r0028 + _r0016.w*_viewProj[3];
    _OUT._color1 = COLOR;
    _OUT._color1.w = COLOR.w*2.00000000E+000;
    _OUT._color1 = _OUT._color1*_kTint;
    _OUT._texcoord1.xy = vec2(-TEXCOORD0.x, TEXCOORD0.y);
    cg_TexCoord0.xy = _OUT._texcoord1;
    cg_TexCoord1.xyz = _OUT._fog;
    gl_Position = _r0028;
    cg_FrontColor = _OUT._color1;
    return;
} // main end



