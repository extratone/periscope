//
//  PTVSketchFragment.fsh
//  Proxsee
//
//  Created by Ben Sandofsky on 3/11/16.
//  Copyright © 2016 Joseph Bernstein. All rights reserved.
//

varying highp vec2 textureCoordinate;
varying lowp vec4 vColor;
varying lowp float vLife;

uniform sampler2D uBrushTexture;

void main()
{
    lowp float outroFade = (1.0 - smoothstep(0.95, 1.0, vLife));
    gl_FragColor.a = texture2D(uBrushTexture, gl_PointCoord).r * outroFade;
    gl_FragColor.rgb = vColor.rgb * gl_FragColor.a;
}

