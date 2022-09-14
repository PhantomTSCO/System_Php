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
				else{
					$name=$_POST['nombre'];
					$lasN=$_POST['lastN'];
					$date=$_POST['dateA'];
					$date2=$_POST['dateB'];
					$res;
	  				

	  				$res=Conexion::getP($name,$lasN,$date,$date2);
	  				$resT=0;
	  				if ($res>0) {
	  					$resT=$res;
	  				}
	  				switch ($res) {
	  					case '-1':
	  						echo '<script>alert("La fecha de inicio es incorrecta")</script>';
	  						break;
	  					case '-2':
	  						echo '<script>alert("El empleado no existe")</script>';
	  						break;
	  					case '-3':
	  						echo '<script>alert("El empleado no ha trabajado entre estas fechas")</script>';
	  						break;
	  					
	  					} 
	  				}
	  				
				} catch (Exception $e) {
	  						echo 'Excepción capturada: ',  $e->getMessage(), "\n";
	  						
	  					}
			};

		?>

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
		      	<a class="nav-link" href="add_Time.php">Agregar Horas</a>
		        <a class="nav-link" href="look_E.php">Buscar Empleados</a>
		        <a class="nav-link" href="totalH.php">Calcular Horas</a>
		        <a class="nav-link active" aria-current="page" href="totalP.php">Calcular Pagos</a>
		        
		        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Die</a>
		      </div>
		    </div>
		  </div>
		</nav>
	</header>

		<div class="container-lg">
			<p class="text-xl-start"><h1 align="center">Calcular Pago Total</h1></p>
			<form class="mx-5" action="totalP.php" method="post">
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
								<div class="row"><div class="col">Fecha de Inicio</div></div>
								<div class="row mb-3"><div class="col"><input type="date" class="form-control" name="dateA" id="fnac" value="2022-09-13" min="1994-01-01" max="2030-12-31"></div></div>
								<div class="row"><div class="col">Fecha Final</div></div>
								<div class="row mb-3"><div class="col"><input type="date" class="form-control" name="dateB" id="fnac" value="2022-09-13" min="1994-01-01" max="2030-12-31"></div></div>
							</th>
							<th>
								<div class="mx-5 mb-3">
				<label class="mx-2">Pago</br>Total</label>
				<input type="text" id="resultado" class="mx-2" disabled name="resultado" value="<?php echo (isset($resT))?$resT:'';?>" /></div>
			</div>

								<button type="submit" class="btn btn-outline-primary mt-5 mx-5" name="AdT">Calcular</button>

								</tr>
						<tr>
							</th>
						</tr>
					</tbody>
			</form>
		</div>

		
		<script src="http://localhost:84/System_Php/Assets/js/bootstrap.min.js">
</body>
</html>