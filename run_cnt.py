
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from textblob import TextBlob


names = ["Cynthia", "Mary", "Poirot", "Lawrence", "Howard", "Alfred", "John"]

f_res = open('./cnt/result.csv', 'w')

f_res.write("Chapter," + ",".join(names) + "\n")



for i in range(1, 14):
    fname = "chapter%02d" % i
    f = open(fname)
    text = f.read()
    f.close()

    f_res.write(str(i))

    for aspect in names:
        cnt = text.count(aspect)
        f_res.write("," + str(cnt))

    f_res.write("\n")

f_res.close()




