#!/bin/sh

composite()
{
    INDEX=`printf "%02d" $1`
    TITLE_POS=$(( ($1 - 1) * 4 ))

    BASE="Source/Base15.mov"
    MASK="Source/Mask.png"

    BLANK2S="color=black:duration=2:size=3840x1440"

    TITLE="Source/Titles.mov"
    AUDIO="../Assets/Audio/RE_15sec mixB_0911.wav"
    RENDER="Render/Bumper15_Main_$INDEX.mov"
    PREVIEW="Render/Bumper15_Main_$INDEX.mp4"

    MUX_FILTER="
[0:v] format=rgba [base];
[1:v] format=rgba [titles];
[2:v] format=rgba [mask];
[3:v] format=rgba,setsar=0:1 [blank];
[base] split [base1][base2];
[base1] trim=duration=9 [base1t];
[base2] trim=start=9, setpts=PTS-STARTPTS [base2t];
[titles] trim=start=$TITLE_POS:duration=4, setpts=PTS-STARTPTS [title];
[base2t][title] blend=all_mode=addition [base2x];
[base1t][base2x][blank] concat=3 [cat];
[cat][mask] blend=all_mode=multiply, pad=height=2160:y=360:color=black" 

    echo "$RENDER"

    ffmpeg -y -v 0 \
        -i "$BASE" -i "$TITLE" -i "$MASK" -f lavfi -i "$BLANK2S" \
        -filter_complex "$MUX_FILTER" \
        -r 59.94 -c:v hap -an "$RENDER"

    echo "$PREVIEW"

    ffmpeg -y -v 0 -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
}

composite 15
composite 16
composite 17
composite 18
composite 19
composite 20
composite 21
composite 22
composite 23
composite 24
composite 25
composite 26
composite 27
composite 28
composite 29
composite 30
composite 31
