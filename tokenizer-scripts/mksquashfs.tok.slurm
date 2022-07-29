#!/bin/bash
#SBATCH --account=lasti
#SBATCH -N 1  # Nombre de noeud
#SBATCH -n 8 # AMD
#SBATCH -J lima_cc_mksquashfs       # nom du job
#SBATCH -p cpu
#SBATCH --mem=8192 # in MegaBytes

echo "Begin on machine: `hostname`"
echo "job task count: $SLURM_ARRAY_TASK_COUNT"
echo "job id: $SLURM_ARRAY_JOB_ID"
echo "running value : $SLURM_ARRAY_TASK_ID / $SLURM_JOB_ID"

mksquashfs /home/data/dataset/lima/v1.tok /home/data/dataset/lima/lima_cc_v1_tok.squashfs \
    -comp lzo -noD -noF -b 4k -no-duplicates -no-xattrs \
    -no-exports -no-sparse -all-root 

echo "mksquashfs.tok.slurm job $SLURM_ARRAY_JOB_ID end on machine: `hostname`"
