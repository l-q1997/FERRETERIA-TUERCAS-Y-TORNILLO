<?php
session_start();
if (!isset($_SESSION['nombre'])) {
    header('Location: login.php');
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ferreteria tuercas y tornillos</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/tema.css">
</head>
<body>
    <center>
        <h1>Bienvenido, ¡<?php echo htmlspecialchars($_SESSION['nombre']); ?>!</h1>
        <p>Has iniciado sesión.</p>
        <p><a href="logout.php">Cerrar sesión</a></p>
    </center>
</body>
</html>