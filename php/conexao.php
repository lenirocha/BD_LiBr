<?php
	$dsn = 'mysql:host=localhost; dbname=biblioteca';
	$usuario = 'root';
	$senha = '';

	try {
		$conn = new PDO($dsn, $usuario, $senha);	

		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		echo 'Conexão bem sucedida';

	} catch (PDOException $e) {
		echo 'Erro: '.$e->getCode().' Mensagem: '.$e->getMessage();
	}

	$con = null;

	?>
