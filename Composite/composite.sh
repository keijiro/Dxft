#!/bin/sh

composite()
{
    echo $1 '->' $2
    ffmpeg \
-v 0 \
-i Bumper15Base.mp4 \
-i $1 \
-i Mask.png \
-filter_complex "\
[0:v] format=rgba [base]; \
[1:v] format=rgba [title]; \
[2:v] format=rgba [mask]; \
[base][title] blend=all_mode=addition [v]; \
[v][mask] blend=all_mode=multiply, pad=height=2160:y=360:color=black" \
-c:v hap -y $2
}

composite Title01.mp4 Bumper01.mov &
wait
