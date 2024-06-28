/*CADASTRO DE UM NOVO EXEMPLAR*/

INSERT INTO TB_EXEMPLAR(isbn, status_exemplar) VALUES ((SELECT isbn FROM TB_LIVRO WHERE isbn = :isbn), 'Disponível');