#!/bin/bash
: '
---------------------------------------------
                 _           _     _ 
                | |         (_)   | |
  __ _ _ __   __| |_ __ ___  _  __| |
 / _` | '_ \ / _` | '__/ _ \| |/ _` |
| (_| | | | | (_| | | | (_) | | (_| |
 \__,_|_| |_|\__,_|_|  \___/|_|\__,_|


 ___  ___ _ __ ___  ___ _ __  
/ __|/ __| '__/ _ \/ _ \ '_ \ 
\__ \ (__| | |  __/  __/ | | |
|___/\___|_|  \___|\___|_| |_|
                                 
                            _           
                           | |          
 _ __ ___  ___ ___  _ __ __| | ___ _ __ 
| '__/ _ \/ __/ _ \| '__/ _` |/ _ \ '__|
| | |  __/ (_| (_) | | | (_| |  __/ |   
|_|  \___|\___\___/|_|  \__,_|\___|_|     

--------------------------------------------
Created BY Sebastian Cipolat
@seba_cipolat
Argentina 2022  
--------------------------------------------
Screen Recordig Script
--------------------------------------------
'
counter=0

while true
do

echo "Start Recording $counter"

adb shell screenrecord /sdcard/record_video_$counter.mp4 & echo $$>pid.tmp
wait $!

counter=$((counter+1))

echo $counter>recorder.tmp
echo $process_id>pid.tmp

done

