<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_turma";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["codigoturma"] = utf8_encode($row["codigoturma"]);
      $rows[$i]["codigodisciplina"] = utf8_encode($row["codigodisciplina"]);
      $rows[$i]["numerodevagas"] = utf8_encode($row["numerodevagas"]);
      $rows[$i]["horario"] = utf8_encode($row["horario"]);
      $rows[$i]["dia"] = utf8_encode($row["dia"]);
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
