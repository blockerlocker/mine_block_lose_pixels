#version 330

uniform sampler2D InSampler;

layout(std140) uniform SamplerInfo {
    vec2 InSize;
};

layout(std140) uniform BitsConfig {
    float MosaicSize;
};

layout(location = 0) out vec4 fragColor;

void main() {
    vec2 pixelCoord = gl_FragCoord.xy;

    vec2 roundPixelCoord = floor(pixelCoord / MosaicSize) * MosaicSize;

    roundPixelCoord += floor(pow(MosaicSize,0.5));

    vec2 roundTexCoord = clamp(roundPixelCoord / InSize, 0.0, 1.0);

    fragColor = texture(InSampler, roundTexCoord);
}