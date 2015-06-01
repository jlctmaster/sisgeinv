<?php
require_once("class_bd.php");
class modulo {
	private $nid_modulo; 
	private $cnombre;
	private $cicono; 
	private $norden;
	private $nestatus; 
	private $mysql; 
	 
	public function __construct(){
		$this->nid_modulo=null;
		$this->cnombre=null;
		$this->cicono=null;
		$this->norden=null;
		$this->mysql=new Conexion();
	}
   
 	public function __destruct(){}

	public function Transaccion($value){
		if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
		if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
		if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
	}

    public function nid_modulo(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->nid_modulo;

		if($Num_Parametro>0){
			$this->nid_modulo=func_get_arg(0);
		}
    }

    public function cnombre(){
    	$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cnombre;
     
		if($Num_Parametro>0){
	   		$this->cnombre=func_get_arg(0);
	 	}
    }

    public function cicono(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->cicono;

		if($Num_Parametro>0){
			$this->cicono=func_get_arg(0);
		}
    }

    public function norden(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->norden;

		if($Num_Parametro>0){
			$this->norden=func_get_arg(0);
		}
    }

    public function nestatus(){
		$Num_Parametro=func_num_args();
		if($Num_Parametro==0) return $this->nestatus;

		if($Num_Parametro>0){
			$this->nestatus=func_get_arg(0);
		}
    }
   
   	public function Registrar($user){
	    $sql="INSERT INTO tmodulo (cnombre,cicono,norden) VALUES 
	    ('$this->cnombre','$this->cicono',$this->norden);";
	    if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
   	}
   
    public function Activar($user){
	    $sql="UPDATE tmodulo SET nestatus = 1 WHERE nid_modulo=$this->nid_modulo";
	    if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
   	}

    public function Desactivar($user){
    	$sqlx="SELECT * FROM tmodulo m WHERE m.nid_modulo = $this->nid_modulo 
    	AND (EXISTS (SELECT 1 FROM tservicio s WHERE m.nid_modulo = s.nid_modulo))";
		$query=$this->mysql->Ejecutar($sqlx);
	    if($this->mysql->Total_Filas($query)==0){
	    	$sql="UPDATE tmodulo SET nestatus = 0 WHERE nid_modulo=$this->nid_modulo";
		    if($this->mysql->Ejecutar($sql)!=null)
				return true;
			else
				return false;
		}
		else
			return false;
   	}
   
    public function Actualizar($user){
	    $sql="UPDATE tmodulo SET cnombre='$this->cnombre',cicono='$this->cicono',norden=$this->norden 
	    WHERE nid_modulo='$this->nid_modulo'";
	    if($this->mysql->Ejecutar($sql)!=null)
			return true;
		else
			return false;
   	}

	public function Comprobar($comprobar){
	    if($comprobar==true){
		    $sql="SELECT * FROM tmodulo WHERE cnombre='$this->cnombre'";
			$query=$this->mysql->Ejecutar($sql);
		    if($this->mysql->Total_Filas($query)!=0){
				$tmodulo=$this->mysql->Respuesta($query);
				$this->nestatus($tmodulo['nestatus']);
				return true;
			}
			else{
				return false;
			}
	    }else
	      return false;
   	}
}
?>
