<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_estagio";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["pais_atuacao"] = utf8_encode($row["pais_atuacao"]);
      $rows[$i]["termo_compromisso"] = utf8_encode($row["termo_compromisso"]);
      $rows[$i]["carta_avaliacao"] = utf8_encode($row["carta_avaliacao"]);
      $rows[$i]["supervisor_empresa"] = utf8_encode($row["supervisor_empresa"]);
      $rows[$i]["empresa"] = utf8_encode($row["empresa"]);
      $rows[$i]["obrigatorio"] = utf8_encode($row["obrigatorio"]);
      $rows[$i]["data_termino"] = utf8_encode($row["data_termino"]);
      $rows[$i]["data_inicio"] = utf8_encode($row["data_inicio"]);
      $rows[$i]["estudante_ra"] = utf8_encode($row["estudante_ra"]);
      $rows[$i]["supervisor_id"] = utf8_encode($row["supervisor_id"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
