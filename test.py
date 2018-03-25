from database import QUERIES
from flask import Flask,render_template,redirect,url_for,session,request
import os
from werkzeug.security import generate_password_hash,check_password_hash
from flask_bootstrap import Bootstrap
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])



app = Flask(__name__)
Bootstrap(app)
app.config['UPLOAD_FOLDER'] = os.path.realpath('.') + '/static/uploads'
app.secret_key="slfghfghghfghghfgggj"
ob = QUERIES()
@app.route('/',methods=['GET','POST'])
def home():
    if request.method == "POST":
        image = request.files['im']
        if image:
            image.save(os.path.join(app.config['UPLOAD_FOLDER'],'saheer.jpg'))


    return render_template('layout.html')

if __name__ == "__main__" :
    app.run(debug=True)