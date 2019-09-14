#!/bin/sh

VIDEO="Source/Stage15.mp4"
AUDIO="../Assets/Audio/RE_15sec mixB_0911.wav"
RENDER="Render/Bumper_Stage_001.mov"
PREVIEW="Render/Bumper_Stage_001.mp4"

ffmpeg -y -i "$VIDEO" -r 59.94 -c:v hap -an "$RENDER"
ffmpeg -y -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
