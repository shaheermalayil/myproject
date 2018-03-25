import mysql.connector

class QUERIES:

    def __init__(self):
        self.cnx= mysql.connector.connect(user="root", password="", host="localhost", database="mydb")
        self.cur = self.cnx.cursor(dictionary=True)


    def selection(self,q):
        a={}
        try:
            self.cur.execute(q)
            a['status']="success"
            a['data']=self.cur.fetchall()
        except Exception,e:
            a['status'] = "failed"
            a['err_msg'] = e.message

        return a

    def insertion(self,q):
        a = {}
        try:
            self.cur.execute(q)
            self.cnx.commit()
            a['status'] = "success"
            a['data'] = self.cur.lastrowid
        except Exception,e:
            a['status'] = "failed"
            a['err_msg'] = e.message

        return a


    def updation(self,q):
        try:
            self.cur.execute(q)
            self.cnx.commit()
            return True
        except Exception,e:
            return False

    def deletion(self,q):
        try:
            self.cur.execute(q)
            return  True
        except Exception,e:
            return False
