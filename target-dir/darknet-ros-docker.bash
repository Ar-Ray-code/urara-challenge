cd darknet/
./darknet detector demo cfg/coco.data ../target-dir/target.cfg ../target-dir/target.weights ../target-dir/target.avi
# add unixtime
cp predictions.avi ../target-dir/predictions.avi