<?php
    require_once 'conexao.php';


// Número de livros por página
$limit = 6;

// Calcular o offset (deslocamento) com base no número da página
$page = isset($_GET['page']) ? intval($_GET['page']) : 1;
$offset = ($page - 1) * $limit;

try {
    // Preparando a query SQL com parâmetros nomeados
    $stmt = $conn->prepare("
        SELECT L.TITULO_LIVRO, L.CAPA
            FROM TB_LIVRO AS L
            INNER JOIN TB_AUTOR AS A
            ON L.AUTOR = A.ID_AUTOR
            ORDER BY L.TITULO_LIVRO
            LIMIT :offset, :limit;
        ");

    // Vinculando os parâmetros
    $stmt->bindParam(':offset', $offset, PDO::PARAM_INT);
    $stmt->bindParam(':limit', $limit, PDO::PARAM_INT);

    // Executando a query
    $stmt->execute();

    // Exibindo os resultados
    echo "<h2>Livros:</h2>";
    echo "<ul>";
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        echo "<li><strong>Título:</strong> " . $row['title'] . " | <strong>Autor:</strong> " . $row['author'] . "</li>";
    }
    echo "</ul>";

    // Cálculo do número total de páginas
    $total_pages_stmt = $conn->query("SELECT COUNT(*) AS total FROM books");
    $total_books = $total_pages_stmt->fetch(PDO::FETCH_ASSOC)['total'];
    $total_pages = ceil($total_books / $limit);

    // Exibir links de paginação
    echo "<div>";
    for ($i = 1; $i <= $total_pages; $i++) {
        echo "<a href='?page=$i'>$i</a> ";
    }
    echo "</div>";

} catch (PDOException $e) {
        echo 'Erro: '.$e->getCode().' Mensagem: '.$e->getMessage();
}

?>
