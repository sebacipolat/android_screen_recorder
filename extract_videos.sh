#!/bin/sh
# ---------------------------------------------
#                  _           _     _
#                 | |         (_)   | |
#   __ _ _ __   __| |_ __ ___  _  __| |
#  / _` | '_ \ / _` | '__/ _ \| |/ _` |
# | (_| | | | | (_| | | | (_) | | (_| |
#  \__,_|_| |_|\__,_|_|  \___/|_|\__,_|
# 
#  ___  ___ _ __ ___  ___ _ __
# / __|/ __| '__/ _ \/ _ \ '_ \
# \__ \ (__| | |  __/  __/ | | |
# |___/\___|_|  \___|\___|_| |_|
#
#                            _           
#                           | |          
#  _ __ ___  ___ ___  _ __ __| | ___ _ __ 
# | '__/ _ \/ __/ _ \| '__/ _` |/ _ \ '__|
# | | |  __/ (_| (_) | | | (_| |  __/ |   
# |_|  \___|\___\___/|_|  \__,_|\___|_|     
#
# --------------------------------------------
# Created BY Sebastian Cipolat
# @seba_cipolat
# Argentina 2023
# --------------------------------------------
# Screen Recording Script
# --------------------------------------------
cat logo.txt
echo ""
file_counter="video_counter.txt"
counter=$(head -n 1 $file_counter)

pid=$(pgrep -o "recorder.sh")
kill -9 $pid

if [ ! -d "extracted_videos" ]; then
    mkdir "extracted_videos"
fi
if [  -d "video_list.tmp" ]; then
    rm "video_list.tmp"
fi

if [ -e "$file_counter" ]; then    

    i=0
    while [ "$i" -le "$counter" ]; do
        fileName="rec.$i.mp4"
        extracted_fileName="extracted_videos/$fileName"
        echo "Start Extracting from device  /sdcard/screen_recorder/$fileName to $extracted_fileName"
        adb pull /sdcard/screen_recorder/$fileName $extracted_fileName
        echo "file '$fileName'" >> "extracted_videos/video_list.tmp"
        i=$(( i + 1 ))
    done 

    cd "extracted_videos"
    echo "Creating Final Video.."
    ffmpeg -f concat -i video_list.tmp -c copy output.mp4
    ls

    if [  -e "output.mp4" ]; then
        echo "-------------------------------------"
        echo "... Final Video Created     OK    ..."
        echo ".../extracted_videos/output.mp4  ..."
        echo "-------------------------------------"
    fi

else
 echo "El archivo $file_counter no encontrado :("
fi