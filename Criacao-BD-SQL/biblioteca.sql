--cria o banco
CREATE DATABASE BIBLIOTECA;

USE BIBLIOTECA;

--cria a tabela que contém cadastro de alunos e professores
CREATE TABLE tb_Usuario (
    id_usuario INT AUTO_INCREMENT,
    cpf CHAR(11) UNIQUE NOT NULL,
    nome_usuario VARCHAR(50) NOT NULL,
    turma VARCHAR(4) NOT NULL,
    tipo ENUM('Professor', 'Aluno'),
    CONSTRAINT PK_id_usuario PRIMARY KEY (id_usuario)
);

--especialização de tb_Usuario: contém apenas os professores
CREATE TABLE tb_Professor (
    professor INT NOT NULL,
    turma_professor VARCHAR(4) NOT NULL,
    CONSTRAINT FK_professor FOREIGN KEY (professor)
        REFERENCES tb_Usuario (id_usuario)
);

--especialização de tb_Usuario: contém apenas os alunos
CREATE TABLE tb_Aluno (
    aluno INT NOT NULL,
    turma_aluno VARCHAR(4) NOT NULL,
    prof_respons INT NOT NULL,
    CONSTRAINT FK_aluno FOREIGN KEY (aluno)
        REFERENCES tb_Usuario (id_usuario),
    CONSTRAINT FK_prof_respons FOREIGN KEY (prof_respons)
        REFERENCES tb_Usuario (id_usuario)
);

--tabela que contém os usuários que farão login no sistema
CREATE TABLE tb_Bibliotecaria (
    chave_acesso INT AUTO_INCREMENT,
    nome_bibliotecaria VARCHAR(50) NOT NULL,
    senha CHAR(8) NOT NULL,
    CONSTRAINT PK_chave_acesso PRIMARY KEY (chave_acesso)
);

--tabela de autores
CREATE TABLE tb_Autor (
    id_autor INT AUTO_INCREMENT,
    nome_autor VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(25) NULL,
    CONSTRAINT PK_id_autor PRIMARY KEY (id_autor)
);

--tabela de categoria dos livros
CREATE TABLE tb_Categoria (
	id_categoria INT AUTO_INCREMENT,
	categoria VARCHAR(30) NOT NULL UNIQUE,
    CONSTRAINT PK_id_categoria PRIMARY KEY (id_categoria)
);

--tabela de títulos
CREATE TABLE tb_Livro (
    isbn VARCHAR(13) NOT NULL,
    titulo_livro VARCHAR(50) NOT NULL,
    autor INT NOT NULL,
    categoria INT NOT NULL,
    edicao INT NULL,
    ano_edicao CHAR(4) NULL,
    paginas INT NULL,
    capa BLOB NULL,
    CONSTRAINT PK_isbn PRIMARY KEY (isbn),
    CONSTRAINT FK_autor FOREIGN KEY (autor)
        REFERENCES tb_Autor (id_autor),
	CONSTRAINT FK_categoria FOREIGN KEY (categoria)
        REFERENCES tb_Categoria (id_categoria)
);

--exemplar de cada livro. tb_Livro 1 - N tb_Exemplar
CREATE TABLE tb_Exemplar (
    id_exemplar INT AUTO_INCREMENT,
    isbn VARCHAR(13) NOT NULL,
    status ENUM('Disponível', 'Emprestado'),
    CONSTRAINT PK_id_exemplar PRIMARY KEY (id_exemplar),
    CONSTRAINT FK_isbn FOREIGN KEY (isbn)
        REFERENCES tb_Livro (isbn)
);

--recebe as informações do empréstimo, incluindo data de devolução (default null)
CREATE TABLE tb_Emprestimo (
	id_emprestimo INT AUTO_INCREMENT,
    usuario INT NOT NULL,
    exemplar INT NOT NULL,
    data_emprestimo DATE NOT NULL,
    data_devolucao DATE NULL, 
    bibliotecaria INT NOT NULL,
    CONSTRAINT PK_id_emprestimo PRIMARY KEY (id_emprestimo),
    CONSTRAINT FK_usuario FOREIGN KEY (usuario) 
		REFERENCES tb_Usuario (id_usuario),
	CONSTRAINT FK_exemplar FOREIGN KEY (exemplar)
		REFERENCES tb_Exemplar (id_exemplar),
	CONSTRAINT FK_bibliotecaria FOREIGN KEY (bibliotecaria)
		REFERENCES tb_Bibliotecaria (chave_acesso)
);
