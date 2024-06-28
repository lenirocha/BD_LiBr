/*DEVOLUÇÃO DO LIVRO*/ 

UPDATE tb_emprestimo
SET data_devolucao = NOW()
WHERE id_emprestimo = :id_emprestimo;

UPDATE TB_EXEMPLAR
SET STATUS = 'Disponível'
WHERE ID_EXEMPLAR = :id_exemplar;