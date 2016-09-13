<?php
$db_name = 'siga';
$db_user = 'labbd';
$db_pass = 'labbd123';
$db_host = 'localhost';
$con = mysqli_connect($db_host,$db_user,$db_pass,$db_name);

// Verifica conexao
if ($conn->connect_error) {
    die('Falha na conexão: ' . $conn->connect_error);
}
?>
