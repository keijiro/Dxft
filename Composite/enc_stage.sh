#!/bin/sh

VIDEO="Source/Stage15.mov"
AUDIO="../Assets/Audio/RE_15sec mixB_0911.wav"
RENDER="Render/Attack-15sec-Projection.mov"
PREVIEW="Render/Attack-15sec-Projection.mp4"

ffmpeg -y -i "$VIDEO" -r 59.94 -c:v hap -an "$RENDER"
ffmpeg -y -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"

VIDEO="Source/Stage30.mov"
AUDIO="../Assets/Audio/30sec A 0912.wav"
RENDER="Render/Attack-30sec-Projection.mov"
PREVIEW="Render/Attack-30sec-Projection.mp4"

ffmpeg -y -i "$VIDEO" -r 59.94 -c:v hap -an "$RENDER"
ffmpeg -y -i "$RENDER" -i "$AUDIO" -pix_fmt yuv420p "$PREVIEW"
