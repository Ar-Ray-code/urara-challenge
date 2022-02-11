DARKNET_PATH="$HOME/Documents/github/darknet"

# current path
CURRENT_PATH="$(pwd)"

cd $DARKNET_PATH

FORMAT_LIST=("png" "jpg")

for x in "$@";do
    # is folder
    echo "$x"
    if [ -d "$x" ]; then
        for format in ${FORMAT_LIST[@]};do
            for y in "$x"/*.$format;do
                if [ -f $y ];then
                    echo "========================"
                    # get $y as absolute path
                    
                    PATH="$(cd "$(dirname "$y")"; pwd)/$(basename "$y")"
                    # folder -> file
                    # into folder $y remove extension
                    mkdir -p "$x/$(basename $y .$format)"
                    ./darknet detector test ./cfg/coco.data ./cfg/yolov4-csp.cfg ./yolov4-csp.weights $path
                fi
            done
        done
    # is file
    else
        # file
        echo "========================"
    fi

done