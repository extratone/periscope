uniform mat4 uTransform;

attribute vec4 position;
attribute vec2 inputTextureCoordinate;
varying vec2 vTextureCoordinate;

void main()
{
    gl_Position = position * uTransform;
    vTextureCoordinate = inputTextureCoordinate;
}
