#!/bin/bash

lib_dir=/tmp/zig/lib/std/
for file in $(find $lib_dir -name '*.zig')
do
    # Only output files matching argument 1
    # example:
    #   $ ./build.sh queue
    #   atomic/queue.zig
    #   priority_queue.zig
    #   priority_dequeue.zig
    if [[ $1 && $file != *$1* ]]
    then
        continue
    fi

    relative_file=${file#"$lib_dir"}
    output_file="output/$relative_file.html"

    echo $relative_file
    mkdir -p $(dirname $output_file)
    php makepage.php $file $relative_file > $output_file
done
