#!/bin/sh

VIDEO="Source/Stage15.mov"
AUDIO="../Assets/Audio/RE_15sec mixB_0911.wav"
RENDER="Render/Bumper15_Stage.mov"
PREVIEW="Render/Bumper15_Stage.mp4"

ffmpeg -y -i "$VIDEO" -r 59.94 -c:v hap -an "$RENDER"
ffmpeg -y -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
