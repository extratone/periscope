varying highp vec2 textureCoordinate;

uniform sampler2D inputImageTexture;
uniform highp float opacity;

void main()
{
    gl_FragColor = texture2D(inputImageTexture, textureCoordinate);
    gl_FragColor.a *= opacity;
}