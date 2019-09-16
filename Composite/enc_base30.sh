composite()
{
    BASE="Source/Base30$1.mov"
    MASK="Source/Mask.png"
    AUDIO="../Assets/Audio/30sec A 0912.wav"
    RENDER="Render/Bumper30_Main_$1.mov"
    PREVIEW="Render/Bumper30_Main_$1.mp4"

    MUX_FILTER="
[0:v] format=rgba [base];
[1:v] format=rgba [mask];
[base][mask] blend=all_mode=multiply, pad=height=2160:y=360:color=black" 

    echo "$RENDER"

    ffmpeg -y -v 0 \
        -i "$BASE" -i "$MASK" \
        -filter_complex "$MUX_FILTER" \
        -r 59.94 -c:v hap -an "$RENDER"

    echo "$PREVIEW"

    ffmpeg -y -v 0 -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
}

#composite "a"
composite "b"
