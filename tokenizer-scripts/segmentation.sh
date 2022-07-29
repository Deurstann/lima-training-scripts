#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
#set -o xtrace

#lang=$1
#model=$2

#srcfn=/home/data/dataset/lima/v1/${lang}.dedup.txt.xz
#outdir=/home/data/dataset/lima/v1.tok.new

#xzcat ${srcfn} | \
  singularity exec --nv --bind /home/users/tderouet:/home/users/tderouet \
    --bind /home/data/dataset/lima:/home/data/dataset/lima \
    /home/users/tderouet/lima-factoryia.sif deeplima-train-segm \
    -c UD_French-GSD -u /home/data/dataset/lima/ud-treebanks-v2.10/ \
    -n /home/data/dataset/lima/test.tok/test.pt -s
