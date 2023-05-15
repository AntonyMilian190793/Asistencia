<?php
//activamos almacenamiento en el buffer
ob_start();
session_start();
if (!isset($_SESSION['nombre'])) {
  header("Location: login.php");
}else{

 
require 'header.php';
require_once('../modelos/Usuario.php');
  $usuario = new Usuario();
  $rsptan = $usuario->cantidad_usuario();
  $reg=$rsptan->fetch_object();
  $reg->nombre;
?>
    <div class="content-wrapper">
    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="row">
        <div class="col-md-12">
      <div class="box">
<div class="panel-body">

<?php if ($_SESSION['tipousuario']=='Administrador') {
?>


    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
  <div class="small-box bg-green">
    <div class="inner">
      <h4 style="font-size: 40px;">
      <strong>Lista asistencias </strong>
      </h4>
      <p>Módulo</p>
    </div>
    <div class="icon">
      <i class="fa fa-list-ol" aria-hidden="true"></i>
    </div>
    <a href="asistencia.php" class="small-box-footer">Visualizar<i class="fa fa-arrow-circle-right"></i></a>

  </div>
</div>
<?php } ?>
<?php if ($_SESSION['tipousuario']!='Administrador') {
?>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
  <div class="small-box bg-green">
    
    <a href="asistenciau.php" class="small-box-footer">
    <div class="inner">
      <h5 style="font-size: 40px;">
        <strong>Mi lista asistencias </strong>
      </h5>
      <p>Módulo</p>
    </div>
    <div class="icon">
      <i class="fa fa-list" aria-hidden="true"></i>
    </div>&nbsp;
     <div class="small-box-footer">
           <i class="fa"></i>
     </div>

    </a>
  </div>
</div>
<?php } ?>



<?php if ($_SESSION['tipousuario']=='Administrador') {
?>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
  <div class="small-box bg-yellow">
    <div class="inner">
      <h4 style="font-size: 40px;">
        <strong>Empleados:   </strong>
      </h4>
      <p>Total <?php echo $reg->nombre; ?></p>
    </div>
    <div class="icon">
       <i class="fa fa-users" aria-hidden="true"></i>
    </div>
    <a href="usuario.php" class="small-box-footer">Agregar <i class="fa fa-arrow-circle-right"></i></a>
  </div>
</div>
<?php } ?>


<?php if ($_SESSION['tipousuario']=='Administrador') {
?>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
  <div class="small-box bg-blue">
    
    
    <div class="inner">
      <h4 style="font-size: 40px;">
        <strong>Reporte de asistencias </strong>
      </h4>
      <p>Módulo</p>
    </div>
    <div class="icon">
      <i class="fa fa-bars" aria-hidden="true"></i>
    </div>
    <a href="rptasistencia.php" class="small-box-footer">Visualizar <i class="fa fa-arrow-circle-right"></i></a>


    </a>
  </div>
</div>

<?php

  $connect = mysqli_connect("localhost", "root", "", "control");
  $query = "SELECT departamento.nombre as nom, COUNT(*) AS total
  FROM usuarios JOIN
    departamento ON usuarios.iddepartamento = departamento.iddepartamento
    WHERE
    usuarios.estado = 1
    GROUP BY
    departamento.nombre
      ORDER BY total DESC";


  $result = mysqli_query($connect, $query);
  $chart_data = "";

  while($row = mysqli_fetch_array($result)) {

    $chart_data .= "{ nom:'".$row["nom"]."', total:".$row["total"]."}, ";
  }
  $chart_data = substr($chart_data, 0, -2);


?>
&nbsp;
&nbsp;

<section class="card">
					<header class="card-header">
						<strong>Gráficos Estadístico</strong>
					</header>
          &nbsp;
					<div class="card-block">
						<div id="divgrafico" style="height: 250px;"></div>
					</div>
				</section>



    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>   

    <link rel="stylesheet" href="../vistas/morris/morris.css">
    <script src="../vistas/morris/morris.min.js"></script>


    <script>

new Morris.Bar({
      element: 'divgrafico',
      data: [<?php echo $chart_data; ?>],
      xkey: 'nom',
      ykeys: ['total'],
      labels: ['total'],
      hideHover: 'auto',
      barColors: ["#AA0F16"], 
    });

    </script>

    <br>

    <section class="card">
					<header class="card-header">
					</header>
					<div class="card-block">
						<div id="divgrafico2" style="height: 250px;"></div>
					</div>
				</section>

        <script>


<?php

  $connect = mysqli_connect("localhost", "root", "", "control");
  $query2 = "SELECT usuarios.nombre as nom, COUNT(*) as total, asistencia.fecha_hora as horaEntrada
FROM usuarios JOIN
asistencia ON usuarios.codigo_persona = asistencia.codigo_persona
WHERE
usuarios.estado = 1
GROUP BY
usuarios.nombre
ORDER BY total DESC";
      

  $result = mysqli_query($connect, $query2);
  $chart_data = "";

  while($row = mysqli_fetch_array($result)) {

    $chart_data .= "{ nom:'".$row["nom"]."', total:".$row["total"]."}, ";
  }
  $chart_data = substr($chart_data, 0, -2);


?>

new Morris.Bar({
      element: 'divgrafico2',
      data: [<?php echo $chart_data; ?>],
      xkey: 'nom',
      ykeys: ['total'],
      labels: ['total'],
      hideHover: 'auto',
      barColors: ["#0073B7"], 
    });

    </script>



<section class="card">
					<header class="card-header">
					</header>
					<div class="card-block">
						<div id="divgrafico3" style="height: 250px;"></div>
					</div>
				</section>

        <script>


<?php

  $connect = mysqli_connect("localhost", "root", "", "control");
  $query3 = "SELECT  usuarios.nombre as nombre, usuarios.apellidos as apellido, departamento.nombre as area, asistencia.tipo as tipo, DATE(asistencia.fecha_hora)As fecha, TIME(asistencia.fecha_hora) As hora 
  FROM asistencia 
  JOIN usuarios ON usuarios.codigo_persona = asistencia.codigo_persona
  JOIN departamento  ON usuarios.iddepartamento = departamento.iddepartamento 
  WHERE usuarios.estado=1 AND asistencia.tipo ='Entrada' and asistencia.hora BETWEEN '11:00:00' AND '12:30:00'" ;
      

  $result = mysqli_query($connect, $query3);
  $chart_data = "";

  while($row = mysqli_fetch_array($result)) {

    $chart_data .= "{ nombre:'".$row["nombre"]."' ,hora:'".$row["hora"]."'}, "; 

  }
  $chart_data = substr($chart_data, 0, -2);



?>

new Morris.Bar({
      element: 'divgrafico3',
      data: [<?php echo $chart_data; ?>],
      xkey: 'nombre',
      ykeys: ['hora'],
      labels: ['hora'],
      hideHover: 'auto',
      barColors: ["#F39C12"], 
    });

    </script>

        
<?php } ?>
<?php if ($_SESSION['tipousuario']!='Administrador') {
?>
<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
  <div class="small-box bg-aqua">
    
    <a href="rptasistenciau.php" class="small-box-footer">
    <div class="inner">
      <h5 style="font-size: 40px;">
        <strong>Mi reporte de asistencias </strong>
      </h5>
      <p>Módulo</p>
    </div>
    <div class="icon">
      <i class="fa fa-list" aria-hidden="true"></i>
    </div>&nbsp;
     <div class="small-box-footer">
           <i class="fa"></i>
     </div>

    </a>
  </div>
</div>
<?php } ?>
<!--fin centro-->
      </div>
      </div>
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>

<?php
require 'footer.php'; 
}
ob_end_flush();
?>
