#!/bin/bash
cd SOURCE

for filmfolder in *
do

cd "$filmfolder"

film=$(find . -type f -name "*.mkv" -o -name "*.mp4" -o -name "*.avi")

ffmpeg -i "$film" -codec:v libvpx -quality good -cpu-used 0 -b:v 2000k -maxrate 2000k -bufsize 4000k -qmin 1 -vf scale=-1:720 -threads 4 -codec:a libvorbis -b:a 128k -speed 8 "$film.webm"

cd ..

done

