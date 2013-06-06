#!/bin/bash

# To be run in the test-vids directory, which should contain sub-directories
# "clips" and "raw".

PATH_TO_CLIPS="$(pwd)/clips"

# TODO enhance with different raw codec outputs
# TODO something wrong with formats other than avi. will need to investigate
for v in $(ls $PATH_TO_CLIPS)
do
	gst-launch filesrc location="$PATH_TO_CLIPS""/$v" ! decodebin ! ffmpegcolorspace ! 'video/x-raw-yuv,format=(fourcc)UYVY' ! filesink location="$(pwd)""/$v.yuv"
done
