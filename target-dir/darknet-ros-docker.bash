cd darknet/
./darknet detector demo cfg/coco.data cfg/yolov4-csp.cfg ../target-dir/yolov4-csp.weights ../target-dir/dart_lastspart-1080p.mp4
cp predictions.avi ../target-dir/

