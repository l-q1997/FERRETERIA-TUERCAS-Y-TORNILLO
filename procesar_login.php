<?php
require_once 'conexion.php'; 


$usuario = $_POST['username'];
$password = $_POST['password'];

$consulta = $conexion->prepare('SELECT * FROM usuarios WHERE usuario = ? AND clave = ?');
$consulta->execute([$usuario, $password]);
$datos = $consulta->fetch(PDO::FETCH_OBJ);

if ($datos === false) {
    $_SESSION['error'] = 'Nombre de usuario o contraseña incorrectos';
    header('Location: login.php');
    exit();
} else {
    $_SESSION['nombre'] = $datos->usuario;
    $_SESSION['id_usuario'] = $datos->ID;
    header('Location: index.php'); 
    exit();
}
?>
