<div?php
session_start();
if (isset($_SESSION['nombre'])) {
    header('Location: index.php');
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/fontawesome-all.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/tema.css">
</head>

<body>
<div class="form-body">
<div class="website-logo">
            <a href="login.html">
                <div class="logo">
                    <img class="logo-size" src="images/tuercas.png" alt="">
                </div>
            </a>
        </div>
        <div class="row">
        <div class="img-holder">
                <div class="bg"></div>
                <div class="info-holder">

                </div>
            </div>
            <div class="form-holder">
            <div class="form-content">
            <div class="form-items">
            <h3>Bienvenido a ferreteria tuercas y tornillos</h3>
            <p>Acceso a todas las herramientas de construcción de alta calidad y potentes del mercado.</p>
            <div class="page-links">
                            <a href="login.html" class="active">Login</a><a href="registrar.html">Registro</a>
                        </div>
        <center>
        <?php
        if (isset($_SESSION['error'])) {
            echo '<p style="color: red;">' . $_SESSION['error'] . '</p>';
            unset($_SESSION['error']); 
        }
        ?>
       <form  method="post" action="loginproceso.php">
            
            <input type="text" name="txtusu" placeholder="Correo electrónico">
            
            <input type="password" name="txtpass" placeholder="Contraseña">

            <div class="form-button">
              <input type="submit" class="ibtn"  value="Inicar sesión">
            </div>
        </form>
        
        <div class="other-links">
        <p>¿No tienes una cuenta? <a href="registro.php">Registrare ahora</a></p>
        </div>
    </center>
    </div>
    </div>
    </div>
    </div>
</div>
</body>
</html>
