#!/bin/bash                                                                                                                                                                                                       

set -o errexit
set -o pipefail
set -o nounset


files=(/home/data/dataset/lima/ud-treebanks-v2.10-trainable/*)
jobNB=$1
corpusMin=$(($1 * 136/8))
corpusMax=$((($1+1) * 136/8 - 1)) 
for corpusID in $(seq $corpusMin $corpusMax)
do
    corpusName=$(basename ${files[corpusID]})
    echo $corpusName
#    singularity exec --nv --bind /home/users/tderouet:/home/users/tderouet \
#		--bind /home/data/dataset/lima:/home/data/dataset/lima \
#		/home/users/tderouet/lima-factoryia.sif deeplima-train-segm \
#		-c $corpusName -u /home/data/dataset/lima/ud-treebanks-v2.10-trainable/ \
#		-n /home/data/dataset/lima/test.tok/$corpusName -s --device=cuda
done
