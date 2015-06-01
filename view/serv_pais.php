<form class="form-horizontal" id="form1" name="form" action="../controllers/control_pais.php" method="POST">
	<fieldset>
		<!-- Form Name -->
		<legend>País</legend>
		<div class="control-group">
			<label class="control-label" for="nid_pais">Código</label>
			<div class="controls">
				<input id="nid_pais" name="nid_pais" type="text" placeholder="El código del país es generado por el sistema" class="input-xlarge" required="">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="cnombre">País</label>
			<div class="controls">
				<input id="cnombre" name="cnombre" type="text" placeholder="Ingrese el nombre del país" class="input-xlarge" required="">
			</div>
		</div>
	</fieldset>
</form>