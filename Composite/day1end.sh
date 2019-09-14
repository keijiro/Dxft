#!/bin/sh

ffmpeg -y -v 0 -i Day1End_Main.mov  -c:v hap -an Day1End_Main_Hap.mov &
ffmpeg -y -v 0 -i Day1End_Stage.mov -c:v hap -an Day1End_Stage_Hap.mov &
ffmpeg -y -v 0 -i Day1End_Main.mov  -pix_fmt yuv420p Day1End_Main_Preview.mp4 &
ffmpeg -y -v 0 -i Day1End_Stage.mov -pix_fmt yuv420p Day1End_Stage_Preview.mp4 &

wait
