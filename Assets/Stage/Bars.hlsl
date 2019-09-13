#include "SimplexNoise2D.hlsl"

void Bars_float(float2 UV, float Frequency, float Time, float Threshold, out float Intensity)
{
    float2 p1 = float2(UV.y * Frequency, Time);
    float2 p2 = p1 * float2(3.734, -2.7134);

    Intensity = abs(snoise(p1) + snoise(p2)) < Threshold;
}
