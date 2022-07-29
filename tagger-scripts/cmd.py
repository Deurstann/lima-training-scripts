def set_command(command,corpus, embd, modelName, w):
    return command.replace("$corpus",corpus).replace("$embd",embd).replace("$modelName",modelName).replace("$w",w)

command = "singularity exec --nv --bind /home/users/tderouet:/home/users/tderouet                 --bind /home/data/dataset/lima:/home/data/dataset/lima                 /home/users/tderouet/lima-factoryia.sif \
deeplima-train-tag -u /home/data/dataset/lima/ud-treebanks-v2.10-trainable/ -c $corpus -e $embd -n $modelName -w $w --tasks=\"upos,feats\",-Typo,-Foreign --tag ud_version=\"2.10\" --tag ud_corpus=\"$corpus\" -\
-device=cuda"
print(set_command(command, "UD_French-GSD", "/path/to/file","model", str(128)))
