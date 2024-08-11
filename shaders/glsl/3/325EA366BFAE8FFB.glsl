precision highp float;

//NU2API TEXTURES : 0 
//NU2API CONSTANTS : 0 
//NU2API ATTRIBS : 0 

//#version 130

struct VS_IN {
    vec4 _ObjPos;
};

struct VS_OUT {
    vec4 _position;
    vec2 _Texture;
};

struct VS_OUT2 {
    vec4 _position1;
};

struct VS_IN3 {
    vec4 _ObjPos1;
    vec4 _color;
};

struct VS_OUT3 {
    vec4 _position2;
    vec4 _color1;
};

struct PS_IN3 {
    vec4 _color2;
};

attribute vec4 cg_Vertex;
varying vec4 cg_TexCoord0;

 // main procedure, the original name was default_vx
void main()
{

    VS_OUT _Out;

    _Out._Texture = cg_Vertex.xy*5.00000000E-001 + 5.00000000E-001;
    cg_TexCoord0.xy = _Out._Texture;
    gl_Position = cg_Vertex;
    return;
} // main end



