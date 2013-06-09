#!/bin/bash

get_base_filename() {
	return $(echo $1 | rev | cut -d"/" -f1 | rev)
}

if [ $# -ne 1 ] #Expects one file - input video file 
then
	echo "Usage: $0 <input-vid-file>"
	exit 65 # bad arguments
fi

get_base_filename $1
VID_FILE_BASENAME=$?

OUTDIR="$(pwd)/pipeline_output"

export GST_DEBUG_DUMP_DOT_DIR=$OUTDIR

gst-launch-0.10 playbin2 uri=file://$1
dot -Tpng -o"$OUTDIR/$VID_FILE_BASENAME"'.READY_PAUSED.png' $(ls "$OUTDIR/"* | grep READY_PAUSED)

#for f in $(ls $OUTDIR/* | grep "gst-launch")
#do
#	get_base_filename $f
#	base_f = $?
#done
