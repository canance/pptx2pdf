# pptx2png

## Purpose
This script takes a pptx file and converts each slide (and animation) into a png image.

## Installation
1. Build the docker image:
```
$ docker build -t pptx2png .
```
2. Move the `pptx2png_docker_wrapper.sh` script to your `/usr/bin` directory or anywhere else in your environment's `$PATH` variable.

## Usage
```
$ pptx2png_docker_wrapper.sh <pptx_file>
```
