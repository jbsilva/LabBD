<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_matricula";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["ira"] = utf8_encode($row["ira"]);
      $rows[$i]["creditos_obrigatorios"] = utf8_encode($row["creditos_obrigatorios"]);
      $rows[$i]["creditos_optativos"] = utf8_encode($row["creditos_optativos"]);
      $rows[$i]["creditos_complementares"] = utf8_encode($row["creditos_complementares"]);
      $rows[$i]["perfil"] = utf8_encode($row["perfil"]);
      $rows[$i]["ano_ingresso"] = utf8_encode($row["ano_ingresso"]);
      $rows[$i]["ra"] = utf8_encode($row["ra"]);
      $rows[$i]["sigla"] = utf8_encode($row["sigla"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
