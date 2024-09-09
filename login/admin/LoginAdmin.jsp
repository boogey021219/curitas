<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="description" content="Login page for Curitas EPS"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../../css/LogU.css">
    <title>Login Curitas EPS</title>
</head>
<body>
    <div class="container mt-5">
        <div id="alert-container"></div> <!-- Contenedor para las alertas -->
        <div class="loginBox text-center">
            <img class="user img-fluid" src="../../IMG/99.jpg" alt="User Image" style="border-radius: 50%; height: 100px; width: 100px;">
            <h3>Inicia sesión acá!</h3>
            <form action="loginEmp.jsp" method="post">
                <div class="inputBox mb-3">
                    <input id="email" type="text" name="email" class="form-control" style="border-radius: 50px;" placeholder="Usuario" required> 
                    <input id="passwd" type="password" name="passwd" class="form-control mt-2" style="border-radius: 50px;" placeholder="Contraseña" required>
                </div> 
                <input type="submit" class="btn btn-primary" value="Login">
            </form> 
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

    <!-- Mostrar alertas en función de los parámetros de la URL -->
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const mensaje = urlParams.get('mensaje');
            let alertDiv = '';

            switch (mensaje) {
                case 'error':
                    alertDiv = '<div class="alert alert-danger" role="alert">Correo o contraseña incorrectos.</div>';
                    break;
                case 'driverError':
                    alertDiv = '<div class="alert alert-danger" role="alert">Error en la carga del driver.</div>';
                    break;
                case 'dbError':
                    alertDiv = '<div class="alert alert-danger" role="alert">Error accediendo a la base de datos.</div>';
                    break;
                case 'emptyFields':
                    alertDiv = '<div class="alert alert-warning" role="alert">Por favor, ingrese su correo y contraseña.</div>';
                    break;
            }

            if (alertDiv) {
                document.getElementById('alert-container').innerHTML = alertDiv;
            }
        };
    </script>
</body>
</html>
