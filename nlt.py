from nltk.tokenize import word_tokenize,sent_tokenize,regexp_tokenize
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
import pickle
file_name="testfile.dat"
fileObject=open(file_name,'r')
b=pickle.load(fileObject)
# lemmatizing
lzr=WordNetLemmatizer()
re=lzr.lemmatize("dancing",pos='v')
print re
#sentence tokenizing
para="hi i am suffering from fever and headache"
sentences=sent_tokenize(para)
print sentences
#word tokenizing

stopWords=set(stopwords.words('english'))
entities=[]
out_entities=[]
for sentence in sentences:
    words=word_tokenize(sentence)
    for word in words:
        if word not in stopWords:
            entities.append(word)

for entity in entities:
    if entity in b:
        out_entities.append(entity)
print out_entities
