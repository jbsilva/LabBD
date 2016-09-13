<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_carga_horaria";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["pessoa"] = utf8_encode($row["pessoa"]);
      $rows[$i]["semestre_inicio"] = utf8_encode($row["semestre_inicio"]);
      $rows[$i]["semestre_termino"] = utf8_encode($row["semestre_termino"]);
      $rows[$i]["ano_inicio"] = utf8_encode($row["ano_inicio"]);
      $rows[$i]["ano_termino"] = utf8_encode($row["ano_termino"]);
      $rows[$i]["horas_aula"] = utf8_encode($row["horas_aula"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
