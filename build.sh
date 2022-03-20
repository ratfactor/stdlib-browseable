#!/bin/bash

# First param of script must be path to zig std lib
# like so:
#
#   build.sh /home/dave/zig/lib/std/
#
# Second param CAN be wildcard match:
#
#   $ ./build.sh /home/dave/zig/lib/std/ queue
#   atomic/queue.zig
#   priority_queue.zig
#   priority_dequeue.zig
#
lib_dir=$1
for file in $(find $lib_dir -name '*.zig')
do
    # Only output files matching argument 2
    [[ $1 && $file != *$1* ]] && continue

    # Skip zig-cache!
    [[ $file == *zig-cache* ]] && continue

    relative_file=${file#"$lib_dir"}
    output_file="output/$relative_file.html"

    echo $relative_file
    mkdir -p $(dirname $output_file)
    php makepage.php $file $relative_file > $output_file
done
