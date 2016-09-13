<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_atividade";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["idAtividade"] = utf8_encode($row["idAtividade"]);
      $rows[$i]["dataInicio"] = utf8_encode($row["dataInicio"]);
      $rows[$i]["dataTermino"] = utf8_encode($row["dataTermino"]);
      $rows[$i]["descricao"] = utf8_encode($row["descricao"]);
      $rows[$i]["responsaveis"] = utf8_encode($row["responsaveis"]);
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["ano"] = utf8_encode($row["ano"]);
      $rows[$i]["semestre"] = utf8_encode($row["semestre"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
