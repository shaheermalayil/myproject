import mysql.connector
from flask_bootstrap import Bootstrap
from flask import Flask,render_template,redirect,url_for,session,request
app = Flask(__name__)
Bootstrap(app)
app.secret_key="slfghfghghfghghfgggj"
cnx= mysql.connector.connect(user="root", password="", host="localhost", database="mydb")
cur = cnx.cursor(dictionary=True)

@app.route('/')
def home():
    return render_template('public/index.html')

@app.route('/login')
def log():
    return render_template('public/login.html')

@app.route('/register')
def register():
    return render_template('public/registrationform.html')

if __name__=="__main__":
    app.run(debug=True)