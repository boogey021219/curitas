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

<title>CRUD - Citas Medico General</title>
</head>
<body>

<!-- Barra de navegación -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">EPS Curitas</a>
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
          Citas Medico General
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
          <a class="dropdown-item" href="crear_cita_medico.jsp">Crear Cita</a>
          <a class="dropdown-item" href="listar_citas_medico.jsp">Listar Citas</a>
          <a class="dropdown-item" href="actualizar_cita_medico.jsp">Actualizar Cita</a>
          <a class="dropdown-item" href="eliminar_cita_medico.jsp">Eliminar Cita</a>
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
                           <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
                            <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
                            <path d="M9.979 5.356a.5.5 0 0 0-.968.04L7.92 10.49l-.94-3.135a.5.5 0 0 0-.926-.08L4.69 10H4.5a.5.5 0 0 0 0 1H5a.5.5 0 0 0 .447-.276l.936-1.873 1.138 3.793a.5.5 0 0 0 .968-.04L9.58 7.51l.94 3.135A.5.5 0 0 0 11 11h.5a.5.5 0 0 0 0-1h-.128z"/>
                          
                      </svg>
                  </div>
                  <h4 class="title"><a href="crear_cita_medico.jsp" class="stretched-link">Crear citas</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V9H3V2a1 1 0 0 1 1-1h5.5zM3 12v-2h2v2zm0 1h2v2H4a1 1 0 0 1-1-1zm3 2v-2h3v2zm4 0v-2h3v1a1 1 0 0 1-1 1zm3-3h-3v-2h3zm-7 0v-2h3v2z"/>

                     </svg>
                  </div>
                  <h4 class="title"><a href="listar_citas_medico.jsp" class="stretched-link">ver citas</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                        <path d="M8 9.05a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                        <path d="M1 1a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h.5a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5.5.5 0 0 1 1 0 .5.5 0 0 0 .5.5h.5a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H6.707L6 1.293A1 1 0 0 0 5.293 1zm0 1h4.293L6 2.707A1 1 0 0 0 6.707 3H15v10h-.085a1.5 1.5 0 0 0-2.4-.63C11.885 11.223 10.554 10 8 10c-2.555 0-3.886 1.224-4.514 2.37a1.5 1.5 0 0 0-2.4.63H1z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="actualizar_cita_medico.jsp" class="stretched-link">Actualizar citas</a></h4>
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
                  <h4 class="title"><a href="eliminar_cita_medico.jsp" class="stretched-link">Eliminar citas</a></h4>
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
          <img src="../IMG/6.png" alt="">

    </div>
    <div class="carousel-item">
      <img src="../IMG/4.png" alt="">
    </div>
    <div class="carousel-item">
      <img src="../IMG/5.png" alt="">
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
