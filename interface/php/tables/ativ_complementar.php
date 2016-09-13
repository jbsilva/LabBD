<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_atividade_complementar";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["descricao"] = utf8_encode($row["descricao"]);
      $rows[$i]["carga_horaria"] = utf8_encode($row["carga_horaria"]);
      $rows[$i]["id"] = utf8_encode($row["id"]);
      $rows[$i]["ra_ativ"] = utf8_encode($row["ra_ativ"]);
      $rows[$i]["codigo_disciplina"] = utf8_encode($row["codigo_disciplina"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
