uniform sampler2D uMaskTexture;

varying highp vec2 tCoord;

void main()
{
    gl_FragColor = texture2D(uMaskTexture, tCoord);
}
