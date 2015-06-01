<?php
require_once("conf.php");
require_once("dato_system.php");
/*Esta es la clase que permite  la coneccion con la base de datos*/
class Conexion{
	private $conexion;
	private $clave;
	private $usuario;
	private $servidor;
	private $basedato;
	//Constructor de la clase 
	function __construct(){
		$this->clave=PASSWORD;
		$this->usuario=USER;
		$this->servidor=HOST;
		$this->basedato=BD;
		$this->conexion=mysql_connect($this->servidor,$this->usuario,$this->clave) or die('No pudo conectarse: ' . mysql_error());
		mysql_select_db($this->basedato,$this->conexion) or die('Invalida Selección: ' . mysql_error());
	}
	//Este es para traer la consulta a la base de datos como insertar,modificar  etc...
	public function Ejecutar($sql){
		mysql_query("SET CHARACTER SET utf8"); 	
		$so=getOs();
		$sistema=getBrowser();
		$ip=$_SERVER['REMOTE_ADDR'];
		$nav=$sistema['name'];
		$VARau=mysql_real_escape_string($sql);
		@$sqlAUDITORIA="INSERT INTO tbitacora (nid_bitacora, cdireccion_ip, csistema_operativo, cnavegador, cusuario_bd, cusuario_aplicacion, cquery, dfecha) 
		VALUES (NULL, '$ip', '$so', '$nav', USER(),'$VARau' , CURRENT_TIMESTAMP, '".$_SESSION['user_name']."');";
		$cortar_texto=explode(" ",trim($sql));
		if($query=mysql_query($sql,$this->conexion)){ 
			if(strtoupper($cortar_texto[0])!="SELECT") mysql_query($sqlAUDITORIA); 
			return $query;
		}
		else 
			return null;
	}
	//el siguiente metodo se usa para informacion o los datos que vienen de la base de datos
	public function Respuesta($sql){
		return mysql_fetch_array($sql);
	}
	public function Respuesta_assoc($sql){
		return mysql_fetch_assoc($sql);
	}
	//esta function es para saber cuantas filas trae la consulta.
	public function Total_Filas($query){
		return @mysql_num_rows($query);
	}
	public function Liberar_Resultado($query){
		return mysql_free_result($query);
	}
	public function Incializar_Transaccion(){
		mysql_query("BEGIN",$this->conexion);
	}
	public function Finalizar_Transaccion(){
		mysql_query("COMMIT",$this->conexion);
		$this->Desconectar();
	}
	public function Cancelar_Transaccion(){
		mysql_query("ROLLBACK",$this->conexion);
		$this->Desconectar();
	}
	public function Msg_Error($query){
		return "<b>Un error fatal en MySQL ha ocurrido</b>. </br>Query: \"" . $query . "\"</br>Error: (" . mysql_errno() . ") " . mysql_error();
	}
	//una vez terminar la interaccion con la bd usamos este para cerrar la coneccion    
	private function Desconectar(){ return @mysql_close($this->conexion);} 
}
?>