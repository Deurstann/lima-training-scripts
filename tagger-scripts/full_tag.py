import os
import sys
import json
import glob

def set_command(command,corpus, embd, modelName, w):
    return command.replace("$corpus",corpus).replace("$embd",embd).replace("$modelName",modelName).replace("$w",w)
    

jobNb = int(sys.argv[1])
embdFolders = sorted(os.listdir("/home/data/dataset/lima/v1.embd/"))
print(embdFolders)
command = "singularity exec --nv --bind /home/users/tderouet:/home/users/tderouet                 --bind /home/data/dataset/lima:/home/data/dataset/lima                 /home/users/tderouet/lima-factoryia.sif deeplima-train-tag -u /home/data/dataset/lima/ud-treebanks-v2.10-trainable/ -c $corpus -e $embd -n $modelName -w $w --tasks=\"upos,feats\",-Typo,-Foreign --tag ud_version=\"2.10\" --tag ud_corpus=\"$corpus\" --device=cuda"
embdMin = jobNb * len(embdFolders)//10
print(embdMin)
jsFile= open("./langlist.json")
langJson = json.load(jsFile)
if(jobNb < 9):
    embdMax = (jobNb+1) * len(embdFolders)//10
else:
    embdMax = len(embdFolders)
print(embdMax)
for k in range(embdMin,embdMax):
    lang = embdFolders[k]
    if(len(lang)>2):
        continue
    jsonIntermediate = langJson[lang][next(iter(langJson[lang]))]
    langUD = jsonIntermediate[next(iter(jsonIntermediate))]["label"]
    UDFolders = glob.glob("/home/data/dataset/lima/ud-treebanks-v2.10-trainable/UD_"+langUD+"*")
    if(len(UDFolders)==0):
        continue
    embdFiles = os.listdir("/home/data/dataset/lima/v1.embd/"+lang)
    for dp, dn, fn in os.walk("/home/data/dataset/lima/v1.embd/"+lang):
        print (dp)
        for embdFile in fn:
            if(not(os.stat(dp+"/"+str(embdFile)).st_size == 0) and (embdFile.endswith(".bine") or embdFile.endswith(".xz"))):
                print(embdFile)
                for ud in UDFolders:
                    env = os.environ
                    gpus = env["CUDA_VISIBLE_DEVICES"].split(",")
                    env["CUDA_VISIBLE_DEVICES"] = gpus[0]
                    
                    
