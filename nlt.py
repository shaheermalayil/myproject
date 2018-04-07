from nltk.tokenize import word_tokenize,sent_tokenize,regexp_tokenize
from nltk.stem import WordNetLemmatizer
from nltk.corpus import stopwords
from database import QUERIES
from test import dict_read,dict_update
import math
dic=dict_read()
print dic
para="hi i am suffering from fever and headache"

#entity extraction from text

def extract(para):
 sentences=sent_tokenize(para)
 # print sentences
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
    if entity in dic:
        out_entities.append(entity)
 return out_entities

# truth discovery method


def truthness(x):
 truth=0.0
 ob = QUERIES()
 qr="SELECT pres_id,q_id,doc_id,answer FROM prescription WHERE pres_id='%s'"%(x)
 result=ob.selection(qr)
 if result['status']=="success":
     doctor= result['data'][0]['doc_id']
     pres_id=result['data'][0]['pres_id']
     qid=result['data'][0]['q_id']
     answer=result['data'][0]['answer']
     ans=extract(answer)
     # print ans
     qr="SELECT * FROM questions INNER JOIN (prescription LEFT JOIN doctor_reg ON prescription.doc_id=doctor_reg.doc_id) ON questions.q_id=prescription.q_id where questions.q_id='%s'" %qid
     result=ob.selection(qr)
     # print len(result['data'])
     for row in result['data']:
         dw=row['expert_level']
         answer= row['answer']
         ans1=extract(answer)
         uni=set(ans)|set(ans1)
         inter=set(ans)& set(ans1)
         if len(uni)==0:
             percent=0
         else:
             percent=float(len(inter))/len(uni)
         truth += float(dw)*percent
         #if truthness less than minimal
         if truth <0.1:
             truth=0.1
     qr="update prescription set truthness='%s' where pres_id ='%s'" %(truth,pres_id)
     ob.updation(qr)

# update doctor expertise level
def expertise(doc_id):
    tot=0.0
    qr="select truthness from prescription where doc_id='%s'" %doc_id
    ob= QUERIES()
    re=ob.selection(qr)
    truths=re['data']
    n=len(truths)
    for truth in truths:
        tot += float(truth['truthness'])
    agregate=tot/n
    # print agregate
    prb=1-agregate
    exp=math.log(prb)
    expert=abs(exp)
    expert_level=round(expert,4)
    if expert_level<0.1:
        expert_level=0.1
    # print expert_level
    qr="UPDATE doctor_reg set expert_level='%s' WHERE doc_id='%s'" %(expert_level,doc_id)
    ob.updation(qr)

def info_extract(sr):
    sentences = sent_tokenize(sr)
    # print sentences
    # word tokenizing
    stopWords = set(stopwords.words('english'))
    entities = []
    out_entities = {}
    for sentence in sentences:
        print sentence
        words = word_tokenize(sentence)
        for word in words:

            if word not in stopWords:
                print word
                entities.append(word)

    for entity in entities:
        if entity in dic:
            # print entity
            val=dic.get(entity)
            di={entity:val}
            out_entities.update(di)
            # print di

    return out_entities
# q=info_extract("hai iam sufering from fever and headache")
# ans=info_extract("may be you have commoncold")
# dict_update(dic)
# print q
# print ans