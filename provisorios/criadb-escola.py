import sqlite3

conn = sqlite3.connect('E:\python\projeto-escola-flask\db_escola.db')
print("Opened database successfully");

conn.execute('CREATE TABLE estudantes (nome TEXT, endereco TEXT, cidade TEXT, telefone, email, pin TEXT)')
print("Table created successfully");
conn.close()