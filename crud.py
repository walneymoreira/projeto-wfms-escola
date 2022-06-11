from flask import *  
import sqlite3
import app

app = Flask(__name__)  
#app=Flask(__name__,template_folder='templates')
@app.route("/")  
def index():  
    return render_template("index.html");

@app.route("/savedetails_alunos",methods = ["POST","GET"])  
def saveDetails_alunos():  
    msg = "msg"  
    if request.method == "POST":  
        try:  
            cpf_aluno = request.form["cpf_aluno"]  
            nome = request.form["nome"]  
            endereco = request.form["endereco"]  
            telefone = request.form["telefone"]  
            data_nasc = request.form["data_nasc"]  
            with sqlite3.connect("E:\Python\projeto-wfms-escola\db_escola.db") as con:  
                cur = con.cursor()   
                cur.execute("INSERT into aluno (cpf_aluno, nome, endereco, telefone, data_nasc) values (?,?,?,?,?)",(cpf_aluno,nome,endereco,telefone,data_nasc))
                con.commit()  
                msg = "Aluno adicionado com sucesso!"   
            return render_template("successo_aluno.html",msg = msg)  
        except:  
            con.rollback()
            msg = "Não pudemos adicionar o Aluno no cadastro!"  
        # finally:  
            return render_template("successo_aluno.html",msg = msg)  
    con.close()  

@app.route("/usuarios")  
def usuarios():   
    return render_template("usuarios.html")  

@app.route("/add_alunos")  
def add_alunos():   
    return render_template("add_alunos.html")  

@app.route("/view_alunos")  
def view_alunos():  
    con = sqlite3.connect("E:\Python\projeto-wfms-escola\db_escola.db")  
    con.row_factory = sqlite3.Row  
    cur = con.cursor()  
    cur.execute("select * from aluno")   
    rows = cur.fetchall()  
    return render_template("view_alunos.html",rows = rows)

@app.route("/alunos")  
def alunos():   
    return render_template("alunos.html")

@app.route("/matriculas")  
def matriculas():   
    return render_template("matriculas.html")  

@app.route("/deletealunos")  
def deletealunos():  
    return render_template("deletealunos.html")  

@app.route("/deleterecordalunos",methods = ["POST"])   
def deleterecordalunos():  
    cpf_aluno = request.form["cpf_aluno"]
    con = sqlite3.connect("E:\Python\projeto-wfms-escola\db_escola.db")
    cur = con.cursor()
    cur.execute("delete from aluno where cpf_aluno=?",(cpf_aluno,))
    count = cur.rowcount()
    if count != 0 and len(cpf_aluno) == 11:
        con.commit
        con.close
        msg = "Aluno apagado da base de dados com sucesso!"
    else:
        con.close
        msg = "Cpf inválido ou não cadastro!"
    # except:
    #     msg = "Não pode ser apagado!"  
    #     con.close
    # finally:
        # con.close
    return render_template("deleterecordalunos.html",msg = msg)  

# def localiza_aluno(cpf_aluno):
#     with sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db") as con:  
#         # try:
#         cur = con.cursor()
#         resultado = cur.execute("select * from aluno where cpf_aluno=?",(cpf_aluno,))
#         con.close
#         return resultado.rowcount()



if __name__ == "__main__":  
    app.run(debug = True)

        # except:
        #     con.close
        #     return False
        # finally:
        #     con.close
        #     return encontrou  

# @app.route("/view")  
# def view():  
#     con = sqlite3.connect("student.db")  
#     con.row_factory = sqlite3.Row  
#     cur = con.cursor()  
#     cur.execute("select * from student")   
#     rows = cur.fetchall()  
#     return render_template("view.html",rows = rows)  
# def deleterecordalunos():  
#     cpf_aluno = request.form["cpf_aluno"]
#     with sqlite3.connect("E:\Python\projeto-escola-wfms\db_escola.db") as con:  
#         try:
#             if localiza_aluno(cpf_aluno) == True and len(cpf_aluno) == 11:
#                 cur = con.cursor()
#                 cur.execute("delete from aluno where cpf_aluno=?",(cpf_aluno,))
#                 msg = "Aluno apagado da base de dados com sucesso!"
#             else:
#                 msg = "Cpf inválido ou não cadastro!"
#         except:
#             msg = "Não pode ser apagado!"  
#         finally:
#             con.close
#             return render_template("deleterecordalunos.html",msg = msg)  
