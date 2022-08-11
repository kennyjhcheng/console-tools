# This script will check all MP4 files in the current folder,
# and process them to extract audio into separate files (M4A).
# The audio files use the same file name as the original video file, with a number, and the M4A extension
# This is a bash file, to be in on Linux, in Command Line. It will not run on WINDOWS!
# For Windows, see the "extract-audio.bat" gist.
# In this example, there are 2 audio tracks, which get split out to 2 separate audio files.
# The original video file remains unchanged.
# If you want have a video file with more than 2 audio tracks, 
# just add more "-map 0:a:0 -c copy ""${a%%.*} audio track X.m4a"" sections:
# -map 0:a:0 -c copy "${a%%.*} audio track 1.m4a" 
# -map 0:a:1 -c copy "${a%%.*} audio track 2.m4a" 
# -map 0:a:2 -c copy "${a%%.*} audio track 3.m4a" 
# -map 0:a:3 -c copy "${a%%.*} audio track 4.m4a" 
# etc ...

# TO RUN THIS SCRIPT:
# You MUST HAVE ffmpeg INSTALLED!
# How to install ffmpeg is beyond the scope of this script. Google it.

for a in *.mp4; do ffmpeg -hide_banner -n -threads 8 -i "$a" -vn -map 0:a:0? -c copy "${a%%.*} audio track 1.m4a" -map 0:a:1? -c copy "${a%%.*} audio track 2.m4a" ; done

# for a in = this is a the loop section that will look for files to process, 
# $a = this is the variable that will be subsctituted with the actual file name when the for loop executes
# do ffmpeg = this part actually executes ffmpeg and tells it to extract the audio fro the MP4 files it finds.
# -hide_banner = hides the info banner when the command is executed.
# -n = option to not overwrite existing files
# -threads 8 = option to use 8 separate CPU threads for the work. You can increase the number based on the available cores in your CPU
# -i "$a" = this option defines the input file
# -vn = this option means no video to be copied
# -map 0:a:0 = this options maps the first available audio track to be extracted
# ? = this option will avoid an error if there are no multiple audio tracks in a file.
# -c copy = this option means please copy the audio without altering it
# ${a%%.*} = this expression is used to get file name only, no extension
# "${a%%.*} audio track 1.m4a" = the filename of the extracted audio track


