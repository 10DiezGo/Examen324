<?php
include('conexion.php');
$numero_cuenta=$_POST['numero_cuenta'];
$id_persona=$_POST['id_persona'];
$tipo_cuenta=$_POST['tipo_cuenta'];
$saldo=$_POST['saldo'];
$banco=$_POST['banco'];
$sucursal=$_POST['sucursal'];
$fecha_apertura=$_POST['fecha_apertura'];

$insertar="INSERT INTO cuentabancaria (numero_cuenta,id_persona, tipo_cuenta, saldo, banco, sucursal, fecha_apertura) 
VALUES ('$numero_cuenta','$id_persona','$tipo_cuenta','$saldo','$banco','$sucursal','$fecha_apertura')";

$ejecutar=sqlsrv_query($conn, $insertar);
if($ejecutar){
    echo "<h3>Insertado Correctamente</h3>";
}
else{
    die(print_r(sqlsrv_errors(),true));
}

echo "<br><br>";
echo "<a href='introcuentaeje2.php'><button>Ingresa otra Personas</button></a>";
?>
