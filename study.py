from database import QUERIES
from flask import Flask,render_template,redirect,url_for,session,request
from nlt import extract,expertise,truthness
app = Flask(__name__)
app.secret_key="slfghfghghfghghfgggj"
ob = QUERIES()
@app.route('/')
def home():
    if 'username' and 'password' in session:
        return render_template('home.html')
    else :
        return redirect(url_for('login'))


@app.route('/register/',methods=['POST','GET'])
def register():
    if request.method =='POST':
        name=request.form['name']
        dob = request.form['dob']
        blood= request.form['blood']
        height=request.form['height']
        weight=request.form['weight']
        username = request.form['username']
        password = request.form['password']
        qr="insert into user (name,blood,dob,height,weight) values ('%s','%s','%s','%s','%s')" %(name,blood,dob,height,weight)
        sts=ob.insertion(qr)
        if sts['status']=="success":
            rowid = sts['data']
            sts=ob.insertion("insert into login (log_id,username,password,type) values('%s','%s','%s','user')" %(rowid,username,password))
            if sts['status']=="success":
                return redirect(url_for('login'))
            else:
                return "something went wrong"
        elif sts['status']=="failed":
            msg=sts['err_msg']
            return msg
    return render_template('register.html')

@app.route('/login/',methods=['GET','POST'])
def login():
    if 'login' in request.form:
        username = request.form['username']
        password = request.form['password']
        qr = "select * from login where username='%s' and password='%s'" % (username,password)





        result = ob.selection(qr)
        if result['status']=="success":
            if len(result['data'])==1:
                dt=result['data']
                session['log_id']=dt[0]['log_id']
                session['user_type'] = dt[0]['type']
                session['username'] = dt[0]['username']
                if session['user_type']=="user":
                    return redirect(url_for('userhome'))
                elif session['user_type']=="doctor":
                    return redirect(url_for('doctor_home'))
                else:
                    #goto admin home page
                    pass
                return redirect(url_for('home'))
            else:
                return "username and password incorrect"


    return render_template('login.html')

@app.route('/ask',methods=['POST','GET'])
def userhome():
    if request.method=='POST':
        question=request.form['question']
        ob.insertion("insert into questions (q_user,question,asked_date,truthness) values ('%s','%s',CURRENT_DATE,'100')" % (session['log_id'],question,))
    return render_template('userhome.html')

@app.route('/doc_register',methods=['POST','GET'])
def docreg():
    if request.method=='POST':
        name=request.form['name']
        spe=request.form['spec']
        qlfi =request.form['qualification']
        username=request.form['username']
        password=request.form['password']
        sts=ob.insertion("insert into doctor_reg (d_name,qualification,spec,expert_level,type) values ('%s','%s','%s','4','docter')" % (name,qlfi,spe,))
        if sts['status']=="success":
            stss=ob.insertion("insert into login (log_id,username,password,type) values ('%s','%s','%s','doctor')" %(sts['data'],username,password))
            if stss['status']=="success":
                return redirect(url_for('login'))
        else:
            return 'something went wrong'
    return render_template('doc_reg.html')
@app.route('/doctor',methods=['POST','GET'])
def doctor_home():
    result=ob.selection("SELECT * FROM questions WHERE q_id NOT IN (SELECT q_id FROM replayed WHERE doc_id='%s')" %session['log_id'] )
    if result['status']=="success":
        dt=result['data']
        return render_template('doctor_home.html',data=dt)

@app.route('/replay',methods=['POST','GET'])
def replay():
    id=request.args['id']
    if request.method=='POST':
        replay=request.form['replay']
        #
        # p_qid answer truthness u_rating doc_id
        print (id,replay,session['log_id'])
        qr="insert into prescription (q_id,answer,doc_id) values('%s','%s','%s')" %(id,replay,session['log_id'])
        print qr
        sts=ob.insertion(qr)
        if sts['status']=="success":
            pres=sts['data']
            truthness(pres)
            expertise(session['log_id'])
            qr="insert into replayed (doc_id,q_id) values('%s','%s')" % (session['log_id'],id)
            ob.insertion(qr)
            return redirect(url_for('doctor_home'))
        else:
            return "something went wrong"
    return render_template('replay.html')

if __name__ == "__main__" :
    app.run(debug=True)