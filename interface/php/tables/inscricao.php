<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_inscricao";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["ra"] = utf8_encode($row["ra"]);
      $rows[$i]["semestreTurma"] = utf8_encode($row["semestreTurma"]);
      $rows[$i]["anoTurma"] = utf8_encode($row["anoTurma"]);
      $rows[$i]["codigoTurma"] = utf8_encode($row["codigoTurma"]);
      $rows[$i]["codigoDisciplina"] = utf8_encode($row["codigoDisciplina"]);
      $rows[$i]["media"] = utf8_encode($row["media"]);
      $rows[$i]["frequencia"] = utf8_encode($row["frequencia"]);
      $rows[$i]["resultado"] = utf8_encode($row["resultado"]);
      $rows[$i]["prioridadeDeInscricao"] = utf8_encode($row["prioridadeDeInscricao"]);
      $rows[$i]["statusDeSolicitacao"] = utf8_encode($row["statusDeSolicitacao"]);

      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
