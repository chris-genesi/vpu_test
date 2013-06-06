#!/bin/bash

# To be run in the test-vids directory, which should contain sub-directories
# "original" and "raw".

PATH_TO_RAW="$(pwd)/raw"
PATH_TO_ORIGINAL="$(pwd)/original"

# TODO enhance with different raw codec outputs
# TODO something wrong with formats other than avi. will need to investigate
for v in $(ls $PATH_TO_ORIGINAL | grep avi)
do
	gst-launch filesrc location="$PATH_TO_ORIGINAL""/$v" ! decodebin ! ffmpegcolorspace ! 'video/x-raw-yuv,format=(fourcc)UYVY' ! filesink location="$PATH_TO_RAW""/$v.yuv"
done
