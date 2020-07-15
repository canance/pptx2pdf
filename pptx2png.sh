#!/usr/bin/env bash

# Author: Cory Nance
# Date: 6/29/2020
# Version: 1.0
# Dependencies (ubuntu): poppler-utils, libreoffice, ExpandAnimations plugin for libreoffice
if [ $# -lt 1 ]; then
	echo "Usage: $0 pptx_file"
	exit 1
fi

directory="$(dirname $1)"
file="$(basename $1)"
filename="${file%.*}"

mkdir "$filename"

libreoffice --headless "$file" macro:///ExpandAnimations.ExpandAnimations.test
pdftoppm "${filename}.pdf" "${filename}/output" -png
rm ${filename}.pdf
