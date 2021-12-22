SCRIPT_DIR=$(cd $(dirname $0); pwd)

sudo echo " "
echo "Select video file."
VIDEO=`python3 $SCRIPT_DIR/select-file-folder-dialog/select-file-folder-dialog.py -f -e $SCRIPT_DIR`
echo "========================"
echo " "
echo "Select cfg file."
CFG=`python3 $SCRIPT_DIR/select-file-folder-dialog/select-file-folder-dialog.py -f -e $SCRIPT_DIR`
echo "========================"
echo " "
echo "Select weights file."
WEIGHTS=`python3 $SCRIPT_DIR/select-file-folder-dialog/select-file-folder-dialog.py -f -e $SCRIPT_DIR`

# cp $VIDEO $SCRIPT_DIR/target_dir/target.$VIDEO_EX
ffmpeg -i $VIDEO $SCRIPT_DIR/target-dir/target.avi
ffmpeg -i $VIDEO -vn $SCRIPT_DIR/target-dir/target.wav

# -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" -vf "scale=1080:-1" "$SCRIPT_DIR/target_dir/target.avi"
cp $CFG $SCRIPT_DIR/target-dir/target.cfg
cp $WEIGHTS $SCRIPT_DIR/target-dir/target.weights

docker build -t yolov4csp -f Dockerfile-yolov4csp ./
docker run --rm --runtime nvidia -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --mount type=bind,source=$(pwd)/target-dir,target=/workspace/target-dir yolov4csp /bin/bash ./target-dir/darknet-ros-docker.bash
sudo chown -R $USER:$USER target-dir/predictions.avi
echo "====================================="
ffmpeg -i target-dir/predictions.avi -i target-dir/target.wav -c:v copy -c:a aac -strict experimental target-dir/predictions.mp4
TIME_STAMP=$(date +%s)
mv target-dir/predictions.mp4 target-dir/output-$TIME_STAMP.mp4
rm target-dir/target.avi
rm target-dir/target.wav
rm target-dir/predictions.avi
rm target-dir/target.cfg
rm target-dir/target.weights