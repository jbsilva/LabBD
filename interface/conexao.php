<?php
$db_name = "siga";
$db_user = "labbd";
$db_pass = "labbd123";
$db_host = "127.0.0.1";
$con = mysqli_connect($db_host,$db_user,$db_pass,$db_name);

if(!$con){
    die("Não foi possível conectar ao banco de dados");
}
?>
