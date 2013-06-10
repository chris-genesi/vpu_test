VPU Tests: A collection of scripts and video scenes for testing VPU encoding/decoding on iMX.5X
===============================================================================================

Testing gstreamer pipelines with `generate_pipeline.sh'
-------------------------------------------------------
Run the following command to make sure you can use this script

	sudo apt-get install gstreamer0.10-tools graphviz

To use this script, run it in the vpu_test directory with a video filename to test, e.g.

	./generate_pipeline.sh $(pwd)/clips/big_buck_bunny_720p_surround.clip.avi

(Unfortunately, relative paths to files are not currently supported, so specify a full path for the time being)

This script runs gst-launch-0.10 on the file given, using the playbin2 option.
Before this, it sets an environment variable GST_DEBUG_DUMP_DOT_DIR to the pipeline_output directory. 
Setting this variable to $PATH tells gstreamer to dump all of its '.dot' files (standard syntax for directed graphs) in $PATH.

After gst-launch finishes, the script runs the program dot on the .dot file representing media player state transition from READY to PAUSED (this one seems to have the most information available).
dot generates a .png file representing the pipeline gstreamer automatically created.

Finally, as a bit of cleanup, the script runs through the .dot files recently generated and helpfully renames them, based on the file used and the date the script was run.

