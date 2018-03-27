
import pickle
dic={"fever":"disease","alergy":"symptom","paracetamol":"medicine"}
file_name="testfile.dat"
fileObject=open(file_name,'wb')
pickle.dump(dic,fileObject)
fileObject.close()
fileObject=open(file_name,'r')
b=pickle.load(fileObject)
fileObject.close()
fileObject=open(file_name,'wb')
dic2={"maleria":"disease"}
dic.update(dic2)
pickle.dump(dic,fileObject)
fileObject.close()
fileObject=open(file_name,'r')
c=pickle.load(fileObject)
print c