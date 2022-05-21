uniform mat4 uTransform;

attribute vec4 position;
attribute vec2 textureCoordinate;

varying highp vec2 tCoord;

void main()
{
    tCoord = textureCoordinate;
    gl_Position = position;
    gl_Position *= uTransform;
}
