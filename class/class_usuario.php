<?php
require_once("class_bd.php");
class Usuario{
	private $cnombre_usuario;
	private $ccontrasena;
	private $crif_persona;
	private $nid_perfil;
	private $error;

	function __construct(){
		$this->mysql=new Conexion();
	}
	public function cnombre_usuario(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cnombre_usuario;

		if($Num_Parametro>0){
			$this->cnombre_usuario=func_get_arg(0);
		}
	}
	public function ccontrasena(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return  $this->ccontrasena;

		if($Num_Parametro>0){
			$this->ccontrasena=sha1(md5(func_get_arg(0)));
		}
	}
	public function crif_persona(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->crif_persona;

		if($Num_Parametro>0){
			$this->crif_persona=func_get_arg(0);
		}
	}
	public function nid_perfil(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->nid_perfil;

		if($Num_Parametro>0){
			$this->nid_perfil=func_get_arg(0);
		}
	}
	public function error(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->error;

		if($Num_Parametro>0){
			$this->error=func_get_arg(0);
		}
	}

	public function Cambiar_Clave(){
		$sqlx="UPDATE tcontrasena SET nestado=0 WHERE cnombre_usuario='$this->cnombre_usuario'";
		if($this->mysql->Ejecutar($sqlx)!=null){
			$sql="INSERT INTO tcontrasena (ccontrasena,cnombre_usuario,nestado) VALUES 
			('$this->ccontrasena','$this->cnombre_usuario',1)";
			if($this->mysql->Ejecutar($sql)!=null)
				return true;
			else{
				$this->error($this->mysql->Msg_Error($sql));
				return false;
			}
		}
		else{
			$this->error($this->mysql->Msg_Error($sqlx));
			return false;
		}
	}

	public function Buscar_ultimas_claves(){
		$ABC=false;
		$sql="SELECT cf.nnumero_ultimasclaves 
		FROM tusuario u 
		INNER JOIN tperfil p ON u.nid_perfil = p.nid_perfil 
		INNER JOIN tconfiguracion cf ON p.nid_configuracion = cf.nid_configuracion 
		WHERE c.cnombre_usuario='$this->cnombre_usuario'";
		$query=$this->mysql->Ejecutar($sql);
		while($a=$this->mysql->Respuesta($query)){
			$uclaves = $a['nnumero_ultimasclaves'];
		}
		$sqlx = "SELECT ccontrasena FROM tcontrasena 
		WHERE cnombre_usuario = '$this->cnombre_usuario'
		ORDER BY dfecha_modificacion DESC 
		LIMIT $uclaves";
		$queryx=$this->mysql->Ejecutar($sqlx);
		while($row=$this->mysql->Respuesta($queryx)){
			if($row['ccontrasena']==$this->ccontrasena)
				$ABC=true;
		}
		return $ABC;  
	}

