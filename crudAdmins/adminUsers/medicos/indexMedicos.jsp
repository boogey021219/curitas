<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="Description" content="Enter your description here"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="../../../css/lodeadentro.css">

<title>medicos</title>
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
            <a class="nav-link" href="../../../login/admin/inicioAdmin.jsp">Inicio</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="solicitudesCitas.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Medicos
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
              <a class="dropdown-item" href="crear_medico.jsp">Crear Medico</a>
              <a class="dropdown-item" href="listarMedicos.jsp">Listar Medicos</a>
              <a class="dropdown-item" href="updateMedico.jsp">Actualizar Medico</a>
              <a class="dropdown-item" href="eliminar_medico.jsp">Eliminar Medico</a>
            </div>
          </li>
           </li>
              <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="indexUserAdmin.jsp" id="navbarDropdownMedico" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Administrar Usuarios
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdownMedico">
                <a class="dropdown-item" href="../newUsers.jsp">Registrar Usuario</a>
                <a class="dropdown-item" href="../updateUser.jsp">Modificar Usuario</a>
                <a class="dropdown-item" href="../eliminar_users.jsp">Eliminar Usuario</a>
                <a class="dropdown-item" href="../listUsers.jsp">Ver Usuarios</a>
              </div>
        </ul>
        <span class="navbar-text ml-auto">
            <%= session.getAttribute("userEmail") != null ? "Bienvenido, " + session.getAttribute("userEmail") : "Bienvenido, Invitado" %>
            <%= session.getAttribute("userId") != null ? " | ID: " + session.getAttribute("userId") : "" %>
            <a class="nav-link" href="../../../index.html">Log Out</a>
        </span>
      </div>
   </nav>


      <section class="icon-boxes py-5">
  <div class="container">
      <div class="row gy-4">
          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                    <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-calendar-event-fill" viewBox="0 0 16 16">
                           <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053.918 3.995.78 5.323 1.508 7H.43c-2.128-5.697 4.165-8.83 7.394-5.857q.09.083.176.171a3 3 0 0 1 .176-.17c3.23-2.974 9.522.159 7.394 5.856h-1.078c.728-1.677.59-3.005.108-3.947C13.486.878 10.4.28 8.717 2.01zM2.212 10h1.315C4.593 11.183 6.05 12.458 8 13.795c1.949-1.337 3.407-2.612 4.473-3.795h1.315c-1.265 1.566-3.14 3.25-5.788 5-2.648-1.75-4.523-3.434-5.788-5"/>
  <path d="M10.464 3.314a.5.5 0 0 0-.945.049L7.921 8.956 6.464 5.314a.5.5 0 0 0-.88-.091L3.732 8H.5a.5.5 0 0 0 0 1H4a.5.5 0 0 0 .416-.223l1.473-2.209 1.647 4.118a.5.5 0 0 0 .945-.049l1.598-5.593 1.457 3.642A.5.5 0 0 0 12 9h3.5a.5.5 0 0 0 0-1h-3.162z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="crear_medico.jsp" class="stretched-link">Registrar Medicos</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                    <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                        <path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
                        <path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
                       <path d="M9.979 5.356a.5.5 0 0 0-.968.04L7.92 10.49l-.94-3.135a.5.5 0 0 0-.926-.08L4.69 10H4.5a.5.5 0 0 0 0 1H5a.5.5 0 0 0 .447-.276l.936-1.873 1.138 3.793a.5.5 0 0 0 .968-.04L9.58 7.51l.94 3.135A.5.5 0 0 0 11 11h.5a.5.5 0 0 0 0-1h-.128z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="updateMedico.jsp" class="stretched-link">Modificar Medicos</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                    <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-badge-fill" viewBox="0 0 16 16">
                         <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m.256 7a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z"/>
                         <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m-.646-4.854.646.647.646-.647a.5.5 0 0 1 .708.708l-.647.646.647.646a.5.5 0 0 1-.708.708l-.646-.647-.646.647a.5.5 0 0 1-.708-.708l.647-.646-.647-.646a.5.5 0 0 1 .708-.708"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="eliminar_medico.jsp" class="stretched-link">Eliminar Medicos</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                          <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
                    </svg>
                </div>
                <h4 class="title"><a href="listarMedicos.jsp" class="stretched-link">Ver Medicos</a></h4>
            </div>
        </div><!-- End Icon Box -->
      </div>
  </div>
</section>

<hr class="my-4">
<section class="icon-boxes py-5">
  <div class="container">
      <div class="row gy-4">
          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                    <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-calendar-event-fill" viewBox="0 0 16 16">
                            <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L2 8.207V13.5A1.5 1.5 0 0 0 3.5 15h9a1.5 1.5 0 0 0 1.5-1.5V8.207l.646.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293zM13 7.207V13.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V7.207l5-5z"/>

                      </svg>
                  </div>
                  <h4 class="title"><a href="../../../login/admin/inicioAdmin.jsp" class="stretched-link">Inicio</a></h4>
              </div>
          </div><!-- End Icon Box -->

          <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                    <div class="icon mb-3">
                      <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-prescription2" viewBox="0 0 16 16">
                             <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m.256 7a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382zM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"/>
                      </svg>
                  </div>
                  <h4 class="title"><a href="../indexUserAdmin.jsp" class="stretched-link">Administrar Usuarios</a></h4>
              </div>
          </div><!-- End Icon Box -->
      <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                          <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
                    </svg>
                </div>
                <h4 class="title"><a href="../listUsers.jsp" class="stretched-link">Ver Usuarios</a></h4>
            </div>
        </div><!-- End Icon Box -->
        <div class="col-xl-3 col-md-6">
 <div style="  box-shadow: 0px 0px 12px grey;  background-color: #ffffff"class="icon-box text-center">                  <div class="icon mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="blue" class="bi bi-person-plus-fill" viewBox="0 0 16 16">
                      <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm11.5 5.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5z"/>

                    </svg>
                </div>
                <h4 class="title"><a href="../../../login/admin/inicioAdmin.jsp" class="stretched-link">Atras</a></h4>
            </div>
        </div><!-- End Icon Box -->
      </div>
  </div>
</section>

<div id="demo" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="../../../IMG/10.jpg" alt="Image 1">
    </div>
    <div class="carousel-item">
      <img src="../../../IMG/11.jpg" alt="Image 2">
    </div>
    <div class="carousel-item">
      <img src="../../../IMG/12.jpg" alt="Image 3">
    </div>
    <div class="carousel-item">
      <img src="../../../IMG/13.jpg" alt="Image 4">
    </div>
    <div class="carousel-item">
      <img src="../../../IMG/14.jpg" alt="Image 5">
    </div>
    <div class="carousel-item">
      <img src="../../../IMG/15.jpg" alt="Image 6">
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