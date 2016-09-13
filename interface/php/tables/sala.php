<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_sala";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["numero"] = utf8_encode($row["numero"]);
      $rows[$i]["predio"] = utf8_encode($row["predio"]);
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["recursos"] = utf8_encode($row["recursos"]);
      $rows[$i]["caracteristicas"] = utf8_encode($row["caracteristicas"]);
      $rows[$i]["capacidade_de_alunos"] = utf8_encode($row["capacidade_de_alunos"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
