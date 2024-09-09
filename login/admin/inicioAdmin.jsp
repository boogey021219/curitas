<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="../../css/lodeadentro.css">
<title>Administraicion</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">EPS Curitas</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link" href="inicioAdmin.jsp">Inicio</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Medicos
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/medicos/crear_medico.jsp">Registrar Medico</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/medicos/updateMedico.jsp">Modificar Medico</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/medicos/eliminar_medico.jsp">Eliminar Medico</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/medicos/listarMedicos.jsp">Ver Medicos</a>
              </div>
              
              </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/updateUser.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/eliminar_users.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="../../crudAdmins/adminUsers/listUsers.jsp">Ver Usuarios</a>
              </div>
              
              </li>
              </ul>
                  <span class="navbar-text ml-auto">
                      <%= session.getAttribute("adminEmail") != null ? "Bienvenido, " + session.getAttribute("adminEmail") : "Bienvenido, Invitado" %>
                      <%= session.getAttribute("adminId") != null ? " | ID: " + session.getAttribute("adminId") : "" %>
                       <li class="nav-item">
                          <a class="nav-link" href="../../index.html">log out</a>
                      </li>
                    </span>
                    
            
          
        </div>
      </nav>


      <section class="icon-boxes py-5">
  <div class="container">
      <div class="row gy-4">
          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-calendar-event-fill" viewBox="0 0 16 16">
                           <path d="M7.5 5.5a.5.5 0 0 0-1 0v.634l-.549-.317a.5.5 0 1 0-.5.866L6 7l-.549.317a.5.5 0 1 0 .5.866l.549-.317V8.5a.5.5 0 1 0 1 0v-.634l.549.317a.5.5 0 1 0 .5-.866L8 7l.549-.317a.5.5 0 1 0-.5-.866l-.549.317zm-2 4.5a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h5a.5.5 0 0 0 0-1z"/>
                           <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="../../crudAdmins/adminUsers/medicos/indexMedicos.jsp" class="stretched-link">Administrar Medicos</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                             <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m.256 7a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382zM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"/>
                      </svg>
                  </div>
                  <h4 class="title"><a href="../../crudAdmins/adminUsers/indexUserAdmin.jsp" class="stretched-link">Administrar Usuarios</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v.634l.549-.317a.5.5 0 1 1 .5.866L9 6l.549.317a.5.5 0 1 1-.5.866L8.5 6.866V7.5a.5.5 0 0 1-1 0v-.634l-.549.317a.5.5 0 1 1-.5-.866L7 6l-.549-.317a.5.5 0 0 1 .5-.866l.549.317V4.5A.5.5 0 0 1 8 4M5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5"/>
                          <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"/>
                          <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="../../crudAdmins/adminUsers/medicos/listarMedicos.jsp" class="stretched-link">Ver Medicos</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                       <div class="icon mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                          <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
                    </svg>
                </div>
                <h4 class="title"><a href="../../crudAdmins/adminUsers/listUsers.jsp" class="stretched-link">Ver Usuarios</a></h4>
            </div>
        </div><!-- End Icon Box -->
      </div>
  </div>
</section>

      <section class="icon-boxes py-5">
  <div class="container">
      <div class="row gy-4">
          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-calendar-event-fill" viewBox="0 0 16 16">
                           <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"/>
                            <path d="M7 5.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 1 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0M7 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m-1.496-.854a.5.5 0 0 1 0 .708l-1.5 1.5a.5.5 0 0 1-.708 0l-.5-.5a.5.5 0 0 1 .708-.708l.146.147 1.146-1.147a.5.5 0 0 1 .708 0"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="../../crudAdmins/adminUsers/listCitas.jsp" class="stretched-link">Citas Medicas</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                      <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2z"/>
                      <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8m0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0M4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0m0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="../../crudAdmins/vercitas/listarlab.jsp" class="stretched-link">Citas Laboratorio</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                         <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                           <path d="M4.355.522a.5.5 0 0 1 .623.333l.291.956A5 5 0 0 1 8 1c1.007 0 1.946.298 2.731.811l.29-.956a.5.5 0 1 1 .957.29l-.41 1.352A5 5 0 0 1 13 6h.5a.5.5 0 0 0 .5-.5V5a.5.5 0 0 1 1 0v.5A1.5 1.5 0 0 1 13.5 7H13v1h1.5a.5.5 0 0 1 0 1H13v1h.5a1.5 1.5 0 0 1 1.5 1.5v.5a.5.5 0 1 1-1 0v-.5a.5.5 0 0 0-.5-.5H13a5 5 0 0 1-10 0h-.5a.5.5 0 0 0-.5.5v.5a.5.5 0 1 1-1 0v-.5A1.5 1.5 0 0 1 2.5 10H3V9H1.5a.5.5 0 0 1 0-1H3V7h-.5A1.5 1.5 0 0 1 1 5.5V5a.5.5 0 0 1 1 0v.5a.5.5 0 0 0 .5.5H3c0-1.364.547-2.601 1.432-3.503l-.41-1.352a.5.5 0 0 1 .333-.623M4 7v4a4 4 0 0 0 3.5 3.97V7zm4.5 0v7.97A4 4 0 0 0 12 11V7zM12 6a4 4 0 0 0-1.334-2.982A3.98 3.98 0 0 0 8 2a3.98 3.98 0 0 0-2.667 1.018A4 4 0 0 0 4 6z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="#" class="stretched-link">N/A</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
  <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                       <div class="icon mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                     <path d="M4.355.522a.5.5 0 0 1 .623.333l.291.956A5 5 0 0 1 8 1c1.007 0 1.946.298 2.731.811l.29-.956a.5.5 0 1 1 .957.29l-.41 1.352A5 5 0 0 1 13 6h.5a.5.5 0 0 0 .5-.5V5a.5.5 0 0 1 1 0v.5A1.5 1.5 0 0 1 13.5 7H13v1h1.5a.5.5 0 0 1 0 1H13v1h.5a1.5 1.5 0 0 1 1.5 1.5v.5a.5.5 0 1 1-1 0v-.5a.5.5 0 0 0-.5-.5H13a5 5 0 0 1-10 0h-.5a.5.5 0 0 0-.5.5v.5a.5.5 0 1 1-1 0v-.5A1.5 1.5 0 0 1 2.5 10H3V9H1.5a.5.5 0 0 1 0-1H3V7h-.5A1.5 1.5 0 0 1 1 5.5V5a.5.5 0 0 1 1 0v.5a.5.5 0 0 0 .5.5H3c0-1.364.547-2.601 1.432-3.503l-.41-1.352a.5.5 0 0 1 .333-.623M4 7v4a4 4 0 0 0 3.5 3.97V7zm4.5 0v7.97A4 4 0 0 0 12 11V7zM12 6a4 4 0 0 0-1.334-2.982A3.98 3.98 0 0 0 8 2a3.98 3.98 0 0 0-2.667 1.018A4 4 0 0 0 4 6z"/>
                    </svg>
                </div>
                <h4 class="title"><a href="#" class="stretched-link">N/A</a></h4>
            </div>
        </div><!-- End Icon Box -->
      </div>
  </div>
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
      <img src="../../IMG/1.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="../../IMG/2.jpg" alt="">
    </div>
    <div class="carousel-item">
      <img src="../../IMG/3.jpg" alt="">
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
</body>
</html>