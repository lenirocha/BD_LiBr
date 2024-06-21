<?php
	$dsn = 'mysql:host=localhost; dbname=biblioteca';
	$usuario = 'root';
	$senha = '';

	try {
		$conexao = new PDO($dsn, $usuario, $senha);	

		$conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		echo 'Conexão bem sucedida';

	} catch (PDOException $e) {
		echo 'Erro: '.$e->getCode().' Mensagem: '.$e->getMessage();
	}

	$conexao = null;

	?>
