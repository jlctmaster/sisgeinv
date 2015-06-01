<?php
session_start();
include_once("../class/class_modulo.php");
$modulo=new modulo();

//  Variables para indicar si hace la comprobación del registro

$comprobar=true;

if(isset($_POST['oldmodulo']))
  $oldmodulo=trim($_POST['oldmodulo']);

//  Fin

if(isset($_POST['lOpt']))
  $lOpt=trim($_POST['lOpt']);

if(isset($_POST['nid_modulo']))
  $nid_modulo=trim($_POST['nid_modulo']);

if(isset($_POST['cnombre']))
  $cnombre=trim($_POST['cnombre']);

if(isset($_POST['cicono']))
  $cicono=trim($_POST['cicono']);

if(isset($_POST['norden']))
  $norden=trim($_POST['norden']);

if($lOpt=='Registrar'){
  $modulo->nid_modulo($nid_modulo);
  $modulo->cnombre($cnombre);
  $modulo->cicono($cicono);
  $modulo->norden($norden);
  if(!$modulo->Comprobar($comprobar)){
    if($modulo->Registrar($_SESSION['user_name']))
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else{
    if($modulo->estatus()==1)
      $confirmacion=0;
    else{
    if($modulo->Activar($_SESSION['user_name']))            
      $confirmacion=1;
    }
  }
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="¡El Módulo ha sido registrado con exito!";
    header("Location: ../view/menu_principal.php?modulo&Opt=2");
  }else{
    $_SESSION['datos']['mensaje']="¡Ocurrió un error al registrar el Módulo!";
    header("Location: ../view/menu_principal.php?modulo&Opt=2");
  }
}

if($lOpt=='Modificar'){
  $modulo->nid_modulo($nid_modulo);
  $modulo->cnombre($cnombre);
  $modulo->cicono($cicono);
  $modulo->norden($norden);
  if($oldmodulo==$cnombre)
    $comprobar=false;
  if(!$modulo->Comprobar($comprobar)){
    if($modulo->Actualizar($_SESSION['user_name']))
      $confirmacion=1;
    else
      $confirmacion=-1;
  }else
    $confirmacion=-1;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="¡El Módulo ha sido modificado con exito!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }else{
    $_SESSION['datos']['mensaje']="¡Ocurrió un error al modificar el Módulo!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }
}

if($lOpt=='Desactivar'){
  $modulo->nid_modulo($nid_modulo);
  if($modulo->Desactivar($_SESSION['user_name']))
    $confirmacion=1;
  else
    $confirmacion=0;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="¡El Módulo ha sido desactivado con exito!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }else{
    $_SESSION['datos']['mensaje']="¡Ocurrió un error al desactivar el Módulo!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }
}

if($lOpt=='Activar'){
  $modulo->nid_modulo($nid_modulo);
  if($modulo->Activar($_SESSION['user_name']))
    $confirmacion=1;
  else
    $confirmacion=0;
  if($confirmacion==1){
    $_SESSION['datos']['mensaje']="¡El Módulo ha sido activado con exito!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }else{
    $_SESSION['datos']['mensaje']="¡Ocurrió un error al activar el Módulo!";
    header("Location: ../view/menu_principal.php?modulo&Opt=3&nid_modulo=".$modulo->nid_modulo());
  }
}   
?>