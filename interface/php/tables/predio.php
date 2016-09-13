<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_predio";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["sigla"] = utf8_encode($row["sigla"]);
      $rows[$i]["descricao"] = utf8_encode($row["descricao"]);
      $rows[$i]["imagem"] = utf8_encode($row["imagem"]);
      $rows[$i]["localizacao_geografica"] = utf8_encode($row["localizacao_geografica"]);
      $rows[$i]["mapa_localizacao"] = utf8_encode($row["mapa_localizacao"]);
      $rows[$i]["primeira_sala"] = utf8_encode($row["primeira_sala"]);
      $rows[$i]["ultima_sala"] = utf8_encode($row["ultima_sala"]);
      $i++;

    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
