from flask import *  
import sqlite3  

app = Flask(__name__)  

@app.route("/")  
def index():  
    return render_template("index.html");

@app.route("/savedetails",methods = ["POST","GET"])  
def saveDetails():  
    msg = "msg"  
    if request.method == "POST":  
        try:  
            cpf_aluno = request.form["cpf_aluno"]  
            nome = request.form["nome"]  
            endereco = request.form["endereco"]  
            telefone = request.form["telefone"]  
            data_nasc = request.form["data_nasc"]  
            with sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db") as con:  
                cur = con.cursor()   
                cur.execute("INSERT into aluno (cpf_aluno, nome, endereco, telefone, data_nasc) values (?,?,?)",(cpf_aluno,nome,endereco,telefone,data_nasc))
                con.commit()  
                msg = "Aluno adicionado com sucesso!"   
        except:  
            con.rollback()
            msg = "Não pudemos adicionar o Aluno no cadastro!"  
        finally:  
            return render_template("successo.html",msg = msg)  
    con.close()  

@app.route("/add_alunos")  
def add_alunos():   
    return render_template("add_alunos.html")  

@app.route("/delete_alunos")  
def delete_alunos():  
    return render_template("delete_alunos.html")  

@app.route("/delete_record_alunos",methods = ["POST"])   
def delete_record_alunos():  
    cpf_aluno = request.form["cpf_aluno"]  
    with sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db") as con:  
        try:  
            cur = con.cursor()  
            cur.execute("delete from aluno where cpf_aluno = ?",cpf_aluno)  
            msg = "Registro apagado com sucesso!"   
        except:  
            msg = "Não pode ser apagado!"  
        finally:  
            return render_template("delete_record_alunos.html",msg = msg)  







@app.route("/view_alunos")  
def view_alunos():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from aluno")   
    rows = cur.fetchall()  
    return render_template("view_alunos.html",rows = rows)

@app.route("/view_compoe")  
def view_compoe():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from compoe")   
    rows = cur.fetchall()  
    return render_template("view_compoe.html",rows = rows)

@app.route("/view_cursa")  
def view_cursa():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from cursa")   
    rows = cur.fetchall()  
    return render_template("view_cursa.html",rows = rows)

@app.route("/view_cursos")  
def view_cursos():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from cursos")   
    rows = cur.fetchall()  
    return render_template("view_cursos.html",rows = rows)

@app.route("/view_departamentos")  
def view_departamentos():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from departamentos")   
    rows = cur.fetchall()  
    return render_template("view_departamentos.html",rows = rows)

@app.route("/view_desciplinas")  
def view_disciplinas():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from disciplinas")   
    rows = cur.fetchall()  
    return render_template("view_disciplinas.html",rows = rows)

@app.route("/view_matriculas")  
def view_matriculas():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from matriculas")   
    rows = cur.fetchall()  
    return render_template("view_matriculas.html",rows = rows)

@app.route("/view_pre_requisitos")  
def view_pre_requisitos():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from pre_requisitos")   
    rows = cur.fetchall()  
    return render_template("view_pre_requisitos.html",rows = rows)

@app.route("/view_professores")  
def view_professores():  
    con = sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from professores")   
    rows = cur.fetchall()  
    return render_template("view_professores.html",rows = rows)  


@app.route("/alunos")  
def alunos():   
    return render_template("alunos.html")  

@app.route("/professores")  
def professores():   
    return render_template("professores.html")  

@app.route("/cursos")  
def cursos():   
    return render_template("cursos.html")  

@app.route("/disciplinas")  
def disciplinas():   
    return render_template("disciplinas.html")  

@app.route("/pre_requisitos")  
def pre_requisitos():   
    return render_template("pre_requisitos.html")  

@app.route("/departamentos")  
def departamentos():   
    return render_template("departamentos.html")  

@app.route("/matriculas")  
def matriculas():   
    return render_template("matriculas.html")  

@app.route("/compoe")  
def compe():   
    return render_template("compoe.html")  
@app.route("/cursa")  
def cursa():   
    return render_template("compoe.html")  

if __name__ == "__main__":  
    app.run(debug = True)


# @app.route("/view")  
# def view():  
#     con = sqlite3.connect("student.db")  
#     con.row_factory = sqlite3.Row  
#     cur = con.cursor()  
#     cur.execute("select * from student")   
#     rows = cur.fetchall()  
#     return render_template("view.html",rows = rows)  
