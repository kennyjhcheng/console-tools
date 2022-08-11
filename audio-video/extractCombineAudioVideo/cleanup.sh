for FILE in *; 
do 
    if [ "$FILE" != "output.mp4" ] 
    then 
        rm "$FILE"; 
    fi; 
done