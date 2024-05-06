<?php
$servername="VIERNES";
$conexion=[
    "Database"=>"BDDiego", 
    "Uid"=>"ex324",
    "PWD"=>"123"
];
$conn=sqlsrv_connect($servername,$conexion);
if($conn == false){
    die(print_r(sqlsrv_errors(),true));
}
else{
    //echo "conexion exitosa";
}
?>