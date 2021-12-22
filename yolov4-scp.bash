sudo echo " "
docker build -t yolov4csp -f Dockerfile-yolov4csp ./
docker run -it --rm --runtime nvidia -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix --mount type=bind,source=$(pwd)/target-dir,target=/workspace/target-dir yolov4csp /bin/bash ./target-dir/darknet-ros-docker.bash
sudo chown -R $USER:$USER target-dir/predictions.avi