<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tipos de Cuentas Bancarias</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="cabeza">
        <h3>Ejercicio 1: Realice un maquetado, con CSS y PHP. Donde muestre al menos tres tipos de cuentas bancarias.</h3>        
    </div>
    <div class="container">
        <h1>Tipos de Cuentas Bancarias</h1>
        <?php
        // Incluimos el archivo de conexión
        include 'conexion.php';

        // Consulta SQL para obtener las cuentas bancarias
        $query = "SELECT * FROM cuentabancaria";
        $result = sqlsrv_query($conn, $query);

        // Iteramos sobre los resultados y mostramos la información de las cuentas bancarias
        while ($row = sqlsrv_fetch_array($result, SQLSRV_FETCH_ASSOC)) {
            echo "<div class='cuenta'>";
            echo "<h2>{$row['tipo_cuenta']}</h2>";
            echo "</div>";
        }

        // Liberamos los recursos
        sqlsrv_free_stmt($result);
        sqlsrv_close($conn);
        ?>
    </div>
</body>
</html>
