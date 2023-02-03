<?php 
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['nombre']) && !isset($_SESSION['apellidos'])) {
  header("Location: login.html");
}else{

require 'header.php';
 ?>
    


            <div class="content-wrapper">

<section class="content-header">

    <h1>Gestor de Perfil</h1>

</section>

<section class="content">

    <div class="box">
        <div class="box-body">
            <table class="table table-bordered table-hover table-striped">



<div class="panel-body table-responsive" id="listadoregistros">
  <table id="" class="table table-striped table-bordered table-condensed table-hover">

    <thead>
    <th>Opciones</th>
    <th>Usuario</th>
    <th>Contraseña</th>
    <th>Nombre</th>
    <th>Apellido</th>
    <th>Foto</th>
    <th>Área</th>
    <th>Documento</th>
    </thead>
    <tbody> 
    </tbody>
  </table>
</div>

            </tbody>

            </table>
        </div>
    </div>

</content>

</div>



    
<?php 

require 'footer.php';
 ?>
 <script src="scripts/usuario.js"></script>
 <?php 
}

ob_end_flush();
  ?>
