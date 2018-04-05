import pickle
def dict_update(dic,file_name="testfile.dat"):
    fileObject = open(file_name, 'r')
    dicti=pickle.load(fileObject)
    fileObject.close()
    fileObject=open(file_name,'wb')
    dicti.update(dic)
    pickle.dump(dicti,fileObject)
    fileObject.close()
def dict_read(file_name="testfile.dat"):
    fileObject = open(file_name, 'r')
    dict=pickle.load(fileObject)
    fileObject.close()
    return dict
