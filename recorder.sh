#!/bin/bash
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
recorder(){
    cat logo.txt
    echo ""
    if [ -e "video_counter.txt" ]; then
        rm "video_counter.txt"
    fi
    
    adb  shell rm -f *"/sdcard/screen_recorder/"*
    adb  shell mkdir "/sdcard/screen_recorder/"
  
    # make sure SIGINT always works even in presence of infinite loops
    close() {
        trap - SIGINT SIGTERM SIGTERM # clear the trap
        tput cnorm
        adb  shell echo \04; wait

        exit
    }; trap exitScript SIGINT SIGTERM # set trap

    record(){   
        printf "\n\n%*s\n\n" $((0)) "Use CTRL-C to stop the recording.."
        videoCounter=0

        while true; do
            fileName="rec.$videoCounter.mp4"
            videoCounter=$((videoCounter + 1))
            printf "\n%*s\n\n" $((0)) "Starting new recording: $fileName"                        
            echo $videoCounter > video_counter.txt
            adb  shell screenrecord /sdcard/screen_recorder/$fileName || adb shell echo \04
            
            wait;  continue
        done
   
    }
    record &&  close
}

(recorder) && printf "\ncontinue main loop\n"; exit