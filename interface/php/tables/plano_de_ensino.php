<?php
header('Content-Type: application/json');
define('__ROOT__', dirname(dirname(dirname(__FILE__))));
require_once(__ROOT__.'/php/config.php');

// Pega o nome da pessoa pelo CPF
$sql_query = "SELECT * FROM siga.tbl_plano_de_ensino";
$result = mysqli_query($con, $sql_query);
$rows = array();
$i = 0;
if(mysqli_num_rows($result)>0) {
    while($row = mysqli_fetch_assoc($result)){
      $rows[$i]["procedimento_avaliacao"] = utf8_encode($row["procedimento_avaliacao"]);
      $rows[$i]["recursos"] = utf8_encode($row["recursos"]);
      $rows[$i]["bibliografia_basica"] = utf8_encode($row["bibliografia_basica"]);
      $rows[$i]["bibliografia_complementar"] = utf8_encode($row["bibliografia_complementar"]);
      $rows[$i]["objetivos_gerais"] = utf8_encode($row["objetivos_gerais"]);
      $rows[$i]["objetivos_especificos"] = utf8_encode($row["objetivos_especificos"]);
      $rows[$i]["estrategia_ensino"] = utf8_encode($row["estrategia_ensino"]);
      $rows[$i]["atividades_alunos"] = utf8_encode($row["atividades_alunos"]);
      $rows[$i]["observacoes"] = utf8_encode($row["observacoes"]);
      $rows[$i]["atividades_ead"] = utf8_encode($row["atividades_ead"]);
      $rows[$i]["data"] = utf8_encode($row["data"]);
      $rows[$i]["situacao"] = utf8_encode($row["situacao"]);
      $rows[$i]["duracao_topicos"] = utf8_encode($row["duracao_topicos"]);
      $rows[$i]["pescd"] = utf8_encode($row["pescd"]);
      $rows[$i]["distribuicao_horas"] = utf8_encode($row["distribuicao_horas"]);
      $rows[$i]["turma"] = utf8_encode($row["turma"]);
      $rows[$i]["professor"] = utf8_encode($row["professor"]);
      $rows[$i]["ementa"] = utf8_encode($row["ementa"]);
      $rows[$i]["requisitos"] = utf8_encode($row["requisitos"]);
      $rows[$i]["idDocente"] = utf8_encode($row["idDocente"]);
      $rows[$i]["codigoTurma"] = utf8_encode($row["codigoTurma"]);
      $i++;
    }
    $json_data = json_encode($rows);
    echo $json_data;
} else {
    echo "Sem registros";
}
?>
