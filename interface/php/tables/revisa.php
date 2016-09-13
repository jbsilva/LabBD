<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_revisa";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["parecer"] = utf8_encode($row["parecer"]);
      $rows[$i]["aceitacao"] = utf8_encode($row["aceitacao"]);
      $rows[$i]["data_hora"] = utf8_encode($row["data_hora"]);
      $rows[$i]["docente_revisa"] = utf8_encode($row["docente_revisa"]);
      $rows[$i]["docente_elabora"] = utf8_encode($row["docente_elabora"]);
      $rows[$i]["codigoTurma"] = utf8_encode($row["codigoTurma"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
