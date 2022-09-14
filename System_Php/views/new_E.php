<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="http://localhost:84/System_Php/Assets/css/bootstrap.min.css">
	<title>Nuevo Empleado</title>
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
		        <a class="nav-link active" aria-current="page" href="new_E.php">Agregar Empleados</a>
		        <a class="nav-link" href="add_Time.php">Agregar Horas</a>
		        <a class="nav-link" href="look_E.php">Buscar Empleados</a>
		        <a class="nav-link" href="totalH.php">Calcular Horas</a>
		        <a class="nav-link" href="totalP.php">Calcular Pagos</a>
		        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Die</a>
		      </div>
		    </div>
		  </div>
		</nav>
	</header>
	<h1 align="center">Registrar Nuevo Empleado</h1>
	<div class="container-lg">
			
			<form class="mx-5" action="New_E.php" method="post">
				<div class="row g-1 justify-content-md-center">
					<div class="col mx-2">Nombre(s)</div>
					<div class="col mx-2">Apellidos</div>
				</div>
				<div class="row g-1 mb-3 justify-content-md-center">
					<div class="col mx-2">
				    	<input type="text" name="nombre" id="Job"  class="form-control" placeholder="Nombre" aria-label="Job" aria-describedby="button-addon2">
				    	
				  	</div>
				  	<div class="col mx-2">
				    	<input type="text" name="apellido" id="Job"  class="form-control" placeholder="Apellido" aria-label="Job" aria-describedby="button-addon2">
				  	</div>
				</div>
				<div class="row g-1 justify-content-md-center">
					<div class="col mx-2">Genero</div>
					<div class="col mx-2">Puesto</div>
				</div>
				<div class="row g-1 mb-3 justify-content-md-center">
					<div class="col mx-2">
				    	<input type="text" name="genero" id="genero"  class="form-control" placeholder="Genero" aria-label="Job" aria-describedby="button-addon2">
				  	</div>
				  	<div class="col mx-2">
				    	<input type="text" name="puesto" id="Job"  class="form-control" placeholder="Puesto/Trabajo" aria-label="Job" aria-describedby="button-addon2">
				  	</div>
				</div>
				<div class="row g-1  justify-content-md-center">
					<div class="col mx-2">Edad</div>
					<div class="col mx-2">Fecha de nacimiento</div>
				</div>
				<div class="row g-1 mb-3 justify-content-md-center">
					<div class="col mx-2">
				    	<input type="text" name="age" id="genero"  class="form-control" placeholder="Edad" aria-label="Job" aria-describedby="button-addon2">
				  	</div>
				  	<div class="col mx-2">
				    	<input type="date" class="form-control" id="fnac"  name="dia" value="2022-09-13" min="1994-01-01" max="2030-12-31">
				  	</div>
				</div>
				
				</div>
				<button type="submit" class="btn btn-outline-primary mb-3" name="Reg" >Registrar</button>
			</form>
		</div>

		<?php 
			require_once"../php/conn.php";
			$btnS1='';
			if(isset($_POST['Reg'])){
			
	  					try {
	  							if(empty($_POST['nombre'])){
					$errJob='Por Favor Introduzca un nombre';
					echo $errJob;
				}
				elseif(empty($_POST['apellido'])){
					$errJob='Por Favor Introduzca un apellido';
					echo $errJob;
				}
				elseif(empty($_POST['genero'])){
					$errJob='Por Favor Introduzca un genero';
					echo $errJob;
				}
				elseif(empty($_POST['puesto'])){
					$errJob='Por Favor Introduzca un puesto';
					echo $errJob;
				}
				elseif(empty($_POST['age'])){
					$errJob='Por Favor Introduzca una edad';
					echo $errJob;
				}else{
					$name=$_POST['nombre'];
					$lasN=$_POST['apellido'];
					$gen=$_POST['genero'];
					$job=$_POST['puesto'];
					$age=$_POST['age'];
					$date=$_POST['dia'];
					$res;
	  				

	  				$res=Conexion::newE($name,$lasN,$job,$gen,$age,$date);
	  				switch ($res) {
	  					case '1':
	  						echo '<script>alert("Registro Exitoso")</script>';
	  						break;
	  					case '0':
	  						echo '<script>alert("El Nombre del empleado ya está registrado")</script>';
	  						break;
	  					case '-1':
	  						echo '<script>alert("El empleado es menor de edad")</script>';
	  						break;
	  					case '-2':
	  						echo '<script>alert("El trabajo especificado no existe")</script>';
	  						break;
	  					case '-3':
	  						echo '<script>alert("El genero del empleado no existe")</script>';
	  						break;



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