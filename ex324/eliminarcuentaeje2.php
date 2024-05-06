<?php
include('conexion.php');
if(isset($_GET['borrar'])){
    $eliminar_numero_cuenta=$_GET['borrar'];
    $borrar="DELETE FROM cuentabancaria WHERE numero_cuenta='$eliminar_numero_cuenta'";
    $ejecutar=sqlsrv_query($conn,$borrar);
    if($ejecutar){
        echo "Registro Eliminado";
    }
    else{
        die(print_r(sqlsrv_errors(),true));
    }
}


echo "<br><br>";
echo "<a href='consultacuentaeje2.php'><button>VOLVER</button></a>";
?>
