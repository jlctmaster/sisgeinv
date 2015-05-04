<?php
//Verificar Inicio de Session.
session_start(); 
if(isset($_POST['user_name']) || isset($_POST['respuesta'])){
   include("../class/class_usuario.php");
   $Usuario=new Usuario();
   $Usuario->cnombre_usuario(trim($_POST['user_name']));
   if($_POST['accion']==1){
      $con=0;
      for($i=0;$i<$_SESSION['user_preguntas_a_responder'];$i++){
         if($_SESSION['user_respuesta'][$i]==$_POST['respuesta'][$i]){
            $con++;
         }else{
            $con--;
         }
      }
      if($con==$_SESSION['user_preguntas_a_responder']){
         $_SESSION['pregunta_respuesta']=4;
         $_SESSION['user_passwd'];
         $_SESSION['user_name'];
         header("Location: ../admin.php?p=cambiar-contrasena");
      }
      else{
         $Usuario->cnombre_usuario($_SESSION['user_name']);
         $res=$Usuario->Buscar_1();
         if($res!=null){
            for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
               $preguntas[]=$res[$i]['cpreguntas'];
               $respuestas[]=$res[$i]['crespuestas'];
            }
            $_SESSION['user_pregunta']=$preguntas;
            $_SESSION['user_respuesta']=$respuestas;
            $_SESSION['datos']['mensaje']="¡La respuesta no coecide con los datos del sistema!";
            $_SESSION['pregunta_respuesta']=$_POST['accion']+1;
            header("Location: ../admin.php?p=pregunta-seguridad");
         }else{
            $_SESSION['datos']['mensaje']="¡Ocurrió un error al realizar la transacción!";
            header("Location: ../admin.php?p=olvidar-clave");
         }
      }
   }else if($_POST['accion']==2){
      $con=0;
      for($i=0;$i<$_SESSION['user_preguntas_a_responder'];$i++){
         if($_SESSION['user_respuesta'][$i]==$_POST['respuesta'][$i]){
            $con++;
         }else{
            $con--;
         }
      }
      if($con==$_SESSION['user_preguntas_a_responder']){
         $_SESSION['pregunta_respuesta']=4;
         $_SESSION['user_passwd'];
         $_SESSION['user_name'];
         header("Location: ../admin.php?p=cambiar-contrasena");
      }
      else{
         $Usuario->cnombre_usuario($_SESSION['user_name']);
         $res=$Usuario->Buscar_1();
         if($res!=null){
            for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
               $preguntas[]=$res[$i]['cpreguntas'];
               $respuestas[]=$res[$i]['crespuestas'];
            }
            $_SESSION['user_pregunta']=$preguntas;
            $_SESSION['user_respuesta']=$respuestas;
            $_SESSION['datos']['mensaje']="¡La respuesta no coecide con los datos del sistema!";
            $_SESSION['pregunta_respuesta']=$_POST['accion']+1;
            header("Location: ../admin.php?p=pregunta-seguridad");
         }else{
            $_SESSION['datos']['mensaje']="¡Ocurrió un error al realizar la transacción!";
            header("Location: ../admin.php?p=olvidar-clave");
         }
      }
   }else if($_POST['accion']==3){
      $con=0;
      for($i=0;$i<$_SESSION['user_preguntas_a_responder'];$i++){
         if($_SESSION['user_respuesta'][$i]==$_POST['respuesta'][$i]){
            $con++;
         }else{
            $con--;
         }
      }
      if($con==$_SESSION['user_preguntas_a_responder']){
         $_SESSION['pregunta_respuesta']=4;
         $_SESSION['user_passwd'];
         $_SESSION['user_name'];
         header("Location: ../admin.php?p=cambiar-contrasena");
      }
      else{
         unset($_SESSION['pregunta_respuesta']);
         $_SESSION['datos']['mensaje']="¡Ud. no es usuario de este sistema!";
         header("Location: ../admin.php?p=olvidar-clave");
      }
   }else{
      $res=$Usuario->Buscar_1();
      $_SESSION['pregunta_respuesta']=0;
      if($res!=null){
         if($res[0]['estado_clave']==4){
            $_SESSION['datos']['mensaje']="¡Usuario bloqueado, contacte al administrador!";
            header("Location: ../admin.php?p=olvidar-clave");
         }
         else{
            $_SESSION['user_name']=$_POST['user_name'];
            $_SESSION['user_passwd']=$res[0]['password'];
            $_SESSION['user_numero_preguntas']=$res[0]['nnumero_preguntas'];
            $_SESSION['user_nid_perfil']=$res[0]['nid_perfil'];
            $_SESSION['user_preguntas_a_responder']=$res[0]['nnumero_preguntasaresponder'];
            for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
               $preguntas[]=$res[$i]['cpreguntas'];
               $respuestas[]=$res[$i]['crespuestas'];
            }
            $_SESSION['user_pregunta']=$preguntas;
            $_SESSION['user_respuesta']=$respuestas;
            $_SESSION['pregunta_respuesta']++;
            header("Location: ../admin.php?p=pregunta-seguridad");
         }
      }else{
         $_SESSION['datos']['mensaje']="¡Usuario incorrecto!";
         header("Location: ../admin.php?p=olvidar-clave");
      }
   }
}
?>