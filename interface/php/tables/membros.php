<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_membro";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["id"] = utf8_encode($row["id"]);
      $rows[$i]["categoria"] = utf8_encode($row["categoria"]);
      $rows[$i]["data_eleicao"] = utf8_encode($row["data_eleicao"]);
      $rows[$i]["periodo_inicio"] = utf8_encode($row["periodo_inicio"]);
      $rows[$i]["periodo_fim"] = utf8_encode($row["periodo_fim"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
