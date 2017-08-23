#!/bin/bash

files=$(find rc.lua config -type f -iname "*.lua")
for file in $files; do
	echo $file
	sed -i "/-- vim:/d" $file
	echo >> $file
	echo "-- vim: filetype=lua:foldmethod=marker" >> $file
done
