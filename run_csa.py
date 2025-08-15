
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from textblob import TextBlob



names = ["Cynthia", "Mary", "Poirot", "Lawrence", "Howard", "Alfred", "John"]

fneg = open('./sa/neg.csv', 'w')
fneu = open('./sa/neu.csv', 'w')
fpos = open('./sa/pos.csv', 'w')

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
        
        analyzer = SentimentIntensityAnalyzer()
        sentiment_scores = analyzer.polarity_scores(sentence)
        
        fneg.write("," + str(sentiment_scores['neg']))
        fneu.write("," + str(sentiment_scores['neu']))
        fpos.write("," + str(sentiment_scores['pos']))

    fneg.write("\n")
    fneu.write("\n")
    fpos.write("\n")

fneg.close()
fneu.close()
fpos.close()




