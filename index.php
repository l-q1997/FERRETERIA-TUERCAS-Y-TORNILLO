<?php
session_start();
if (!isset($_SESSION['nombre'])) {
    header('Location: login.php');
    exit(); // Detener la ejecución si la sesión no está iniciada
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ferreteria tuercas y tornillos</title>
    <meta charset="utf-8">
</head>
<body>
    <center>
        <h1>Bienvenido, <?php echo htmlspecialchars($_SESSION['nombre']); ?>!</h1>
        <p>Has iniciado sesión.</p>
        <p><a href="logout.php">Cerrar sesión</a></p>
    </center>
</body>
</html>