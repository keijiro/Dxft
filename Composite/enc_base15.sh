#!/bin/sh

BASE="Source/Base15.mp4"
MASK="Source/Mask.png"

MUX_FILTER="\
[0:v] format=rgba [base]; \
[1:v] format=rgba [title]; \
[2:v] format=rgba [mask]; \
[base][title] blend=all_mode=addition [v]; \
[v][mask] blend=all_mode=multiply, pad=height=2160:y=360:color=black" 

composite()
{
    VIDEO="Source/Title$1.mp4"
    AUDIO="../Assets/Audio/RE_15sec mixB_0911.wav"
    RENDER="Render/Bumper_Main_$1.mov"
    PREVIEW="Render/Bumper_Main_$1.mp4"

    echo "$RENDER"

    ffmpeg -y \
        -i "$BASE" -i "$VIDEO" -i "$MASK" \
        -r 59.94 -filter_complex "$MUX_FILTER" \
        -c:v hap -an "$RENDER"

    echo "$PREVIEW"

    ffmpeg -y -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
}

composite 001 &
wait
