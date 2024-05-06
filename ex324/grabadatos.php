<?php
$numero_cuenta = $_POST['numero_cuenta'];
$id_persona = $_POST['id_persona'];
$tipo_cuenta = $_POST['tipo_cuenta'];
$saldo = $_POST['saldo'];
$banco = $_POST['banco'];
$sucursal = $_POST['sucursal'];
$fecha_apertura = $_POST['fecha_apertura'];

include('conexion.php');

$solicitud = "UPDATE cuentabancaria SET numero_cuenta='$numero_cuenta', id_persona='$id_persona',
tipo_cuenta='$tipo_cuenta', saldo='$saldo', banco='$banco', sucursal='$sucursal',
fecha_apertura='$fecha_apertura' WHERE numero_cuenta='$numero_cuenta'"; 

$resultado = sqlsrv_query($conn, $solicitud);

if($resultado === false) {
    die( print_r( sqlsrv_errors(), true));
} else {
    echo "Los datos se actualizaron con éxito";
}

echo "<br><br>";
echo "<a href='consultacuentaeje2.php'><button>CONSULTAR CUENTAS</button></a>";
?>
