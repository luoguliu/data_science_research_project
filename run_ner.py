import spacy

# Load a pre-trained spaCy model
nlp = spacy.load("en_core_web_sm")



people = dict()

for i in range(1, 14):
    fname = "chapter%02d" % i
    f = open(fname)
    text = f.read()
    f.close()

    # Process the text with spaCy
    doc = nlp(text)

    # Iterate through the entities and print person names
    for ent in doc.ents:
        if ent.label_ == "PERSON":
            if ent.text in people:
                people[ent.text] += 1
            else:
                people[ent.text] = 1


f = open('ner_result', 'w')
f.write(str(sorted(list(people.items()), key=lambda item: item[1], reverse=True)))
f.close()




