precision highp float;

//NU2API TEXTURES : 0 
//NU2API CONSTANTS : 3 	_fog_params 48, 	_view 12, 	_viewProj 0, 
//NU2API ATTRIBS : 0 

//#version 130

struct VS_IN {
    vec4 _pos;
    vec4 _color;
    vec2 _texcoord;
};

struct VS_OUT {
    vec4 _pos1;
    vec4 _color1;
    vec4 _texcoord1;
    vec3 _fog;
};

vec4 _r0010;
vec3 _a0012;
float _TMP13;
float _x0014;
vec4 _r0018;
attribute vec4 COLOR;
attribute vec4 TEXCOORD0;
uniform vec4 _viewProj[4];
uniform vec4 _view[4];
uniform vec4 _fog_params;
attribute vec4 cg_Vertex;
varying vec4 cg_FrontColor;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord0;

 // main procedure, the original name was debris_vx
void main()
{

    VS_OUT _OUT;
    float _fVertexToEyeDistance;
    float _dd;

    _r0010 = cg_Vertex.x*_view[0];
    _r0010 = _r0010 + cg_Vertex.y*_view[1];
    _r0010 = _r0010 + cg_Vertex.z*_view[2];
    _r0010 = _r0010 + cg_Vertex.w*_view[3];
    _a0012 = _r0010.xyz/_r0010.w;
    _fVertexToEyeDistance = length(_a0012);
    _dd = _fVertexToEyeDistance*_fog_params.w;
    _x0014 = _dd*_dd;
    _TMP13 = pow(2.71828198E+000, _x0014);
    _OUT._fog.x = 1.00000000E+000/_TMP13;
    _OUT._fog.y = 0.00000000E+000;
    _OUT._fog.z = 0.00000000E+000;
    _r0018 = cg_Vertex.x*_viewProj[0];
    _r0018 = _r0018 + cg_Vertex.y*_viewProj[1];
    _r0018 = _r0018 + cg_Vertex.z*_viewProj[2];
    _r0018 = _r0018 + cg_Vertex.w*_viewProj[3];
    _OUT._texcoord1.xy = TEXCOORD0.xy;
    _OUT._texcoord1.zw = vec2( 0.00000000E+000, 0.00000000E+000);
    cg_TexCoord0 = _OUT._texcoord1;
    cg_TexCoord1.xyz = _OUT._fog;
    gl_Position = _r0018;
    cg_FrontColor = COLOR;
    return;
} // main end



