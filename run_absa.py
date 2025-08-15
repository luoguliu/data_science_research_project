
from transformers import AutoTokenizer, AutoModelForSequenceClassification

import torch.nn.functional as F



absa_tokenizer = AutoTokenizer.from_pretrained("yangheng/deberta-v3-base-absa-v1.1")
absa_model = AutoModelForSequenceClassification.from_pretrained("yangheng/deberta-v3-base-absa-v1.1")



names = ["Cynthia", "Mary", "Poirot", "Lawrence", "Howard", "Alfred", "John"]

fneg = open('./absa/neg.csv', 'w')
fneu = open('./absa/neu.csv', 'w')
fpos = open('./absa/pos.csv', 'w')

fneg.write("Chapter," + ",".join(names) + "\n")
fneu.write("Chapter," + ",".join(names) + "\n")
fpos.write("Chapter," + ",".join(names) + "\n")



for i in range(1, 14):
    fname = "chapter%02d" % i
    f = open(fname)
    text = f.read()
    f.close()

    fneg.write(str(i))
    fneu.write(str(i))
    fpos.write(str(i))

    for aspect in names:
        sentence = '.'.join( [s for s in text.split('.') if aspect in s] )
        inputs = absa_tokenizer(f"[CLS] {sentence} [SEP] {aspect} [SEP]", return_tensors="pt")
        outputs = absa_model(**inputs)
        outputs = F.softmax(outputs.logits, dim=1).tolist()

        # print(fname + " : " + aspect, end=' : ')
        # print(outputs)

        fneg.write("," + str(outputs[0][0]))
        fneu.write("," + str(outputs[0][1]))
        fpos.write("," + str(outputs[0][2]))

    fneg.write("\n")
    fneu.write("\n")
    fpos.write("\n")

fneg.close()
fneu.close()
fpos.close()




