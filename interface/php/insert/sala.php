<?php
// Escape user inputs for security
$numero = mysqli_real_escape_string($con, $_POST['numero']);
$predio = mysqli_real_escape_string($con, $_POST['predio']);
$tipo = mysqli_real_escape_string($con, $_POST['tipo']);
$recursos = mysqli_real_escape_string($con, $_POST['recursos']);
$caracteristicas = mysqli_real_escape_string($con, $_POST['caracteristicas']);
$capacidade_de_alunos = mysqli_real_escape_string($con, $_POST['capacidade_de_alunos']);
 
$sql = "INSERT INTO tbl_sala 
		(numero, predio,tipo,recursos,caracteristicas, capacidade_de_alunos)
		 VALUES ('$numero', '$predio', '$tipo', '$recursos','$caracteristicas','$capacidade_de_alunos')";
if(mysqli_query($con, $sql)){
    echo "Registro adicionado ao banco de dados";
} else{
    echo "ERROR: Could not able to execute $sql. " . mysqli_error($con);
}

?>