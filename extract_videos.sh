#!/bin/sh
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
Extraction Videos from android device Script
--------------------------------------------
'
#Stop screenrecord process
echo "Kill screenrecord process.."
pid=$(head -n 1 pid.tmp)
kill  $pid
wait $pid
pkill "record.sh"

echo "Start Extracting Videos.."

i=0
counter=$(head -n 1 recorder.tmp)

mkdir videos
cd  videos

while [ "$i" -le "$counter" ]; do
    adb pull /sdcard/record_video_$i.mp4 record_video_$i.mp4
    i=$(( i + 1 ))
done 


