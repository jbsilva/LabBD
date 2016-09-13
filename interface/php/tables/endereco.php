<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_endereco";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["pessoa"] = utf8_encode($row["pessoa"]);
      $rows[$i]["cep_end"] = utf8_encode($row["cep_end"]);
      $rows[$i]["pais_end"] = utf8_encode($row["pais_end"]);
      $rows[$i]["uf_end"] = utf8_encode($row["uf_end"]);
      $rows[$i]["cidade_end"] = utf8_encode($row["cidade_end"]);
      $rows[$i]["bairro_end"] = utf8_encode($row["bairro_end"]);
      $rows[$i]["complemento_end"] = utf8_encode($row["complemento_end"]);
      $rows[$i]["rua_end"] = utf8_encode($row["rua_end"]);
      $rows[$i]["ddd_end_tel"] = utf8_encode($row["ddd_end_tel"]);
      $rows[$i]["prefixo_end_tel"] = utf8_encode($row["prefixo_end_tel"]);
      $rows[$i]["numero_end_tel"] = utf8_encode($row["numero_end_tel"]);
      $rows[$i]["ramal_end_tel"] = utf8_encode($row["ramal_end_tel"]);
      $rows[$i]["tipo_end"] = utf8_encode($row["tipo_end"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
