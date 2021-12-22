SCRIPT_DIR=$(cd $(dirname $0); pwd)

docker run -it --rm --runtime nvidia -v $SCRIPT_DIR/target_dir:/workdir yolov4csp /bin/bash


# python3 tools/demo.py video -n yolox-x -c ./target.pth --path ./target.mp4 --conf 0.25 --nms 0.45 --tsize 640 --save_result --device gpu