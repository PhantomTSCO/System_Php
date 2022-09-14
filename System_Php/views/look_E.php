<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="http://localhost:84/System_Php/Assets/css/bootstrap.min.css">
	<title>Buscar Empleados</title>
</head>
<body>

	<header>
		 <nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
		  <div class="container-fluid">
		    <a class="navbar-brand" href="index.php">Sistema</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
		      <span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		      <div class="navbar-nav">
		        <a class="nav-link" href="new_E.php">Agregar Empleados</a>
		        <a class="nav-link" href="add_Time.php">Agregar Horas</a>
		        <a class="nav-link active" aria-current="page" href="look_E.php">Buscar Empleados</a>
		        <a class="nav-link" href="totalH.php">Calcular Horas</a>
		        <a class="nav-link" href="totalP.php">Calcular Pagos</a>
		        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Die</a>
		      </div>
		    </div>
		  </div>
		</nav>
	</header>

	<h1 align="center">Buscar Empleados</h1>
	<form action="look_E.php" method="post">

		<div class="input-group mb-3">
		
			<input type="text" name="Job" id="Job"  class="form-control" placeholder="Puesto/Trabajo" aria-label="Job" aria-describedby="button-addon2">
		
			<button class="btn btn-outline-secondary" type="subbmit" name="Search" id="btnS" >Buscar</button>
		
		</div>
	</form>

	<?php
		require_once"../php/conn.php";
		$btnS1='';
		if(isset($_POST['Search'])){
			if(empty($_POST['Job'])){
				$errJob='Por Favor Introduzca un trabajo';
				echo $errJob;
			}else{

				$job=$_POST['Job'];
				$arrayC=array();
  				$arrayC=Conexion::getEJ($job);
  				$help=Conexion::last_Re();
  				if ($help>0) {
  					if(!empty($arrayC)){
  					print_r("<pre>");
  					print_r($arrayC);
  					print_r("</pre>");
  				}
  				}else{
  					echo '<script>alert("No Existe ese trabajo")</script>';
  				}
  				
  				
			}
		};
			

	?>
	<script src="../js_scripts/function.js"></script>
	<script src="http://localhost:84/System_Php/Assets/js/bootstrap.min.js">

</body>
</html>