	public function Actualizar($user,$pold,$pnew,$rnew){
		$con=0;
		$msg_error="";
		if(count($pold) == count($pnew)){
			for($i=0;$i<count($pnew);$i++){
				$sql1="UPDATE tcrespuesta_secreta SET cpregunta = '".$pnew[$i]."',crespuesta =  '".$rnew[$i]."' 
				WHERE cnombre_usuario='$this->cnombre_usuario' AND cpregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else{
					$msg_error.=$this->mysql->Msg_Error($sql1);
					$con--;	
				}
			}
		}
		else if(count($pold) < count($pnew)){
			$prest = count($pnew)-count($pold);
			for($i=0;$i<count($pold);$i++){
				$sql1="UPDATE tcrespuesta_secreta SET cpregunta = '".$pnew[$i]."',crespuesta =  '".$rnew[$i]."' 
				WHERE cnombre_usuario='$this->cnombre_usuario' AND cpregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else{
					$msg_error.=$this->mysql->Msg_Error($sql1);
					$con--;	
				}
			}
			for ($j=$prest-1;$j < count($pnew);$j++) { 
				$sql2="INSERT INTO tcrespuesta_secreta (cnombre_usuario,cpregunta,crespuesta) 
				VALUES ('$this->cnombre_usuario','".$pnew[$j]."','".$rnew[$j]."');";
				if($this->mysql->Ejecutar($sql2))
					$con++;
				else{
					$msg_error.=$this->mysql->Msg_Error($sql2);
					$con--;	
				}
			}
		}
		else{
			$prest = count($pold)-count($pnew);
			for($i=0;$i<count($pnew);$i++){
				$sql1="UPDATE tcrespuesta_secreta SET cpregunta = '".$pnew[$i]."',crespuesta =  '".$rnew[$i]."' 
				WHERE cnombre_usuario='$this->cnombre_usuario' AND cpregunta = '".$pold[$i]."'";
				if($this->mysql->Ejecutar($sql1)!=null)
					$con++;
				else{
					$msg_error.=$this->mysql->Msg_Error($sql1);
					$con--;	
				}
			}
			for ($k=$prest-1;$k < count($pold);$k++) { 
				$sql2="DELETE FROM tcrespuesta_secreta WHERE cnombre_usuario='$this->cnombre_usuario' AND cpregunta='".$pold[$k]."';";
				if($this->mysql->Ejecutar($sql2))
					$con++;
				else{
					$msg_error.=$this->mysql->Msg_Error($sql2);
					$con--;	
				}
			}
		}
		if($con==count($pnew))
			return true;
		else{
			$this->error($msg_error);
			return false;
		}
	}

	public function Registrar($user){
		$sqlx="INSERT INTO tusuario (crif_persona,cnombre_usuario,nid_perfil) VALUES 
		('$this->crif_persona','$this->cnombre_usuario','$this->nid_perfil')";
		if($this->mysql->Ejecutar($sqlx)!=null){
			$this->ccontrasena("12345678");
			$sql="INSERT INTO tcontrasena (nestado,cnombre_usuario,ccontrasena) VALUES 
			(3,'$this->cnombre_usuario','$this->ccontrasena')";
			if($this->mysql->Ejecutar($sql)!=null)
				return true;
			else{
				$this->error($this->mysql->Msg_Error($sql));
				return false;
			}
		}
		else{
			$this->error($this->mysql->Msg_Error($sqlx));
			return false;
		}
	}

