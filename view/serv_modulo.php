<script type="text/javascript" src="../js/serv_modulo.js"></script>
<?php
require_once("../class/class_perfil.php");
$perfil=new Perfil();
$perfil->nid_perfil($_SESSION['user_nid_perfil']);
$perfil->curl('modulo');
$a=$perfil->IMPRIMIR_OPCIONES(); // el arreglo $a contiene las opciones del menú. 
if(!isset($_GET['Opt'])){ // Ventana principal -> Paginación
	require_once('../class/class_bd.php'); 
	$pgsql=new Conexion();
	$sql = "SELECT * FROM tmodulo";
	$consulta = $pgsql->Ejecutar($sql);
	?>
	<div class="container">
	<fieldset>
		<legend>Módulo</legend>
		<table cellpadding="0" cellspacing="5" border="0" class="bordered-table zebra-striped" id="registro">
			<thead>
				<tr>
					<th>Código:</th>
					<th>Módulo:</th>
					<th>Orden:</th>
					<?php
					for($x=0;$x<count($a);$x++){
						if($a[$x]['orden']=='2' || $a[$x]['orden']=='5')
							echo '<th>'.$a[$x]['nombre_opcion'].'</th>';
					}
					?>
				</tr>
			</thead>
			<tbody>
				<?php
				while ($filas = $pgsql->Respuesta($consulta))
				{
					echo '<tr>';
					echo '<td>'.$filas['nid_modulo'].'</td>';
					echo '<td>'.$filas['cnombre'].'</td>';
					echo '<td>'.$filas['norden'].'</td>';
					for($x=0;$x<count($a);$x++){
				if($a[$x]['orden']=='2') //Actualizar, Modificar o Alterar el valor del Registro
				echo '<td><a href="?modulo&Opt=3&nid_modulo='.$filas['nid_modulo'].'" style="border:0px;"><i class="'.$a[$x]['icono'].'"></i></a></td>';
				else if($a[$x]['orden']=='5') //Imprimir o Ver el Registro
				echo '<td><a href="?modulo&Opt=4&nid_modulo='.$filas['nid_modulo'].'" style="border:0px;"><i class="'.$a[$x]['icono'].'"></i></a></td>';
			}
			echo "</tr>";
		}
		?>
		<tbody>
		</table>
		<center>
			<?php
			for($x=0;$x<count($a);$x++)
				if($a[$x]['orden']=='1')
					echo '<a href="?modulo&Opt=2"><button type="button" class="btn btn-large btn-success"><i class='.$a[$x]['icono'].'></i>&nbsp;'.$a[$x]['nombre_opcion'].'</button></a>';
				?>
		</center>
	</fieldset>
	</div>
<?php
} // Fin Ventana Principal
else if($_GET['Opt']=="2"){ // Ventana de Registro
	?>
	<form class="form-horizontal" action="../controllers/control_modulo.php" method="post" id="form1">  
		<fieldset>
			<legend>Módulo</legend>
			<div class="control-group">  
				<label class="control-label" for="nid_modulo">Código:</label>  
				<div class="controls">  
					<input type="hidden" id="lOpt" name="lOpt" value="Registrar">
					<input class="input-xlarge" title="el Código del Módulo es generado por el sistema" name="nid_modulo" id="nid_modulo" type="text" readonly /> 
				</div>  
			</div>   
			<div class="control-group">  
				<label class="control-label" for="cnombre">Módulo:</label>  
				<div class="controls">  
					<input class="input-xlarge" title="Ingrese el nombre del módulo" onKeyUp="this.value=this.value.toUpperCase()" name="cnombre" id="cnombre" type="text" size="50" required />
				</div>  
			</div>   
			<div class="control-group">  
				<label class="control-label" for="orden">Orden:</label>  
				<div class="controls">  
					<input class="input-xlarge" title="Ingrese número por el cual se ordenará el módulo en el menú" onKeyPress="return isNumberKey(event)" maxlength=2 name="norden" id="norden" type="text" size="50" required />
				</div>  
			</div>
			<div class="control-group">  
				<label class="control-label" for="icono">Icono:</label>  
				<div class="controls">
					<label class="radio" for="radios">
						<input name="cicono" id="cicono" type="radio" value="icon-home" title="Seleccionar icono de casa" checked="checked" required/>
						<span class="icon-home" title="Icono de casa"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-list" title="Seleccionar icono de lista" required/>
						<span class="icon-list" title="Icono de lista"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-list-alt" title="Seleccionar icono de lista alternativa" required/>
						<span class="icon-list-alt" title="Icono de lista alternativa"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-cog" title="Seleccionar icono de configuraci&oacute;n" required/>
						<span class="icon-cog" title="Icono de configuraci&oacute;n"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-lock" title="Seleccionar icono de seguridad" required/>
						<span class="icon-lock" title="Icono de seguridad"></span> 
					</label>
				</div>  
			</div>
			<div class="control-group">  
				<p class="help-block"> Los campos resaltados en rojo son obligatorios </p>  
			</div>  
			<div class="form-actions">
				<button type="button" id="btnGuardar" class="btn btn-large btn-success"><i class="icon-hdd"></i>&nbsp;Guardar</button>
				<a href="?modulo"><button type="button" class="btn btn-large btn-success"/><i class="icon-repeat"></i>&nbsp;Volver</button></a>
			</div> 
		</fieldset>  
	</form>
	<?php
} // Ventana de Registro
else if($_GET['Opt']=="3"){ // Ventana de Modificaciones
	require_once('../class/class_bd.php'); 
	$pgsql=new Conexion();
	$sql = "SELECT * FROM tmodulo WHERE nid_modulo =".$_GET['nid_modulo'];
	$query = $pgsql->Ejecutar($sql);
	$row=$pgsql->Respuesta($query);
	?>
	<form class="form-horizontal" action="../controllers/control_modulo.php" method="post" id="form1">  
		<fieldset>
			<legend>Módulo</legend>
			<div class="control-group">  
				<label class="control-label" for="nid_modulo">Código:</label>  
				<div class="controls">
					<input type="hidden" id="lOpt" name="lOpt" value="Modificar">  
					<input class="input-xlarge" title="el Código del Módulo es generado por el sistema" name="nid_modulo" id="nid_modulo" type="text" value="<?=$row['nid_modulo']?>" readonly /> 
				</div>  
			</div>
			<div class="control-group">  
				<label class="control-label" for="cnombre">Módulo:</label>  
				<div class="controls">  
					<input type="hidden" id="oldmodulo" name="oldmodulo" value="<?=$row['cnombre']?>"> 
					<input class="input-xlarge" title="Ingrese el nombre del modulo" onKeyUp="this.value=this.value.toUpperCase()" name="cnombre" id="cnombre" type="text" value="<?=$row['cnombre']?>" required />
				</div>  
			</div>   
			<div class="control-group">  
				<label class="control-label" for="orden">Orden:</label>  
				<div class="controls">  
					<input class="input-xlarge" title="Ingrese número por el cual se ordenará el módulo en el menú" onKeyPress="return isNumberKey(event)" maxlength=2 name="norden" id="norden" type="text" value="<?=$row['norden']?>" required />
				</div>  
			</div>
			<div class="control-group">  
				<label class="control-label" for="icono">Icono:</label>  
				<div class="controls">
					<label class="radio" for="radios">
						<input name="cicono" id="cicono" type="radio" value="icon-home" title="Seleccionar icono de casa" <?php if($row['cicono']=="icon-home"){ echo "checked='checked'"; } ?> required/>
						<span class="icon-home" title="Icono de casa"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-list" title="Seleccionar icono de lista" <?php if($row['cicono']=="icon-list"){ echo "checked='checked'"; } ?> required/>
						<span class="icon-list" title="Icono de lista"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-list-alt" title="Seleccionar icono de lista alternativa" <?php if($row['cicono']=="icon-list-alt"){ echo "checked='checked'"; } ?> required/>
						<span class="icon-list-alt" title="Icono de lista alternativa"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-cog" title="Seleccionar icono de configuraci&oacute;n" <?php if($row['cicono']=="icon-cog"){ echo "checked='checked'"; } ?> required/>
						<span class="icon-cog" title="Icono de configuraci&oacute;n"></span> 
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="cicono" id="cicono" type="radio" value="icon-lock" title="Seleccionar icono de seguridad" <?php if($row['cicono']=="icon-lock"){ echo "checked='checked'"; } ?> required/>
						<span class="icon-lock" title="Icono de seguridad"></span> 
					</label>
				</div>  
			</div>
			<div class="control-group">  
				<?php if($row['nestatus']=='1'){echo "<p id='nestatus' class='Activo'>Activo </p>";}else{echo "<p id='nestatus' class='Desactivado'>Desactivado</p>";} ?>
			</div>  
			<div class="control-group">  
				<p class="help-block"> Los campos resaltados en rojo son obligatorios </p>  
			</div>  
			<div class="form-actions">
				<button type="button" id="btnGuardar" class="btn btn-large btn-success"><i class="icon-hdd"></i>&nbsp;Guardar</button>
				<?php
				for($x=0;$x<count($a);$x++)
					if($a[$x]['orden']=='3'){
						if($row['nestatus']=='1')
							echo '<button type="button" id="btnDesactivar" class="btn btn-large btn-success"><i class="'.$a[$x]['icono'].'"></i>&nbsp;'.$a[$x]['nombre_opcion'].'</button>&nbsp;';
						else
							echo '<button disabled type="button" id="btnDesactivar" class="btn btn-large btn-success"><i class="'.$a[$x]['icono'].'"></i>&nbsp;'.$a[$x]['nombre_opcion'].'</button>&nbsp;';

					}else if($a[$x]['orden']=='4'){
						if($row['nestatus']=='1')
							echo '<button disabled type="button" id="btnActivar" class="btn btn-large btn-success"><i class="'.$a[$x]['icono'].'"></i>&nbsp;'.$a[$x]['nombre_opcion'].'</button>';
						else
							echo '<button type="button" id="btnActivar" class="btn btn-large btn-success"><i class="'.$a[$x]['icono'].'"></i>&nbsp;'.$a[$x]['nombre_opcion'].'</button>';
					}
					?>
				<a href="?modulo"><button type="button" class="btn btn-large btn-success"/><i class="icon-repeat"></i>&nbsp;Volver</button></a>
			</div>
		</fieldset>  
	</form>
<?php
} // Fin Ventana de Modificaciones
else if($_GET['Opt']=="4"){ // Ventana de Impresiones
	require_once('../class/class_bd.php'); 
	$pgsql=new Conexion();
	$sql = "SELECT * FROM tmodulo WHERE nid_modulo =".$_GET['nid_modulo'];
	$query = $pgsql->Ejecutar($sql);
	$row=$pgsql->Respuesta($query);
	?>
	<link rel="STYLESHEET" type="text/css" href="css/print.css" media="print" />
	<fieldset>
		<legend><center>Vista: MÓDULO</center></legend>		
		<div id="paginador" class="enjoy-css">
			<div class="printer">
				<table class="bordered-table zebra-striped" >
					<tr>
						<td>
							<label>Código:</label>
						</td>
						<td>
							<label><?=$row['nid_modulo']?></label>
						</td>
					</tr>
					<tr>
						<td>
							<label>Módulo:</label>
						</td>
						<td>
							<label><?=$row['cnombre']?></label>
						</td>
					</tr>
					<tr>
						<td>
							<label>Orden:</label>
						</td>
						<td>
							<label><?=$row['norden']?></label>
						</td>
					</tr>
					<tr>
						<td>
							<label>Icono:</label>
						</td>
						<td>
							<i class="<?=$row['cicono']?>"></i>
						</td>
					</tr>
				</table>
				<center>
					<button id="btnPrint" type="button" class="btn btn-large btn-success"><i class="icon-print"></i>&nbsp;Imprimir</button>
					<a href="?modulo"><button type="button" class="btn btn-large btn-success"/><i class="icon-repeat"></i>&nbsp;Volver</button></a>
				</center>
			</div>
		</div>
	</fieldset>
	<?php
} // Fin Ventana de Impresiones
?>