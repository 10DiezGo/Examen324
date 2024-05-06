<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Persona</title>
    <link rel="stylesheet" href="styles1.css">
</head>
<body> 
<div class="cabeza">
        <h3>Ejercicio 2: Realice un ABC en PHP de las personas a cuentas bancarias, debe incluir la selección de la cuenta que la persona desee.</h3>        
    </div>
    <h2>GESTIÓN DE CUENTAS</h2>
    

    <table border='1'>
        <tr>
            <td>N° Cuenta</td>    
            <td>ID</td>
            <td>Tipo Cuenta</td>
            <td>Saldo</td>
            <td>Banco</td>
            <td>Sucursal</td>
            <td>Fecha de Apertura</td>
            <td>Modificar</td>
            <td>Eliminar</td>
        </tr>
        <?php
        include("conexion.php");
        $consulta = "SELECT * FROM cuentabancaria";
        $ejecutar = sqlsrv_query($conn, $consulta);
        while ($fila = sqlsrv_fetch_array($ejecutar)) {
            $numero_cuenta = $fila['numero_cuenta'];
            echo "<tr>";
            echo "<td>" . $fila['numero_cuenta'] . "</td>";
            echo "<td>" . $fila['id_persona'] . "</td>";
            echo "<td>" . $fila['tipo_cuenta'] . "</td>";
            echo "<td>" . $fila['saldo'] . "</td>";
            echo "<td>" . $fila['banco'] ."</td>";
            echo "<td>" . $fila['sucursal'] . "</td>";
            echo "<td>" . $fila['fecha_apertura']->format('Y-m-d') . "</td>";
            echo "<td><a href='editarcuentaeje2.php?editar=$numero_cuenta'><button>Editar</button></a></td>";
            echo "<td><a href='eliminarcuentaeje2.php?borrar=$numero_cuenta'><button>Eliminar</button></a></td>";
            echo "</tr>";
        }
        ?>
    </table>
    <br>
    <center><a href='introcuentaeje2.php'><button>Agregar Cuenta</button></a></center>
</body>
</html>

