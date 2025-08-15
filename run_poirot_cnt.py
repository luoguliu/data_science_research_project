
from nltk.sentiment.vader import SentimentIntensityAnalyzer
#from textblob import TextBlob



names = ["Cynthia", "Mary", "Lawrence", "Howard", "Alfred", "John"]

fcnt = open('./poirot/cnt.csv', 'w')

fcnt.write("Chapter," + ",".join(names) + "\n")


for i in range(1, 14):
    fname = "styles_chapter%02d_paragraphs" % i
    f = open(fname)
    text = f.read()
    f.close()

    fcnt.write(str(i))

    for aspect in names:
        paragraphs = [p for p in text.split('\n') if (aspect in p and "Poirot" in p)]
        
        fcnt.write("," + str(len(paragraphs)))

    fcnt.write("\n")

fcnt.close()



