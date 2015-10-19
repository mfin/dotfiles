#!/usr/bin/bash

find $@ -name "*.jpg" -print0 | while read -d $'\0' file; do convert "$file" -resize 100x100 "${file%.jpg}_mini.png"; done