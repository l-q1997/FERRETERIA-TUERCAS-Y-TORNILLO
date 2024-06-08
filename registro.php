<?php
session_start();
include_once 'conexion.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $usuario = $_POST['txtusu'];
    $password = $_POST['txtpass'];
    
    // Check if the username already exists
    $check_query = $conexion->prepare('SELECT ID FROM usuarios WHERE usuario = ?');
    $check_query->execute([$usuario]);
    $existing_user = $check_query->fetchColumn();

    if ($existing_user) {
        $_SESSION['error'] = 'Username already exists';
        header('Location: registro.php');
        exit();
    } else {
        
        $insert_query = $conexion->prepare('INSERT INTO usuarios (usuario, clave) VALUES (?, ?)');
        $insert_query->execute([$usuario, $password]);

        $_SESSION['nombre'] = $usuario;
        $_SESSION['success'] = 'Account created successfully';
        header('Location: index.php');
        exit();
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Registro de Usuario</title>
    <meta charset="utf-8">
</head>
<body>
    <center>
        <?php
        if (isset($_SESSION['error'])) {
            echo '<p style="color: red;">' . $_SESSION['error'] . '</p>';
            unset($_SESSION['error']); 
        }
        ?>
        <form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
            <label>Usuario:</label>
            <input type="text" name="txtusu">
            <br>
            <label>Contraseña:</label>
            <input type="password" name="txtpass">
            <br>
            <input type="submit" value="Registrarse">
        </form>
        <br>
        <p>¿Ya tienes una cuenta? <a href="login.php">Inicia sesión</a></p>
    </center>
</body>
</html>
