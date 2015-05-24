<?php
  require_once("class_bd.php");
  class Perfil {
  private $nid_perfil; 
  private $nid_configuracion; 
  private $curl; 
  private $nid_servicio; 
  private $nid_modulo; 
  private $nid_opcion; 
  private $cnombre; 
  private $nestatus; 
  private $error; 
  private $mysql; 

  public function __construct(){
    $this->cnombre=null;
    $this->nid_perfil=null;
    $this->nid_configuracion=null;
    $this->nestatus=null;
    $this->mysql=new Conexion();
  }

  public function __destruct(){}

  public function Transaccion($value){
    if($value=='iniciando') return $this->mysql->Incializar_Transaccion();
    if($value=='cancelado') return $this->mysql->Cancelar_Transaccion();
    if($value=='finalizado') return $this->mysql->Finalizar_Transaccion();
  }

  public function nid_perfil(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nid_perfil;

    if($Num_Parametro>0){
      $this->nid_perfil=func_get_arg(0);
    }
  }

  public function cnombre(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->cnombre;

    if($Num_Parametro>0){
      $this->cnombre=func_get_arg(0);
    }
  }

  public function nid_configuracion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nid_configuracion;

    if($Num_Parametro>0){
      $this->nid_configuracion=func_get_arg(0);
    }
  }

  public function nestatus(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nestatus;

    if($Num_Parametro>0){
      $this->nestatus=func_get_arg(0);
    }
  }

  public function nid_servicio(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nid_servicio;

    if($Num_Parametro>0){
      $this->nid_servicio=func_get_arg(0);
    }
  }

  public function nid_opcion(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nid_opcion;

    if($Num_Parametro>0){
      $this->nid_opcion=func_get_arg(0);
    }
  }

  public function nid_modulo(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->nid_modulo;

    if($Num_Parametro>0){
      $this->nid_modulo=func_get_arg(0);
    }
  }

  public function curl(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->curl;

    if($Num_Parametro>0){
      $this->curl=func_get_arg(0);
    }
  }

  public function error(){
    $Num_Parametro=func_num_args();
    if($Num_Parametro==0) return $this->error;

    if($Num_Parametro>0){
      $this->error=func_get_arg(0);
    }
  }

  public function Registrar(){
    $sql="INSERT INTO tperfil (cnombre,nid_configuracion) VALUES ('$this->cnombre','$this->nid_configuracion');";
    if($this->mysql->Ejecutar($sql)!=null){
      $sqlx="SELECT * FROM tperfil WHERE cnombre = '$this->cnombre'";
      $query=$this->mysql->Ejecutar($sqlx);
      if($this->mysql->Total_Filas($query)!=0){
        $tperfil=$this->mysql->Respuesta($query);
        $this->nid_perfil($tperfil['nid_perfil']);
        return true;
      }
      else{
        $this->error(mysql_error());
        return false;
      }
    }
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function Activar(){
    $sql="UPDATE tperfil SET nestatus = 1 WHERE nid_perfil='$this->nid_perfil';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function Desactivar(){
    $sqlx="SELECT * FROM tperfil p WHERE p.nid_perfil = '$this->nid_perfil' AND 
    (EXISTS (SELECT 1 FROM tdetalle_servicio_perfil_opcion dspo WHERE p.nid_perfil = dspo.nid_perfil) OR 
    EXISTS (SELECT 1 FROM tusuario u WHERE p.nid_perfil = u.nid_perfil))";
    $sql="UPDATE tperfil SET nestatus = 0 WHERE nid_perfil='$this->nid_perfil';";
    $query=$this->mysql->Ejecutar($sqlx);
    if($this->mysql->Total_Filas($query)==0){
      if($this->mysql->Ejecutar($sql)!=null)
        return true;
      else{
        $this->error(mysql_error());
        return false;
      }
    }
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function Actualizar(){
    $sql="UPDATE tperfil SET cnombre='$this->cnombre',nid_configuracion='$this->nid_configuracion' WHERE nid_perfil='$this->nid_perfil';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function ELIMINAR_OPCION_SERVICIO_PERFIL(){
    $sql="DELETE FROM tdetalle_servicio_perfil_opcion WHERE nid_perfil='$this->nid_perfil';";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error(mysql_error());
      return false;
    }
  } 

  public function INSERTAR_OPCION_SERVICIO_PERFIL($modulo,$servicio,$opcion){
    $sql="INSERT INTO tdetalle_servicio_perfil_opcion(nid_perfil,nid_servicio,nid_opcion) VALUES ";
    foreach ($servicio as $keyS => $valueS) {
      if(!empty($opcion[$valueS])){
        foreach ($opcion[$valueS] as $keyO => $valueO) {
          $sql.="('$this->nid_perfil',$valueS,$valueO,'$user',NOW()),";
        }
      }else{
        $sql.="('$this->nid_perfil',$valueS,NULL,'$user',NOW()),";
      }
    }
    $sql=substr($sql,0,-1);
    $sql=$sql.";";
    if($this->mysql->Ejecutar($sql)!=null)
      return true;
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function Consultar_SERVICIOS(){
    if($this->nid_perfil==''){
      $sql="SELECT * FROM tdetalle_servicio_perfil_opcion tsuo 
      INNER JOIN tperfil tper on tper.nid_perfil=tsuo.nid_perfil 
      INNER JOIN tservicio tser on tser.nid_servicio=tsuo.nid_servicio 
      WHERE tser.nid_servicio='$this->nid_servicio' AND tper.nid_perfil IS NULL 
      AND tser.nestatus = 1 AND tper.nestatus = 1";
    }
    else{
      $sql="SELECT * FROM tdetalle_servicio_perfil_opcion tsuo 
      INNER JOIN tperfil tper on tper.nid_perfil=tsuo.nid_perfil 
      INNER JOIN tservicio tser on tser.nid_servicio=tsuo.nid_servicio 
      WHERE tper.nid_perfil='$this->nid_perfil' AND tser.nid_servicio='$this->nid_servicio' 
      AND tser.nestatus = 1 AND tper.nestatus = 1";
    }
    $query=$this->mysql->Ejecutar($sql);
    if(@$this->mysql->Total_Filas($query)!=0){
      return true;
    }
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function Consultar_OPCIONES(){
    if($this->nid_perfil==''){
      $sql="SELECT * FROM tdetalle_servicio_perfil_opcion tsuo 
      INNER JOIN tperfil tper on tper.nid_perfil=tsuo.nid_perfil 
      INNER JOIN tservicio tser on tser.nid_servicio=tsuo.nid_servicio
      INNER JOIN topcion topc on topc.nid_opcion=tsuo.nid_opcion 
      WHERE topc.nid_opcion='$this->nid_opcion' AND tser.nid_servicio='$this->nid_servicio' 
      AND tper.nid_perfil IS NULL AND tser.nestatus = 1 AND tper.nestatus = 1 AND topc.nestatus = 1";
    }else{
      $sql="SELECT * FROM tdetalle_servicio_perfil_opcion tsuo 
      INNER JOIN tperfil tper on tper.nid_perfil=tsuo.nid_perfil 
      INNER JOIN tservicio tser on tser.nid_servicio=tsuo.nid_servicio
      INNER JOIN topcion topc on topc.nid_opcion=tsuo.nid_opcion 
      WHERE topc.nid_opcion='$this->nid_opcion' AND 
      tper.nid_perfil='$this->nid_perfil' AND tser.nid_servicio='$this->nid_servicio' 
      AND tser.nestatus = 1 AND tper.nestatus = 1 AND topc.nestatus = 1";
    }
    $query=$this->mysql->Ejecutar($sql);
    if(@$this->mysql->Total_Filas($query)!=0){
      return true;
    }
    else{
      $this->error(mysql_error());
      return false;
    }
  }

  public function IMPRIMIR_MODULOS(){
    $sql="SELECT DISTINCT tmod.nid_modulo, INITCAP(tmod.cnombre) AS nombre_modulo,tmod.cicono AS icono,tmod.norden AS orden
    FROM tmodulo tmod 
    INNER JOIN tservicio tserv ON tmod.nid_modulo = tserv.nid_modulo 
    INNER JOIN tdetalle_servicio_perfil_opcion tdspo ON tserv.nid_servicio = tdspo.nid_servicio 
    WHERE tdspo.nid_perfil = '$this->nid_perfil'
    ORDER BY tmod.norden ASC";
    $x=array();
    $i=0;
    $query=$this->mysql->Ejecutar($sql);
    while($a=$this->mysql->Respuesta($query)){
      $x[$i]['nombre_modulo']=$a['nombre_modulo'];
      $x[$i]['nid_modulo']=$a['nid_modulo'];
      $x[$i]['icono']=$a['icono'];
      $x[$i]['orden']=$a['orden'];
      $i++;     
    }
    return $x;
  }  

  public function IMPRIMIR_SERVICIOS(){
    $sql="SELECT DISTINCT tserv.nid_servicio, INITCAP(tserv.cnombre) AS nombre_servicio, LOWER(tserv.curl) AS url, tserv.norden AS orden
    FROM tservicio tserv 
    INNER JOIN tdetalle_servicio_perfil_opcion tdspo ON tserv.nid_servicio = tdspo.nid_servicio 
    WHERE tdspo.nid_perfil = '$this->nid_perfil' and tserv.nid_modulo = $this->nid_modulo 
    ORDER BY tserv.norden ASC";
    $x=array();
    $i=0;
    $query=$this->mysql->Ejecutar($sql);
    while($a=$this->mysql->Respuesta($query)){
      $x[$i]['nombre_servicio']=$a['nombre_servicio'];
      $x[$i]['nid_servicio']=$a['nid_servicio'];
      $x[$i]['url']=$a['url'];
      $i++;     
    }
    return $x;     
  }

  public function IMPRIMIR_OPCIONES(){
    $sql="SELECT DISTINCT INITCAP(top.cnombre) AS nombre_opcion,top.norden AS orden,top.cicono AS icono,
    CASE WHEN top.nestatus = 1 THEN 'Activo' ELSE 'Desactivado' END nestatus
    FROM topcion top 
    INNER JOIN tdetalle_servicio_perfil_opcion tdspo ON top.nid_opcion = tdspo.nid_opcion 
    INNER JOIN tservicio tserv ON tdspo.nid_servicio = tserv.nid_servicio 
    WHERE tdspo.nid_perfil = '$this->nid_perfil' AND lower(tserv.curl) = '$this->curl' 
    ORDER BY top.norden ASC";
    $x=array();
    $i=0;
    $query=$this->mysql->Ejecutar($sql);
    while($a=$this->mysql->Respuesta($query)){
      $x[$i]['nombre_opcion']=$a['nombre_opcion'];
      $x[$i]['orden']=$a['orden'];
      $x[$i]['icono']=$a['icono'];
      $x[$i]['nestatus']=$a['nestatus'];
      $i++;     
    }
    return $x;
  }

  public function Comprobar($comprobar){
    if($comprobar==true){
      $sql="SELECT * FROM tperfil WHERE cnombre='$this->cnombre'";
      $query=$this->mysql->Ejecutar($sql);
      if($this->mysql->Total_Filas($query)!=0){
        $tperfil=$this->mysql->Respuesta($query);
        $this->nestatus($tperfil['nestatus']);
        return true;
      }
      else{
        $this->error(mysql_error());
        return false;
      }
    }
    else{
      $this->error(mysql_error());
      return false;
    }
  }
}
?>