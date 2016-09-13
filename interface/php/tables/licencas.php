<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_licenca";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["pessoa_id"] = utf8_encode($row["pessoa_id"]);
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["documento"] = utf8_encode($row["documento"]);
      $rows[$i]["data_inicio"] = utf8_encode($row["data_inicio"]);
      $rows[$i]["data_final"] = utf8_encode($row["data_final"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
