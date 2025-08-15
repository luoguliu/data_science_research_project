
from nltk.sentiment.vader import SentimentIntensityAnalyzer
from textblob import TextBlob


names = ["Cynthia", "Mary", "Poirot", "Lawrence", "Howard", "Alfred", "John"]

f_res = open('./pair/result_alfred_howard.csv', 'w')
f_res.write("Chapter,Count,Compound\n")

for i in range(1, 14):
    fname = "styles_chapter%02d_paragraphs" % i
    f = open(fname)
    text = f.read()
    f.close()

    f_res.write(str(i))

    paragraphs = [p for p in text.split('\n') if ("Alfred" in p and "Howard" in p)]

    analyzer = SentimentIntensityAnalyzer()
    sentiment_scores = analyzer.polarity_scores('\n'.join(paragraphs))

    f_res.write("," +str(len(paragraphs)) +"," +str(sentiment_scores['compound']))

    f_res.write("\n")

f_res.close()




