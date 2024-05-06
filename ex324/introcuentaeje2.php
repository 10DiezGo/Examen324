<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestión de Cuentas</title>
    <link rel="stylesheet" href="styles3.css">
    <style>
        /* Estilo adicional para centrar contenido horizontalmente */
        .center {
            text-align: center;
        }
    </style>
</head>
<body>
    <section class="form-container">
        <h2 class="center">Agregar Cuenta</h2>
        <form method="POST" action="datoscuentaeje2.php">
            <div class="form-group">
                <label for="numero_cuenta">Numero de Cuenta:</label>
                <input type="text" name="numero_cuenta" required>
            </div>
            <div class="form-group">
                <label for="id_persona">CI Persona:</label>
                <select name="id_persona" required>
                    <?php
                    include('conexion.php');
                    $query = "SELECT ci FROM persona";
                    $result = sqlsrv_query($conn, $query);
                    if ($result) {
                        while ($row = sqlsrv_fetch_array($result)) {
                            echo "<option value='" . $row['ci'] . "'>" . $row['ci'] . "</option>";
                        }
                    }
                    ?>
                </select>
            </div>
            <div class="form-group">
                <label for="tipo_cuenta">Tipo de Cuenta:</label>
                <select name="tipo_cuenta" required>
                    <option value="Corriente">Corriente</option>
                    <option value="Ahorros">Ahorros</option>
                    <option value="Inversion">Inversión</option>
                    <option value="Plazo Fijo">Plazo Fijo</option>
                </select>
            </div>
            <div class="form-group">
                <label for="saldo">Saldo:</label>
                <input type="text" name="saldo" required>
            </div>
            <div class="form-group">
                <label for="banco">Banco:</label>
                <input type="text" name="banco" required>
            </div>
            <div class="form-group">
                <label for="sucursal">Sucursal:</label>
                <input type="text" name="sucursal" required>
            </div>
            <div class="form-group">
                <label for="fecha_apertura">Fecha de Apertura:</label>
                <input type="date" name="fecha_apertura" required>
            </div>
            <div class="form-group center">
                <input type="submit" name="Enviar" value="Enviar">
                <input type="reset" name="Reset" value="Limpiar">
            </div>
        </form>
    </section>

    <section class="button-list center">
        <a href="consultacuentaeje2.php" class="button"><button>Cancelar</button></a>
    </section>
</body>
</html>
