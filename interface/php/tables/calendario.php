<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_calendario";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["ano"] = utf8_encode($row["ano"]);
      $rows[$i]["semestre"] = utf8_encode($row["semestre"]);
      $rows[$i]["tipo"] = utf8_encode($row["tipo"]);
      $rows[$i]["data_ini"] = utf8_encode($row["data_ini"]);
      $rows[$i]["data_ter"] = utf8_encode($row["data_ter"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
