import os.path
from flask import Flask,render_template,request,redirect,url_for,flash
import sqlite3 as sql
app=Flask(__name__)

@app.route("/")
def index():  
    return render_template("index.html");

@app.route("/usuarios")
def usuarios():
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(BASE_DIR, "E:\Python\projeto-wfms-escola\db_escola.db")
    with sql.connect(db_path) as con:
        # con=sql.connect(db_path)
        con.row_factory=sql.Row
        cur=con.cursor()
        cur.execute("select * from users")
        data=cur.fetchall()
        return render_template("usuarios.html",datas=data)

@app.route("/add_user",methods=['POST','GET'])
def add_user():
    if request.method=='POST':
        uname=request.form['uname']
        contact=request.form['contact']
        BASE_DIR = os.path.dirname(os.path.abspath(__file__))
        db_path = os.path.join(BASE_DIR, "E:\Python\projeto-wfms-escola\db_escola.db")
        # with sql.connect(db_path) as con:
        con=sql.connect(db_path)
        # con=sql.connect("db_escola.db")
        cur=con.cursor()
        cur.execute("insert into users(UNAME,CONTACT) values (?,?)",(uname,contact))
        con.commit()
        msg = 'Usuário => ' + uname + ' <= adicionado com sucesso!'
        flash(msg,'success')
        return redirect(url_for("usuarios"))
    return render_template("add_user.html")

@app.route("/edit_user/<string:uid>",methods=['POST','GET'])
def edit_user(uid):
    if request.method=='POST':
        uname=request.form['uname']
        contact=request.form['contact']
        BASE_DIR = os.path.dirname(os.path.abspath(__file__))
        db_path = os.path.join(BASE_DIR, "E:\Python\projeto-wfms-escola\db_escola.db")
        # with sql.connect(db_path) as con:
        con=sql.connect(db_path)
        # con=sql.connect("db_escola.db")
        cur=con.cursor()
        cur.execute("update users set UNAME=?,CONTACT=? where UID=?",(uname,contact,uid))
        con.commit()
        msg = 'Usuário => ' + uname + ' <= alterado com sucesso!'
        flash(msg,'success')
        return redirect(url_for("usuarios"))
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(BASE_DIR, "E:\Python\projeto-wfms-escola\db_escola.db")
    # with sql.connect(db_path) as con:
    con=sql.connect(db_path)
    # con=sql.connect("db_escola.db")
    con.row_factory=sql.Row
    cur=con.cursor()
    cur.execute("select * from users where UID=?",(uid,))
    data=cur.fetchone()
    return render_template("edit_user.html",datas=data)
    
@app.route("/delete_user/<string:uid>",methods=['GET'])
def delete_user(uid):
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))
    db_path = os.path.join(BASE_DIR, "E:\Python\projeto-wfms-escola\db_escola.db")
    # with sql.connect(db_path) as con:
    con=sql.connect(db_path)
    # con=sql.connect("db_escola.db")
    cur=con.cursor()
    cur.execute("delete from users where UID=?",(uid,))
    con.commit()
    msg = 'Usuário foi apagado com sucesso!'
    flash(msg,'warning')
    return redirect(url_for("usuarios"))
    
if __name__=='__main__':
    app.secret_key='admin123'
    app.run(debug=True)