	public function Intento_Fallido($bool){
		if($bool==true){
		$sql="UPDATE tusuario SET nintentos_fallidos=(nintentos_fallidos+1) WHERE cnombre_usuario='$this->cnombre_usuario'";
		}else{ 
		$sql="UPDATE tusuario SET nintentos_fallidos=0 WHERE cnombre_usuario='$this->cnombre_usuario'";
		}
		if($this->mysql->Ejecutar($sql)!=null){
			return true;
		}
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return false;
		}
	}

	public function Bloquear_Usuario(){
		$sql="SELECT u.nintentos_fallidos 
		FROM tusuario u 
		INNER JOIN tperfil p ON u.nid_perfil = p.nid_perfil 
		INNER JOIN tconfiguracion c ON p.nid_configuracion = c.nid_configuracion 
		WHERE u.cnombre_usuario='$this->cnombre_usuario' AND u.nintentos_fallidos >= c.nintentos_fallidos";
		$sql_action="UPDATE tcontrasena SET nestado=4 WHERE cnombre_usuario='$this->cnombre_usuario' AND nestado=1";
		$query=$this->mysql->Ejecutar($sql);
		if($this->mysql->Total_Filas($query)>0){
			$query=$this->mysql->Ejecutar($sql_action);
			return true;
		}
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return false;
		}
	}

	public function DesbloquearUsuario($user){
		$sql="UPDATE tcontrasena SET nestado=1 WHERE cnombre_usuario='$this->cnombre_usuario' AND nestado = 4";
		if($this->mysql->Ejecutar($sql)!=null){
			return true;
		}
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return false;
		}
	}

	public function Buscar(){
		$sql="SELECT pas.nestado AS estado,
		p.cnombre AS fullname_user, 
		(CASE WHEN (NOW() - INTERVAL conf.ndias_vigenciaclave DAY) < pas.dfecha_modificacion THEN '0' ELSE '1' END) AS caducidad,    
		UPPER(pf.cnombre) AS perfil,pf.nid_perfil, 
		u.cnombre_usuario AS name, pas.ccontrasena, 
		u.crif_persona AS cedula,
		rs.cpregunta AS cpreguntas,
		rs.crespuesta AS crespuestas,
		conf.ndias_aviso,
		conf.nnumero_preguntas,
		conf.nnumero_preguntasaresponder 
		FROM tpersona AS p 
		INNER JOIN tusuario AS u ON u.crif_persona = p.crif_persona
		INNER JOIN tperfil AS pf ON pf.nid_perfil = u.nid_perfil 
		INNER JOIN tconfiguracion AS conf ON pf.nid_configuracion = conf.nid_configuracion 
		INNER JOIN tcontrasena AS pas ON pas.cnombre_usuario=u.cnombre_usuario
		LEFT JOIN trespuesta_secreta AS rs ON u.cnombre_usuario = rs.cnombre_usuario 
		WHERE u.cnombre_usuario='$this->cnombre_usuario' AND pas.ccontrasena='$this->ccontrasena' 
		AND pas.nestado<>0 AND u.nestatus = 1 
		ORDER BY pas.dfecha_modificacion DESC";
		$query=$this->mysql->Ejecutar($sql);
		while($Obj[]=$this->mysql->Respuesta_assoc($query))
			$rows=$Obj;
		if(!empty($rows))
			return $rows;
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return null;
		}
	}

	public function Generar_NombreUsuario($cedula,$perfil){
		$sql="SELECT CONCAT(SUBSTRING(cnombre,1,5),'$cedula') nombreusuario FROM tperfil WHERE nid_perfil = '$perfil'";
		$query = $this->mysql->Ejecutar($sql);
		if($Obj=$this->mysql->Respuesta($query)){
			return $Obj['nombreusuario'];
		}
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return false;
		}
	}

	public function Buscar_1(){
		$sql="SELECT UPPER(p.cnombre) AS fullname_user, 
		u.nid_perfil,
		UPPER(pf.cnombre) AS perfil, 
		u.cnombre_usuario AS name,
		c.ccontrasena AS password,
		u.crif_persona as crif_persona,
		rs.cpregunta as cpreguntas,
		rs.crespuesta as crespuestas,
		c.nestado as estado_clave,
		conf.nnumero_preguntas,
		conf.nnumero_preguntasaresponder 
		FROM tpersona AS p 
		INNER JOIN tusuario AS u ON u.crif_persona = p.crif_persona
		INNER JOIN tcontrasena c ON u.cnombre_usuario = c.cnombre_usuario AND c.nestado <> 0
		INNER JOIN tperfil AS pf ON pf.nid_perfil = u.nid_perfil 
		INNER JOIN tconfiguracion AS conf ON pf.nid_configuracion = conf.nid_configuracion 
		LEFT JOIN trespuesta_secreta rs ON u.cnombre_usuario = rs.cnombre_usuario 
		WHERE u.cnombre_usuario='$this->cnombre_usuario' and u.nestatus = '1'
		ORDER BY RAND()";
		$query=$this->mysql->Ejecutar($sql);
		while($Obj[]=$this->mysql->Respuesta_assoc($query))
			$rows=$Obj;
		if(!empty($rows))
			return $rows;
		else{
			$this->error($this->mysql->Msg_Error($sql));
			return null;
		}
	}

	public function CompletarDatos($user,$pnew,$rnew){
		$con=0;
		$msg_error="";
		for($i=0;$i<count($pnew);$i++){
			$sql1="INSERT INTO tcrespuesta_secreta (cnombre_usuario,cpregunta,crespuesta,creado_por,fecha_creacion)
			VALUES ('$this->cnombre_usuario','".$pnew[$i]."','".$rnew[$i]."','$user',NOW())";
			if($this->mysql->Ejecutar($sql1)!=null)
				$con++;
			else{
				$msg_error.=$this->mysql->Msg_Error($sql);
				$con--;
			}
		}
		if($con==count($pnew))
			return true;
		else{
			$this->error($msg_error);
			return false;
		}
	}
}
?>