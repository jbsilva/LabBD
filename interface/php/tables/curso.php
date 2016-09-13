<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_curso";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["sigla"] = utf8_encode($row["sigla"]);
      $rows[$i]["nome"] = utf8_encode($row["nome"]);
      $rows[$i]["duracaomedia"] = utf8_encode($row["duracaomedia"]);
      $rows[$i]["duracaomaxima"] = utf8_encode($row["duracaomaxima"]);
      $rows[$i]["PPPaprovado"] = utf8_encode($row["PPPaprovado"]);
      $rows[$i]["centro"] = utf8_encode($row["centro"]);
      $rows[$i]["creditosNecessarios"] = utf8_encode($row["creditosNecessarios"]);
      $rows[$i]["creditosComplementares"] = utf8_encode($row["creditosComplementares"]);
      $rows[$i]["creditosObrigatorios"] = utf8_encode($row["creditosObrigatorios"]);
      $rows[$i]["creditosOptativos"] = utf8_encode($row["creditosOptativos"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
