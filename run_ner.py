import spacy

# Load a pre-trained spaCy model
nlp = spacy.load("en_core_web_sm")

# Example text
f = open('chapter13')
text = f.read()

# Process the text with spaCy
doc = nlp(text)

people = set()

# Iterate through the entities and print person names
for ent in doc.ents:
    if ent.label_ == "PERSON":
        people.add(ent.text)

print(people)
