<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Cuenta Bancaria</title>
    <link rel="stylesheet" href="styles2.css"> <!-- Enlace a tu archivo de estilos CSS -->
</head>
<body>
    <div class="form-container">
        <?php
        include('conexion.php');
        if(isset($_GET['editar'])){
            $editar_numero_cuenta=$_GET['editar'];
            $consulta="SELECT * FROM cuentabancaria WHERE numero_cuenta='$editar_numero_cuenta'";
            $ejecutar=sqlsrv_query($conn,$consulta);
            if($ejecutar === false) {
                die(print_r(sqlsrv_errors(), true)); // Manejar errores de consulta
            }
            if(sqlsrv_has_rows($ejecutar)) {
                ?>
                <h2 class="center">Editar Cuenta</h2>
                <form method="POST" action="grabadatos.php">
                    <?php 
                    $fila=sqlsrv_fetch_array($ejecutar, SQLSRV_FETCH_ASSOC);
                    ?>
                    <div class="form-group">
                        <label for="numero_cuenta">Numero de Cuenta:</label>
                        <input type="text" name="numero_cuenta" value="<?php echo $fila['numero_cuenta']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="id_persona">C.I. Persona:</label>
                        <input type="text" name="id_persona" value="<?php echo $fila['id_persona']; ?>" readonly>
                    </div>
                    <div class="form-group">
                        <label for="tipo_cuenta">Tipo de Cuenta:</label>
                        <select name="tipo_cuenta">
                            <option value="Corriente" <?php if($fila['tipo_cuenta'] == 'Corriente') echo 'selected'; ?>>Corriente</option>
                            <option value="Ahorros" <?php if($fila['tipo_cuenta'] == 'Ahorros') echo 'selected'; ?>>Ahorros</option>
                            <option value="Inversion" <?php if($fila['tipo_cuenta'] == 'Inversion') echo 'selected'; ?>>Inversión</option>
                            <option value="Plazo Fijo" <?php if($fila['tipo_cuenta'] == 'Plazo Fijo') echo 'selected'; ?>>Plazo Fijo</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="saldo">Saldo:</label>
                        <input type="text" name="saldo" value="<?php echo $fila['saldo']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="banco">Banco:</label>
                        <input type="text" name="banco" value="<?php echo $fila['banco']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="sucursal">Sucursal:</label>
                        <input type="text" name="sucursal" value="<?php echo $fila['sucursal']; ?>">
                    </div>
                    <div class="form-group">
                        <label for="fecha_apertura">Fecha Apertura:</label>
                        <input type="text" name="fecha_apertura" value="<?php echo $fila['fecha_apertura']->format('Y-m-d'); ?>">
                    </div>
                    <div class="form-group">
                    <center>
                        <input type="submit" name="Enviar" value="Actualizar Datos">  
                    </center>
                    </div>
                </form>
                <section class="button-list center">
                    <a href="consultacuentaeje2.php" class="button"><button>Cancelar</button></a>
                </section>  
                <?php
            } else {
                echo "No se encontró ningún registro con ese número de cuenta.";
            }
        }
        ?>
    </div>
</body>
</html>
