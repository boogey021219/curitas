<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="../css/lodeadentro.css">
<title>CRUD - Citas Laboratorio</title>
</head>
<body>

<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">CRUD Sistema</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="../login/user/inicioUsers.jsp">Inicio</a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Citas Laboratorio
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
          <a class="dropdown-item" href="crear_cita_lab.jsp">Crear Cita Laboratorio</a>
          <a class="dropdown-item" href="listar_citas_lab.jsp">Listar Citas laboratorio</a>
          <a class="dropdown-item" href="actualizar_cita_lab.jsp">Actualizar Citas de laboratorio</a>
          <a class="dropdown-item" href="eliminar_cita_lab.jsp">Eliminar Cita</a>
        </div>
        </ul>
            <span class="navbar-text ml-auto">
                <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
                <%= session.getAttribute("userId") != null ? " | ID: " + session.getAttribute("userId") : "" %>
                 <li class="nav-item">
                    <a class="nav-link" href="../../CuritasEPS/index.html">log out</a>
                </li>
              </span>
              
      </li>
    
  </div>
</nav>

<!-- Sección "Icon Boxes" con SVG -->
  <section class="icon-boxes py-5">
  <div class="container" >
      <div class="row gy-4">
          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-calendar-event-fill" viewBox="0 0 16 16">
                            <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053.918 3.995.78 5.323 1.508 7H.43c-2.128-5.697 4.165-8.83 7.394-5.857q.09.083.176.171a3 3 0 0 1 .176-.17c3.23-2.974 9.522.159 7.394 5.856h-1.078c.728-1.677.59-3.005.108-3.947C13.486.878 10.4.28 8.717 2.01zM2.212 10h1.315C4.593 11.183 6.05 12.458 8 13.795c1.949-1.337 3.407-2.612 4.473-3.795h1.315c-1.265 1.566-3.14 3.25-5.788 5-2.648-1.75-4.523-3.434-5.788-5"/>
                            <path d="M10.464 3.314a.5.5 0 0 0-.945.049L7.921 8.956 6.464 5.314a.5.5 0 0 0-.88-.091L3.732 8H.5a.5.5 0 0 0 0 1H4a.5.5 0 0 0 .416-.223l1.473-2.209 1.647 4.118a.5.5 0 0 0 .945-.049l1.598-5.593 1.457 3.642A.5.5 0 0 0 12 9h3.5a.5.5 0 0 0 0-1h-3.162z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="crear_cita_lab.jsp" class="stretched-link">Crear citas </a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5zM3 12v-2h2v2zm0 1h2v2H4a1 1 0 0 1-1-1zm3 2v-2h3v2zm4 0v-2h3v1a1 1 0 0 1-1 1zm3-3h-3v-2h3zm-7 0v-2h3v2z"/>

                     </svg>
                  </div>
                  <h4 class="title"><a href="listar_citas_lab.jsp" class="stretched-link">ver citas</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                        <path d="M8 9.05a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                        <path d="M1 1a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h.5a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h.5a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H6.707L6 1.293A1 1 0 0 0 5.293 1zm0 1h4.293L6 2.707A1 1 0 0 0 6.707 3H15v10h-.085a1.5 1.5 0 0 0-2.4-.63C11.885 11.223 10.554 10 8 10c-2.555 0-3.886 1.224-4.514 2.37a1.5 1.5 0 0 0-2.4.63H1z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="actualizar_cita_lab.jsp" class="stretched-link">Actualizar citas</a></h4>
              </div>
          </div>
          <!-- End Icon Box -->
      <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">      
              <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                       
                       <path fill-rule="evenodd" d="M6.146 6.146a.5.5 0 0 1 .708 0L8 7.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 8l1.147 1.146a.5.5 0 0 1-.708.708L8 8.707 6.854 9.854a.5.5 0 0 1-.708-.708L7.293 8 6.146 6.854a.5.5 0 0 1 0-.708"/>
                       <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"/>
                       <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="eliminar_cita_lab.jsp" class="stretched-link">Eliminar citas</a></h4>
              </div>
          </div>
          
      </div>
  </div>
</section>
</section>

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
    <div class="carousel-item active">
          <img src="../IMG/8.jpg" alt="">

    </div>
    <div class="carousel-item">
      <img src="../IMG/7.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="../IMG/8.png" alt="">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
  <footer>
    <p> Copyright EPSCurita - All Rights Reserved</p>
    <ul>
      <li><a href="#">yeison eliecer prada reatiga</a></li>
      <li><a href="#">Elkin arley rangel garzon</a></li>
      <li><a href="https://www.uts.edu.co/sitio/">UTS</a></li>
    </ul>
  </footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.1/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script>
  window.onload = function() {
      const urlParams = new URLSearchParams(window.location.search);
      if (urlParams.get('cita') === 'creada') {
          document.getElementById('registroExitoso').classList.remove('d-none');
      }
  };
</script>
</body>
</html>
