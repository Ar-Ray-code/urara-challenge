cd darknet/
./darknet detector demo cfg/coco.data ../target-dir/target.cfg ../target-dir/target.weights ../target-dir/target.avi
# add unixtime
mv predictions.avi ../target-dir/predictions.avi
exit 0