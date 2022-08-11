for a in *.mp4; do ffmpeg -hide_banner -n -threads 8 -i "$a" -vn -map 0:a:0? -c copy "${a%%.*} audio track 1.m4a" -map 0:a:1? -c copy "${a%%.*} audio track 2.m4a" ; done

wait

ffmpeg -i fragmented-1.mp4 -i fragmented\ audio\ track\ 1.m4a -c:v copy -c:a aac output.mp4

wait

for FILE in *; 
do 
    if [ "$FILE" != "output.mp4" ] 
    then 
        rm "$FILE"; 
    fi; 
done