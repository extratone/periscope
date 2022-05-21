varying highp vec2 vTextureCoordinate;
uniform sampler2D uLuminanceTexture;
uniform sampler2D uChrominanceTexture;
uniform mediump mat3 uColorConversionMatrix;
uniform highp float uColorFloorOffset;
uniform bool uDim;

highp vec3 BicubicHermiteTextureSample (highp vec2 P);

void main()
{
    mediump vec3 yuv;
    lowp vec3 rgb;

    lowp vec2 texScale = vec2(0.56338028, 0.56338028);
    highp float y = texture2D(uLuminanceTexture, vTextureCoordinate).r;
    
    highp vec2 uv = texture2D(uChrominanceTexture, vTextureCoordinate).ra;
    yuv.x = y - uColorFloorOffset;
    yuv.yz = uv - vec2(0.5, 0.5);
    rgb = uColorConversionMatrix * yuv;
    if (uDim){
        rgb = mix(rgb, vec3(0.0, 0.0, 0.0), 0.5);
    }

    gl_FragColor = vec4(rgb, 1);
}
