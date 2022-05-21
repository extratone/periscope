//
//  PTVSketchVertex.vsh
//  Proxsee
//
//  Created by Ben Sandofsky on 3/11/16.
//  Copyright © 2016 Joseph Bernstein. All rights reserved.
//

uniform float uMaxAge;
uniform mat4 uTransform;
uniform float uPointScale;

attribute vec4 position;
attribute float radius;
attribute vec4 aColor;
attribute float aAge;
attribute vec4 inputTextureCoordinate;
attribute float aDissolveAngle;

varying lowp vec4 vColor;
varying lowp float vLife;
varying vec2 textureCoordinate;


void main()
{
    gl_Position = position;
    gl_PointSize = radius * uPointScale;
    vColor = aColor;
    float life = (aAge / uMaxAge);
    vLife = life;

    lowp float introValue = (1.0 - smoothstep(0.0, 0.05, life));
    lowp float outroValue = smoothstep(0.75, 1.0, life);
    lowp float flairUpValue = smoothstep(0.7, 0.8, life);
    lowp float shrinkValue = 1.0 - smoothstep(0.7, 0.95, life);
    gl_Position.x += (cos(aDissolveAngle) * outroValue * 0.01);
    gl_Position.y += (sin(aDissolveAngle) * outroValue * 0.01);
    gl_Position *= uTransform;

    vColor.rgb = mix(vColor.rgb, vec3(1.0, 1.0, 1.0), (introValue * 0.6));
    vColor.rgb = mix(vColor.rgb, vec3(1.0, 1.0, 1.0), flairUpValue * 0.6);
    gl_PointSize *= (introValue + 1.0) * shrinkValue;
}
