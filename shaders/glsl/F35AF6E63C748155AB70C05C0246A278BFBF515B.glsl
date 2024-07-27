precision lowp float;

#define sampler3D samplerCube
vec4 texture(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 textureLod(sampler2D sampler, vec2 coord, float lod) { return texture2D(sampler, coord); }
vec4 textureLod(samplerCube sampler, vec3 coord, float lod) { return textureCube(sampler, coord); }
vec4 texture(sampler2D sampler, vec2 coord) { return texture2D(sampler, coord); }
vec4 texture(samplerCube sampler, vec3 coord) { return textureCube(sampler, coord); }

//NU2API TEXTURES : 1 	_diffuse_tex 0, 
//NU2API CONSTANTS : 0 

//#version 130

struct VS_IN {
    int dummy;
};

struct PS_IN {
    vec2 _Texture;
};

struct VS_OUT5X5 {
    vec4 _offsets[7];
};

struct VS_OUT7X7 {
    vec4 _offsetWeights1[7];
};

struct VS_OUTBLURGUARD {
    vec2 _texcoord;
};

struct VS_OUT_SM1 {
    vec2 _texcoord0;
    vec2 _texcoord1;
    vec2 _texcoord2;
    vec2 _texcoord3;
};

vec2 _TMP3;
vec4 _TMP2;
vec4 _TMP1;
VS_OUT7X7 _In1;
vec2 _c0018;
vec2 _c0020;
uniform sampler2D _diffuse_tex;
varying vec4 cg_TexCoord4;
varying vec4 cg_TexCoord1;
varying vec4 cg_TexCoord6;
varying vec4 cg_TexCoord3;
varying vec4 cg_TexCoord0;
varying vec4 cg_TexCoord5;
varying vec4 cg_TexCoord2;
#define cg_FragColor gl_FragColor

 // main procedure, the original name was blur7x7dof_px
void main()
{

    vec4 _prev;
    vec4 _vColor;
    vec2 _ba1;

    _In1._offsetWeights1[2] = vec4(float(cg_TexCoord2.x), float(cg_TexCoord2.y), float(cg_TexCoord2.z), float(cg_TexCoord2.w));
    _In1._offsetWeights1[5] = vec4(float(cg_TexCoord5.x), float(cg_TexCoord5.y), float(cg_TexCoord5.z), float(cg_TexCoord5.w));
    _In1._offsetWeights1[0] = vec4(float(cg_TexCoord0.x), float(cg_TexCoord0.y), float(cg_TexCoord0.z), float(cg_TexCoord0.w));
    _In1._offsetWeights1[3] = vec4(float(cg_TexCoord3.x), float(cg_TexCoord3.y), float(cg_TexCoord3.z), float(cg_TexCoord3.w));
    _In1._offsetWeights1[6] = vec4(float(cg_TexCoord6.x), float(cg_TexCoord6.y), float(cg_TexCoord6.z), float(cg_TexCoord6.w));
    _In1._offsetWeights1[1] = vec4(float(cg_TexCoord1.x), float(cg_TexCoord1.y), float(cg_TexCoord1.z), float(cg_TexCoord1.w));
    _In1._offsetWeights1[4] = vec4(float(cg_TexCoord4.x), float(cg_TexCoord4.y), float(cg_TexCoord4.z), float(cg_TexCoord4.w));
    _c0018 = vec2(float(_In1._offsetWeights1[0].x), float(_In1._offsetWeights1[0].y));
    _TMP1 = texture(_diffuse_tex, _c0018);
    _prev = vec4(float(_TMP1.x), float(_TMP1.y), float(_TMP1.z), float(_TMP1.w));
    _vColor = _prev*vec4( 1.00000000E+000, 1.00000000E+000, 1.42822266E-001, 1.42822266E-001);
    _c0020 = vec2(float(_In1._offsetWeights1[1].x), float(_In1._offsetWeights1[1].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _c0020 = vec2(float(_In1._offsetWeights1[2].x), float(_In1._offsetWeights1[2].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _c0020 = vec2(float(_In1._offsetWeights1[3].x), float(_In1._offsetWeights1[3].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _c0020 = vec2(float(_In1._offsetWeights1[4].x), float(_In1._offsetWeights1[4].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _c0020 = vec2(float(_In1._offsetWeights1[5].x), float(_In1._offsetWeights1[5].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _c0020 = vec2(float(_In1._offsetWeights1[6].x), float(_In1._offsetWeights1[6].y));
    _TMP2 = texture(_diffuse_tex, _c0020);
    _ba1 = vec2(float(_TMP2.z), float(_TMP2.w));
    _vColor.zw = _vColor.zw + _ba1/7.00000000E+000;
    _TMP3 = max(vec2(float(_prev.z), float(_prev.w)), vec2(float(_vColor.z), float(_vColor.w)));
    _vColor.zw = vec2(float(_TMP3.x), float(_TMP3.y));
    cg_FragColor = vec4(float(_vColor.x), float(_vColor.y), float(_vColor.z), float(_vColor.w));
    return;
} // main end



