precision highp float;

//NU2API TEXTURES : 0 
//NU2API CONSTANTS : 2 	_offsetWeights 160, 	_scaleBias 173, 
//NU2API ATTRIBS : 1 	0 0

//#version 130

struct VS_IN {
    vec4 _position;
};

struct PS_IN {
    vec2 _Texture;
};

struct VS_OUT5X5 {
    vec4 _position1;
    vec4 _offsets[7];
};

struct VS_OUT7X7 {
    vec4 _position2;
    vec4 _offsetWeights1[7];
};

struct VS_OUTBLURGUARD {
    vec4 _position3;
    vec2 _texcoord1;
};

struct VS_OUT_SM1 {
    vec4 _position4;
    vec2 _texcoord0;
    vec2 _texcoord11;
    vec2 _texcoord2;
    vec2 _texcoord3;
};

uniform vec4 _offsetWeights[13];
uniform vec4 _scaleBias;
attribute vec4 cg_Vertex;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord6;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord5;
varying vec4 cg_TexCoord2;

 // main procedure, the original name was blur7x7_vx
void main()
{

    VS_OUT7X7 _vout;
    vec2 _texcoord;

    _texcoord = vec2(float((cg_Vertex.xy*vec2( 5.00000000E-001, -5.00000000E-001) + 5.00000000E-001).x), float((cg_Vertex.xy*vec2( 5.00000000E-001, -5.00000000E-001) + 5.00000000E-001).y));
    _vout._offsetWeights1[0].xy = _offsetWeights[0].xy + _texcoord;
    _vout._offsetWeights1[0].xy = _vout._offsetWeights1[0].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[1].xy = _offsetWeights[1].xy + _texcoord;
    _vout._offsetWeights1[1].xy = _vout._offsetWeights1[1].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[2].xy = _offsetWeights[2].xy + _texcoord;
    _vout._offsetWeights1[2].xy = _vout._offsetWeights1[2].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[3].xy = _offsetWeights[3].xy + _texcoord;
    _vout._offsetWeights1[3].xy = _vout._offsetWeights1[3].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[4].xy = _offsetWeights[4].xy + _texcoord;
    _vout._offsetWeights1[4].xy = _vout._offsetWeights1[4].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[5].xy = _offsetWeights[5].xy + _texcoord;
    _vout._offsetWeights1[5].xy = _vout._offsetWeights1[5].xy*_scaleBias.xy + _scaleBias.zw;
    _vout._offsetWeights1[6].xy = _offsetWeights[6].xy + _texcoord;
    _vout._offsetWeights1[6].xy = _vout._offsetWeights1[6].xy*_scaleBias.xy + _scaleBias.zw;
    cg_TexCoord2 = vec4(float(_vout._offsetWeights1[2].x), float(_vout._offsetWeights1[2].y), float(_offsetWeights[2].z), float(_offsetWeights[2].w));
    cg_TexCoord5 = vec4(float(_vout._offsetWeights1[5].x), float(_vout._offsetWeights1[5].y), float(_offsetWeights[5].z), float(_offsetWeights[5].w));
    cg_TexCoord0 = vec4(float(_vout._offsetWeights1[0].x), float(_vout._offsetWeights1[0].y), float(_offsetWeights[0].z), float(_offsetWeights[0].w));
    cg_TexCoord3 = vec4(float(_vout._offsetWeights1[3].x), float(_vout._offsetWeights1[3].y), float(_offsetWeights[3].z), float(_offsetWeights[3].w));
    cg_TexCoord6 = vec4(float(_vout._offsetWeights1[6].x), float(_vout._offsetWeights1[6].y), float(_offsetWeights[6].z), float(_offsetWeights[6].w));
    cg_TexCoord1 = vec4(float(_vout._offsetWeights1[1].x), float(_vout._offsetWeights1[1].y), float(_offsetWeights[1].z), float(_offsetWeights[1].w));
    cg_TexCoord4 = vec4(float(_vout._offsetWeights1[4].x), float(_vout._offsetWeights1[4].y), float(_offsetWeights[4].z), float(_offsetWeights[4].w));
    gl_Position = cg_Vertex;
    return;
} // main end



