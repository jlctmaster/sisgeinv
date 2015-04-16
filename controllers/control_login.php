<?php
session_start();
include("../class/class_usuario.php");
$preguntas=null;
$respuestas=null;
$Usuario=new Usuario();
$Usuario->cnombre_usuario(trim($_POST['usuario']));
$Usuario->ccontrasena(trim($_POST['contrasena']));
$res=$Usuario->Buscar();
if($res!=null){
   if($res[0]['estado']==4){
      $_SESSION['datos']['mensaje']="Usuario bloqueado, contacte al administrador!";
      header("Location: ../../#intranet");
   }else{
      $_SESSION['user_name']=$res[0]['name'];
      $_SESSION['fullname_user']=$res[0]['fullname_user'];
      $_SESSION['user_cedula']=$res[0]['cedula'];
      $_SESSION['user_password']=$res[0]['ccontrasena'];
      $_SESSION['user_perfil']=$res[0]['perfil'];
      $_SESSION['user_nid_perfil']=$res[0]['nid_perfil'];
      $_SESSION['user_caducidad']=$res[0]['caducidad'];
      $_SESSION['user_diasaviso']=$res[0]['ndias_aviso'];
      $_SESSION['user_preguntas']=$res[0]['nnumero_preguntas'];
      $_SESSION['user_respuestas']=$res[0]['nnumero_preguntasaresponder'];
      $_SESSION['user_estado']=$res[0]['estado'];
      for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
         $preguntas[]=$res[$i]['cpreguntas'];
         $respuestas[]=$res[$i]['crespuestas'];
      }
      $_SESSION['user_pregunta']=$preguntas;
      $_SESSION['user_respuesta']=$respuestas;
      $Usuario->Intento_Fallido(false);
      header("Location: ../view/menu_principal.php");
   }
}else{
   $Usuario->Intento_Fallido(true);
   $Usuario->Bloquear_Usuario();
   $_SESSION['datos']['mensaje']="Usuario/Clave incorrecto!";
   header("Location: ../admin.php#intranet");
}
?>