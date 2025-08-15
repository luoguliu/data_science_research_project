
from nltk.sentiment.vader import SentimentIntensityAnalyzer
#from textblob import TextBlob



names = ["Cynthia", "Mary", "Lawrence", "Howard", "Alfred", "John"]

fneg = open('./poirot/neg.csv', 'w')
fneu = open('./poirot/neu.csv', 'w')
fpos = open('./poirot/pos.csv', 'w')
fcompound = open('./poirot/compound.csv', 'w')

fneg.write("Chapter," + ",".join(names) + "\n")
fneu.write("Chapter," + ",".join(names) + "\n")
fpos.write("Chapter," + ",".join(names) + "\n")
fcompound.write("Chapter," + ",".join(names) + "\n")


for i in range(1, 14):
    fname = "styles_chapter%02d_paragraphs" % i
    f = open(fname)
    text = f.read()
    f.close()

    fneg.write(str(i))
    fneu.write(str(i))
    fpos.write(str(i))
    fcompound.write(str(i))

    for aspect in names:
        paragraphs = '\n'.join( [p for p in text.split('\n') if (aspect in p and "Poirot" in p)] )
        
        analyzer = SentimentIntensityAnalyzer()
        sentiment_scores = analyzer.polarity_scores(paragraphs)
        
        fneg.write("," + str(sentiment_scores['neg']))
        fneu.write("," + str(sentiment_scores['neu']))
        fpos.write("," + str(sentiment_scores['pos']))
        fcompound.write("," + str(sentiment_scores['compound']))

    fneg.write("\n")
    fneu.write("\n")
    fpos.write("\n")
    fcompound.write("\n")

fneg.close()
fneu.close()
fpos.close()
fcompound.close()




