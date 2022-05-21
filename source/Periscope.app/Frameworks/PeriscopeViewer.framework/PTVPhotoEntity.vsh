uniform vec2 uCanvasSize;
uniform mat4 uViewportTransform;
uniform sampler2D inputImageTexture;

attribute vec2 position;
attribute vec2 inputTextureCoordinate;

varying vec2 textureCoordinate;

void main()
{
    gl_Position = uViewportTransform * vec4(position.x / uCanvasSize.x * 2.0 - 1.0, position.y / uCanvasSize.y * 2.0 - 1.0, 0.0, 1.0);
    textureCoordinate = inputTextureCoordinate;
}