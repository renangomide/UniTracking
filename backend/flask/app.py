from flask import Flask, request, Response, jsonify
from flask_restful import Api
from flask_sqlalchemy import *
import json
import psycopg2

app = Flask(__name__)
api = Api(app)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']= True 
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:enzowow04@localhost:5432/unitracking'

db = SQLAlchemy(app)

class Instituicao(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    sigla = db.Column(db.String(10), nullable = False)
    nome = db.Column(db.String(100), nullable = False)
    
    # Relacionamentos
    cursos = db.relationship('Curso', backref='cursos_instituicao')
    alunos = db.relationship('Aluno', backref="alunos_instituicao")
    
    def to_json(self):
        return {
            "id": self.id,
            "sigla": self.sigla,
            "nome": self.nome
        }
    
class Curso(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    nome = db.Column(db.String(50), nullable = False)
    
    # Foreign Keys
    instituicao_id = db.Column(db.Integer, db.ForeignKey('instituicao.id'))
    
    # Relacionamentos
    alunos = db.relationship('Aluno', backref='matriculados_curso')
    
class Aluno(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    nome = db.Column(db.String(50), nullable = False)
    matricula = db.Column(db.String(20), nullable = False)
    cpf = db.Column(db.String(15), nullable = False)
    email = db.Column(db.String(60), nullable = False)
    telefone = db.Column(db.String(15), nullable = False)
    login = db.Column(db.String(255), nullable = False)
    senha = db.Column(db.String(60), nullable = False) 
    
    # Foreign Keys
    curso_id = db.Column(db.Integer, db.ForeignKey('curso.id'))   
    instituicao_id = db.Column(db.Integer, db.ForeignKey('instituicao.id'))
    
    # Relacionamentos
    matriculas_turma = db.relationship('Matricula', backref='discente')
    
    def to_json(self):
        return {
            "id": self.id,
            "nome": self.nome,
            "matricula": self.matricula,
            "cpf": self.cpf,
            "email": self.email,
            "telefone": self.telefone
        }

class Professor(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    nome = db.Column(db.String(50), nullable = False)
    cpf = db.Column(db.String(15), nullable = False)
    email = db.Column(db.String(60), nullable = False)
    telefone = db.Column(db.String(15), nullable = False)
    login = db.Column(db.String(255), nullable = False)
    senha = db.Column(db.String(60), nullable = False)
    
    # Foreign Keys
    instituicao_id = db.Column(db.Integer, db.ForeignKey('instituicao.id'))
    
    # Relacionamentos
    turmas = db.relationship('Turma', backref='docente')
    
class Disciplina(db.Model): 
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    codigo = db.Column(db.String(10), nullable = False) 
    nome = db.Column(db.String(60), nullable = False)
    
    # Foreign Key
    instituicao_id = db.Column(db.Integer, db.ForeignKey('instituicao.id'))
    
    # Relacionamentos
    turmas = db.relationship('Turma', backref='turmas_disciplina')
    
class Semestre(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    ano = db.Column(db.Integer, nullable = False)
    semestre = db.Column(db.Integer, nullable = False)
    
class Matricula(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    
    # Foreign Keys
    aluno_id = db.Column(db.Integer, db.ForeignKey('aluno.id'))
    turma_id = db.Column(db.Integer, db.ForeignKey('turma.id'))
    
class Falta(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    
    # Foreign Keys
    aluno_id = db.Column(db.Integer, db.ForeignKey('aluno.id'))
    turma_id = db.Column(db.Integer, db.ForeignKey('turma.id'))
    
    def to_json(self):
        return {
            "id": self.id,
            "aluno": self.aluno_id, 
            "turma:": self.turma_id
        }
    
class Turma(db.Model):
    id = db.Column(db.Integer, primary_key = True, autoincrement = True)
    letra = db.Column(db.String(3), nullable = False)
    
    # Foreign Keys
    disciplina_id = db.Column(db.Integer, db.ForeignKey('disciplina.id'))
    semestre_id = db.Column(db.Integer, db.ForeignKey('semestre.id'))
    professor_id = db.Column(db.Integer, db.ForeignKey('professor.id'))
    
# ROTAS        
@app.route("/instituicoes", methods=["GET"])
def seleciona_instituicoes():
    instituicoes_obj = Instituicao.query.all()
    instituicoes_json = [instituicao.to_json() for instituicao in instituicoes_obj]

    return gera_response(200, "instituicoes", instituicoes_json)

@app.route("/instituicao/<id>", methods=["GET"])
def seleciona_instituicao():
    instituicao_obj = Instituicao.query.filter_by(id=id).first()
    instituicao_json = instituicao_obj.to_json()

    return gera_response(200, "instituicao", instituicao_json)

@app.route("/instituicao", methods=["POST"])
def cria_usuario():
    body = request.get_json()
    try: 
        instituicao = Instituicao(sigla=body["sigla"], nome=body["sigla"])
        db.session.add(instituicao)
        db.session.commit()
        
        return gera_response(201, "instituicao", instituicao.to_json(), "Instituicao criada com sucesso!")
        
    except Exception as e:
        print (e)
        
        return gera_response(400, "instituicao", {}, "Erro ao cadastrar")   
    
@app.route("/falta", methods=["POST"])
def emite_falta():
    body = request.get_json()
    try:
        falta = Falta(aluno_id=body["aluno_id"], turma_id=body["turma_id"])
        db.session.add(falta)
        db.session.commit()
        
        return gera_response(201, "falta", falta.to_json(), "Falta criada com sucesso!")
        
    except Exception as e:
        print (e)
        
        return gera_response(400, "falta", {}, "Erro ao cadastrar falta")
    
@app.route("/aluno/<id>", methods=["GET"])
def seleciona_aluno():
    aluno_obj = Aluno.query.filter_by(id=id).first()
    aluno_json = aluno_obj.to_json()

    return gera_response(200, "instituicoes", aluno_json)

@app.route("/aluno/<id>/faltas", methods=["GET"])
def seleciona_faltas_aluno(id):
    faltas_obj = Falta.query.filter_by(aluno_id=id).order_by(Falta.turma_id).all()
    faltas_json = [falta.to_json() for falta in faltas_obj]
    
    return gera_response(200, f"faltas_aluno_{id}", faltas_json)
    
def gera_response(status, nome_do_conteudo, conteudo, mensagem=False):
    body = {}
    body[nome_do_conteudo] = conteudo
    
    if(mensagem):
        body["mensagem"] = mensagem
        
    return Response(json.dumps(body), status=status, mimetype="application/json")    
    
app.run()
