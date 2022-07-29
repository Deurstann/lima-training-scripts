#!/bin/bash

# Nombre de machine ou NODES typiquement=1 sauf
#SBATCH -N 1

# Nombre de processus en general=1 (a mémoire distribues type miprun)
#SBATCH --ntasks=1

# Nom de votre job afficher dans la lise par squeue
#SBATCH --job-name=deeplima_tokenize_en

# Nom du fichier de sortie et des erreurs avec l'id du job
#####SBATCH --output=res_%j.log
#####SBATCH --error=res_%j.err

#SBATCH --partition=cpu

# Mail pour etre informe de l'etat de votre job
#SBATCH --mail-type=start,end,fail
#SBATCH --mail-user=gael.de-chalendar@cea.fr

# Temps maximal d'execution du job ci dessous
# d-hh:mm:ss
##SBATCH --time=1-0:00:00

# Taille de la memoire exprime en Mega octets max=190000 ici 50G
#SBATCH --mem=20G

####SBATCH --exclude=node5
####SBATCH --nodelist=node03

#SBATCH --threads-per-core=

echo "Begin on machine: `hostname`"

#set -o nounset
set -o errexit
set -o pipefail

bash /home/users/gdechalendar/deeplima/train_tasks/tok/tokenize.sh en /home/data/dataset/lima/models/v0.1.6-beta/tok/en/English-EWT/en_ewt_w8_tok_4.pt
