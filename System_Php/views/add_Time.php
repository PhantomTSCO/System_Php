<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" type="text/css" href="http://localhost:84/System_Php/Assets/css/bootstrap.min.css">
	<title>Registrar Horas</title>
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
		        <a class="nav-link active" aria-current="page" href="add_Time.php">Agregar Horas</a>
		        <a class="nav-link" href="look_E.php">Buscar Empleados</a>
		        <a class="nav-link" href="totalH.php">Calcular Horas</a>
		        <a class="nav-link" href="totalP.php">Calcular Pagos</a>
		        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Die</a>
		      </div>
		    </div>
		  </div>
		</nav>
	</header>

	<div class="container-lg">
			<p class="text-xl-start"><h1 align="center">Horas Trabajadas</h1></p>
			<form class="mx-5" action="add_Time.php" method="post">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<th>
								<div class="row"><div class="col">Empleado</div></div>
								<div class="row mb-3"><div class="col"><input type="text" class="form-control" name="nombre" placeholder="Nombre" id="nombre"></div></div>
								<div class="row"><div class="col">Apellido</div></div>
								<div class="row mb-3"><div class="col"><input type="text" class="form-control" name="lastN" placeholder="Apellido" id="horas"></div></div>
							</th>
						
							<th>
								<div class="row"><div class="col">Fecha de trabajo</div></div>
								<div class="row mb-3"><div class="col"><input type="date" class="form-control" name="dateA" id="fnac" value="2022-09-13" min="1994-01-01" max="2030-12-31"></div></div>
								<div class="row"><div class="col">Horas Trabajadas</div></div>
								<div class="row mb-3"><div class="col"><input type="text" class="form-control" name="time" placeholder="Total redondeado al entero más bajo" id="horas"></div></div>
							</th>
							<th>

								<button type="submit" class="btn btn-outline-primary mt-5 mx-5" name="AdT">Registrar</button>

								</tr>
						<tr>
							</th>
						</tr>
					</tbody>
			</form>
		</div>
		<?php 
			require_once"../php/conn.php";
			$btnS1='';
			if(isset($_POST['AdT'])){
			
	  		try {
	  			if(empty($_POST['nombre'])){
					$errJob='Por Favor Introduzca un nombre';
					echo $errJob;
				}
				elseif(empty($_POST['lastN'])){
					$errJob='Por Favor Introduzca un apellido';
					echo $errJob;
				}
				elseif(empty($_POST['time'])){
					$errJob='Por Favor Introduzca un genero';
					echo $errJob;
				}else{
					$name=$_POST['nombre'];
					$lasN=$_POST['lastN'];
					$hour=$_POST['time'];
					$date=$_POST['dateA'];
					$res;
	  				if ($hour>=20) {
	  					echo '<script>alert("No se pueden registrar más de 20 horas por día")</script>';
	  				}else{
	  					$res=Conexion::getH($name,$lasN,$hour,$date);
	  				switch ($res) {
	  					case '1':
	  						echo '<script>alert("Registro Exitoso")</script>';
	  						break;
	  					case '-1':
	  						echo '<script>alert("Esa fecha está en el futuro")</script>';
	  						break;
	  					case '-2':
	  						echo '<script>alert("Ya existe un registro para ese empleado en esta fecha")</script>';
	  						break;
	  					
	  					} 
	  				}
	  				
	  				}
	  				
				} catch (Exception $e) {
	  						echo 'Excepción capturada: ',  $e->getMessage(), "\n";
	  						
	  					}
			};

		?>

		<script src="http://localhost:84/System_Php/Assets/js/bootstrap.min.js">
</body>
</html>