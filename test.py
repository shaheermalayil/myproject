import pickle

def dcitUpdate(dic,file_name="testfile.dat"):
    fileObject = open(file_name, 'r')
    dictionary=pickle.load(fileObject)
    print dictionary
dic={"sdf":"sdf"}
dcitUpdate(dic)
# dic={"fever":"disease","alergy":"symptom","paracetamol":"medicine"}
# file_name="testfile.dat"
# fileObject=open(file_name,'wb')
# pickle.dump(dic,fileObject)
# fileObject.close()
# fileObject=open(file_name,'r')
# b=pickle.load(fileObject)
# fileObject.close()
# fileObject=open(file_name,'wb')
# dic2={"fever":"disease","headache":"disease"}
# dic.update(dic2)
# pickle.dump(dic,fileObject)
# fileObject.close()
# fileObject=open(file_name,'r')
# c=pickle.load(fileObject)
# print c