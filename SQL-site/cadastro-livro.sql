/*PÁGINA DE CADASTRO DO LIVRO*/
INSERT INTO TB_LIVRO(isbn, titulo_livro, autor, categoria, edicao, ano_edicao, paginas) 
VALUES (:isbn, :titulo_livro, (SELECT ID_AUTOR FROM TB_AUTOR WHERE NOME_AUTOR = :NOME_AUTOR), (SELECT ID_CATEGORIA FROM TB_CATEGORIA WHERE CATEGORIA = :CATEGORIA), :edicao, :ano_edicao, :paginas);