<?php
require "conexao.php";

$CPF = $_POST["CPF"];

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_pessoa where pessoa_id = $CPF";
$result = mysqli_query($con, $sql_query);

if(mysqli_num_rows($result)>0) {
	$row = mysqli_fetch_assoc($result);
    $prenome = $row["prenome"];
    $sobrenome = $row["sobrenome"];
    echo "Nome: ".$prenome." ".$sobrenome;
} else {
	echo "Pessoa não encontrada";
}
?>
