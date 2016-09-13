<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_estudante";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["ano_conclusao"] = utf8_encode($row["ano_conclusao"]);
      $rows[$i]["ensino_medio"] = utf8_encode($row["ensino_medio"]);
      $rows[$i]["ra"] = utf8_encode($row["ra"]);
      $rows[$i]["pessoa_id"] = utf8_encode($row["pessoa_id"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
