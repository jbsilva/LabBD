<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_pessoa";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["prenome"] = utf8_encode($row["prenome"]);
      $rows[$i]["sobrenome"] = utf8_encode($row["sobrenome"]);
      $rows[$i]["pessoa_id"] = utf8_encode($row["pessoa_id"]);
      $rows[$i]["tipo_doc"] = utf8_encode($row["tipo_doc"]);
      $rows[$i]["rg"] = utf8_encode($row["rg"]);
      $rows[$i]["raca"] = utf8_encode($row["raca"]);
      $rows[$i]["sexo"] = utf8_encode($row["sexo"]);
      $rows[$i]["cidade_nasc"] = utf8_encode($row["cidade_nasc"]);
      $rows[$i]["pais_nasc"] = utf8_encode($row["pais_nasc"]);
      $rows[$i]["uf_nasc"] = utf8_encode($row["uf_nasc"]);
      $rows[$i]["data_nasc"] = utf8_encode($row["data_nasc"]);
      $rows[$i]["pai_filiacao"] = utf8_encode($row["pai_filiacao"]);
      $rows[$i]["mae_filiacao"] = utf8_encode($row["mae_filiacao"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Pessoa não encontrada";
}
?>
