
from transformers import AutoTokenizer, AutoModelForSequenceClassification

import torch.nn.functional as F



absa_tokenizer = AutoTokenizer.from_pretrained("yangheng/deberta-v3-base-absa-v1.1")
absa_model = AutoModelForSequenceClassification.from_pretrained("yangheng/deberta-v3-base-absa-v1.1")



names = ["Cynthia", "Mary", "Poirot", "Lawrence", "Howard", "Alfred", "John"]



for i in range(1, 14):
    fname = "chapter%02d" % i
    f = open(fname)
    text = f.read()

    for aspect in names:
        sentence = '.'.join( [s for s in text.split('.') if aspect in s] )
        inputs = absa_tokenizer(f"[CLS] {sentence} [SEP] {aspect} [SEP]", return_tensors="pt")
        outputs = absa_model(**inputs)

        print(fname + " : " + aspect, end=' : ')
        print( F.softmax(outputs.logits, dim=1) )


    f.close()




