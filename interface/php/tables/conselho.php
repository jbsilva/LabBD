<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_conselho";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["sigla"] = utf8_encode($row["sigla"]);
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["datainiciovigencia"] = utf8_encode($row["datainiciovigencia"]);
      $rows[$i]["datafimvigencia"] = utf8_encode($row["datafimvigencia"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
