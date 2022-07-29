#!/bin/bash

# Nombre de machine ou NODES typiquement=1 sauf
#SBATCH -N 1

# Nombre de processus en general=1 (a mémoire distribues type miprun)
#SBATCH --ntasks=1

# Nom de votre job afficher dans la lise par squeue
#SBATCH --job-name=deeplima_train_segmentation

# Nom du fichier de sortie et des erreurs avec l'id du job
#####SBATCH --output=res_%j.log
#####SBATCH --error=res_%j.err

#SBATCH --partition=classicgpu
#SBATCH --gres=gpu:1

# Mail pour etre informe de l'etat de votre job
#SBATCH --mail-type=start,end,fail
#SBATCH --mail-user=tristan.derouet@cea.fr

# Temps maximal d'execution du job ci dessous
# d-hh:mm:ss
#SBATCH --time=1-00:00:00

# Taille de la memoire exprime en Mega octets max=190000 ici 50G
#SBATCH --mem=25G

#SBATCH --array=0-7

echo "Begin on machine: `hostname`"

#set -o nounset
set -o errexit
set -o pipefail

bash /home/users/tderouet/tokenizer-test/full_tokenize.sh $SLURM_ARRAY_TASK_ID
