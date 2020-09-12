#!/bin/bash

[ "$1" ] || { echo "Usage: generate-fs.sh <mount point>"; exit 1; }

cp -a original-files/* /mnt
sync
rm -rf /mnt/*2
sync
ls /mnt
