#!/bin/bash

FORMAT_LIST=("mp4" "MP4" "avi" "AVI" "mov" "MOV" "webm" "WEBM")

for x in "$@";do
    # is folder
    if [ -d "$x" ]; then
        for format in ${FORMAT_LIST[@]};do
            for y in "$x"/*.$format;do
                if [ -f $y ];then
                    echo "========================"
                    echo $y
                    # folder -> file
                    # into folder $y remove extension
                    mkdir -p "$x/$(basename $y .$format)"
                    ffmpeg -i "$y" -vcodec png -r 1 -y "${y%.*}"/%05d.png
                fi
            done
        done
    # is file
    else
        # file
        echo "$x"
        ffmpeg -i "$x" -vcodec png -r 1 -y "${x%.*}"/%05d.png
    fi

done