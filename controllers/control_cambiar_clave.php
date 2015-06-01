<?php
session_start(); 
include("../class/class_usuario.php");
if(isset($_POST['cambiar_clave_con_logeo']) and $_POST['cambiar_clave_con_logeo']==0 and isset($_POST['lOpt']) and $_POST['lOpt']=='Modificar'){
  if(!(isset($_SESSION['user_name']) and isset($_SESSION['user_password']) and $_SESSION['user_perfil']))
    header("Location: controllers/control_desconectar.php");
  else if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']="¡Las contraseñas no coeciden!";
    header("Location: ../view/menu_principal.php?cambiarcontrasena");
  }else if(strlen($_POST['nueva_contrasena'])< $_POST['nlongitud_minclave']){
    $_SESSION['datos']['mensaje']="¡La contraseña debe tener mínimo ".$_POST['nlongitud_minclave']." caracteres!";
    header("Location: ../view/menu_principal.php?cambiarcontrasena");
  }else if($_POST['nueva_contrasena']==$_POST['confirmar_contrasena']){
    $Usuario=new Usuario();
    $Usuario->cnombre_usuario($_SESSION['user_name']);
    $Usuario->ccontrasena($_POST['nueva_contrasena']);    
    if($Usuario->Buscar_ultimas_claves()==false){
      if($Usuario->Cambiar_Clave($_SESSION['user_name'])){
        $_SESSION['datos']['mensaje']="¡Tu contraseña ha sido cambiada con éxito!";
        $_SESSION['user_password']=sha1(md5($_POST['nueva_contrasena']));
        header("Location: ../view/menu_principal.php?cambiarcontrasena");
      }
      else{
        $_SESSION['datos']['mensaje']="¡Ocurrió un error al cambiar tu contraseña!";
        header("Location: ../view/menu_principal.php?cambiarcontrasena");
      }
    }else{
      $_SESSION['datos']['mensaje']="¡Esta contraseña ha sido usado anteriormente, usa una contraseña nueva!";
      header("Location: ../view/menu_principal.php?cambiarcontrasena");
    }
  }else{
    header("Location: ../view/menu_principal.php?cambiarcontrasena");
  }
}

if(isset($_POST['lOpt']) and $_POST['lOpt']=='Registrar'){
  $Usuario=new Usuario();
  $crif_persona=explode('_',trim($_POST['crif_persona']));
  $Usuario->crif_persona($crif_persona[0]);
  $Usuario->nid_perfil(trim($_POST['nid_perfil']));
  $Usuario->cnombre_usuario($Usuario->Generar_NombreUsuario($crif_persona[0],trim($_POST['nid_perfil'])));
  $Usuario->crif_persona($crif_persona[0]);
  if(!$Usuario->Registrar($_SESSION['user_name'])){
    $_SESSION['datos']['mensaje']="¡Lo sentimos, el usuario no se ha podido registrar, intenta más tarde!";
    header("Location: ../view/menu_principal.php?nuevousuario");
  }else{
    $_SESSION['datos']['mensaje']="¡El usuario se ha creado con éxito!";
    header("Location: ../view/menu_principal.php?nuevousuario");
  }
  header("Location: ../view/menu_principal.php?nuevousuario");
}

if(isset($_POST['lOpt']) and $_POST['lOpt']=='Modificar'){
  $Usuario=new Usuario();
  if($_SESSION['user_estado']<>3){
    $Usuario->cnombre_usuario(trim($_POST['cnombre_usuario']));
    if($Usuario->Actualizar($_SESSION['user_name'],$_SESSION['user_pregunta'],$_POST['pregunta'],$_POST['respuesta'])){
      $res=$Usuario->Buscar_1();
      if($res!=null){
        for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
           $preguntas[]=$res[$i]['cpreguntas'];
           $respuestas[]=$res[$i]['crespuestas'];
        }
        unset($_SESSION['user_pregunta']);
        unset($_SESSION['user_respuesta']);
        $_SESSION['user_pregunta']=$preguntas;
        $_SESSION['user_respuesta']=$respuestas;
        $_SESSION['datos']['mensaje']="¡Se han realizado los cambios exitosamente!";
        $_SESSION['user_estado']=1;
        header("Location: ../view/menu_principal.php?perfil");
      }
      else{
        $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!".$Usuario->error();
        header("Location: ../view/menu_principal.php?perfil");
      }
    }else{
      $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!".$Usuario->error();
      header("Location: ../view/menu_principal.php?perfil");
    }
  }
  else{
    $Usuario->cnombre_usuario(trim($_POST['cnombre_usuario']));
    $Usuario->ccontrasena(trim($_POST['nueva_contrasena']));
    if($Usuario->Cambiar_Clave($_SESSION['user_name'])){
      if($Usuario->CompletarDatos($_SESSION['user_name'],$_POST['pregunta'],$_POST['respuesta'])){
        $Usuario->cnombre_usuario($_POST['cnombre_usuario']);
        $res=$Usuario->Buscar();
        if($res!=null){
          for($i=0;$i<$res[0]['nnumero_preguntas'];$i++){
             $preguntas[]=$res[$i]['cpreguntas'];
             $respuestas[]=$res[$i]['crespuestas'];
          }
          unset($_SESSION['user_pregunta']);
          unset($_SESSION['user_respuesta']);
          $_SESSION['user_pregunta']=$preguntas;
          $_SESSION['user_respuesta']=$respuestas;
        }
        $_SESSION['datos']['mensaje']="¡Se han realizado los cambios exitosamente!";
        $_SESSION['user_estado']=1;
        header("Location: ../view/menu_principal.php");
      }else{
        $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!";
        header("Location: ../view/menu_principal.php");
      }
    }else{
      $_SESSION['datos']['mensaje']="¡Ocurrió un error al actualizar los datos, intenta más tarde!";
      header("Location: ../view/menu_principal.php");
    }
  }
}

if(isset($_POST['cambiar_clave_sin_logeo'])){	
  if($_POST['nueva_contrasena']!=$_POST['confirmar_contrasena']){
    $_SESSION['datos']['mensaje']="Las contraseñas no coeciden!";
    header("Location: ../admin.php?p=cambiar-contrasena");
  }else if($_POST['nueva_contrasena']==$_POST['confirmar_contrasena']){
    $Usuario=new Usuario();
    $Usuario->cnombre_usuario($_SESSION['user_name']);
    $Usuario->ccontrasena($_POST['nueva_contrasena']);
    if($Usuario->Buscar_ultimas_claves()==false){
      if($Usuario->Cambiar_Clave($_SESSION['user_name'])){
        $_SESSION['datos']['mensaje']="¡Tu contraseña ha sido cambiada exitosamente!";
        $_SESSION['user_password']=sha1(md5($_POST['nueva_contrasena']));
        header("Location: ../admin.php");
      }
      else{
        $_SESSION['datos']['mensaje']="¡Ocurrió un error al cambiar tu contraseña!";
        header("Location: ../admin.php");
      }
    }else{
      $_SESSION['ambiente']=$ambiente;
      $_SESSION['pregunta_respuesta']=4;
      $_SESSION['datos']['mensaje']="¡Esta contraseña ha sido usado anteriormente, usa una contraseña nueva!";
      header("Location: ../admin.php?p=cambiar-contrasena");
    }
  }else{
    header("Location: ../admin.php");
  }
}	
?>