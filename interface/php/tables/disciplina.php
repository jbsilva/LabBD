<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_disciplina";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["codigo"] = utf8_encode($row["codigo"]);
      $rows[$i]["nome"] = utf8_encode($row["nome"]);
      $rows[$i]["ementa"] = utf8_encode($row["ementa"]);
      $rows[$i]["creditospraticos"] = utf8_encode($row["creditospraticos"]);
      $rows[$i]["creditosteoricos"] = utf8_encode($row["creditosteoricos"]);
      $rows[$i]["departamento"] = utf8_encode($row["departamento"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
