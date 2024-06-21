/*INSERTS PARA ALIMENTAR O BANCO*/

SELECT 
    *
FROM
    information_schema.columns
WHERE
    table_schema = 'biblioteca'
        AND table_name = 'TB_LIVRO';
        
INSERT INTO TB_CATEGORIA(CATEGORIA) VALUES ('Ficção'),
    ('Realismo'),
    ('Poesia'),
    ('Filosofia');
    
SELECT * FROM tb_categoria;
    

INSERT INTO TB_AUTOR(NOME_AUTOR) VALUES ('Margaret Atwood'), 
    ('Johann Wolfgang von Goethe'),
    ('Friedrich Nietzsche'),
    ('Machado de Assis');

SELECT * FROM TB_AUTOR;

INSERT INTO TB_LIVRO(isbn, titulo_livro, autor, categoria, editora, edicao, ano_edicao, paginas) 
VALUES ('9788532520661', 'O conto da aia', (SELECT ID_AUTOR FROM TB_AUTOR WHERE NOME_AUTOR = 'Margaret Atwood'), (SELECT ID_CATEGORIA FROM TB_CATEGORIA WHERE CATEGORIA = 'FICÇÃO'), 'Rocco', 1, '2017', 368), 
    ('9788544001196', 'Fausto', (SELECT ID_AUTOR FROM TB_AUTOR WHERE NOME_AUTOR = 'Johann Wolfgang von Goethe'), (SELECT ID_CATEGORIA FROM TB_CATEGORIA WHERE CATEGORIA = 'POESIA'), 'Martin Claret', 1, '2016', 642), 
    ('9786587817699', 'Assim Falou Zaratustra', (SELECT ID_AUTOR FROM TB_AUTOR WHERE NOME_AUTOR = 'Friedrich Nietzsche'), (SELECT ID_CATEGORIA FROM TB_CATEGORIA WHERE CATEGORIA = 'FILOSOFIA'), 'Camelot Editora', 1, '2023', 208), 
    ('9788520931837', 'Esaú e Jacó', (SELECT ID_AUTOR FROM TB_AUTOR WHERE NOME_AUTOR = 'Machado de Assis'), (SELECT ID_CATEGORIA FROM TB_CATEGORIA WHERE CATEGORIA = 'Realismo'), 'Nova Fronteira', 1, '2017', 252); 
    

INSERT INTO TB_EXEMPLAR(isbn, status_exemplar) VALUES ((SELECT isbn FROM TB_LIVRO WHERE isbn = '9788532520661'), 'Disponível');