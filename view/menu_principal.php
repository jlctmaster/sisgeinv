<?php
  session_start();
  $ccc=explode('?',$_SERVER['REQUEST_URI']);
  if (isset($ccc[1]))
    $cccc=explode('&',$ccc[1]);
  if (isset($cccc[0]))  
    $ccccc=explode('=',$cccc[0]);
  if(isset($_SESSION['user_estado'])){
?>
<!DOCTYPE HTML>
<html>
  <head>
    <title>Menu</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <!-- CSS Files -->
    <link rel="stylesheet" type="text/css" href="../external/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../external/bootstrap/css/bootstrap-combined.min.css">
    <link rel="stylesheet" type="text/css" href="../external/bootstrap/css/DT_bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../css/menu.css">
    <link rel="stylesheet" type="text/css" href="../css/styleMenu.css">
    <!-- JS Files -->
    <script src="../external/jquery/jquery.min.js"></script>
    <script src="../external/bootstrap/js/bootstrap.min.js"></script>
    <script src="../external/bootstrap/js/jquery.dataTables.js"></script>
    <script src="../external/bootstrap/js/config_datatable_api.js"></script>
    <!-- Other Files -->
    <script src="../js/main.js"></script>
  </head>
  <body>
  <!-- Header -->
  <?php
    if($_SESSION['user_estado']==1){
      require_once("menu.php");
    }
  ?>
    <!-- Intro -->
    <div id="mainBody">
      <?php 
      if($_SESSION['user_estado']==3){
        $_SESSION['datos']['mensaje']="Completa los datos de seguridad";
        include("serv_usuario.php");
      }elseif($_SESSION['user_estado']==2){
        $_SESSION['datos']['mensaje']="Contraseña caducida";
        echo "<script>location.href='../admin.php?p=olvidar-clave#intranet'</script>";
        exit();
      }elseif($_SESSION['user_caducidad']=='1'){
        $_SESSION['datos']['mensaje']="Debe cambiar la clave cada 6 meses";
        echo "<script>location.href='../admin.php?p=olvidar-clave#intranet'</script>";
        exit();
      }elseif($_SESSION['user_estado']==1){
        //seguridad
        if(isset($_GET['perfil'])) include("serv_usuario.php"); 
        else if(isset($_GET['nuevousuario'])) include("serv_nuevo_usuario.php");
        else if(isset($_GET['cambiarcontrasena'])) include("serv_cambiar_contrasena.php");
        else if(isset($_GET['perfiles'])) include("serv_perfil.php"); 
        else if(isset($_GET['servicio'])) include("serv_servicio.php");
        else if(isset($_GET['configuracion'])) include("serv_configuracion.php");
        else if(isset($_GET['sistema'])) include("serv_sistema.php");
        else if(isset($_GET['desbloquearusuario'])) include("serv_desbloquearusuario.php");
        else if(isset($_GET['modulo'])) include("serv_modulo.php");
        else if(isset($_GET['botones'])) include("serv_opcion.php");
        else if(isset($_GET['bitacora'])) include("serv_bitacora.php");
        //principal
        else include("serv_inicio.php");                                                                                                                                                                                                                                                                                                                                            
      }else{
        echo "<script>location.href='403.php'</script>";
      }
      ?>
    </div>
    <!-- Footer -->
    <div id="footer">
      <!-- Copyright -->
      <div class="copyright">
        <p>&copy; 2015 Eduardo Computación el Dr. de las Computadoras. Todos los derechos reservados.</p>
      </div>
    </div>
  </body>
</html>
<?php
  if(isset($_SESSION['datos']['mensaje']))
    echo "<script>alert('".$_SESSION['datos']['mensaje']."')</script>";
  if(isset($_SESSION['datos']))
    unset($_SESSION['datos']);
  }else{
    echo "<script>location.href='403.php'</script>";
  }
?>