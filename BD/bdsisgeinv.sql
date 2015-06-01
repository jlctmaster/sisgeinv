-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 31-05-2015 a las 23:16:39
-- Versión del servidor: 5.5.41-0+wheezy1
-- Versión de PHP: 5.4.39-0+deb7u2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bdsisgeinv`
--

DELIMITER $$
--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `initcap`(cadena VARCHAR(100)) RETURNS varchar(100) CHARSET utf8 COLLATE utf8_spanish_ci
BEGIN 
DECLARE pos INT DEFAULT 0; 
DECLARE tmp VARCHAR(100) 
DEFAULT ''; 
DECLARE result VARCHAR(100) DEFAULT ''; 
REPEAT SET pos = LOCATE(' ', cadena); 
 IF pos = 0 THEN SET pos = CHAR_LENGTH(cadena); 
 END IF; 
 SET tmp = LEFT(cadena,pos); 
 IF CHAR_LENGTH(tmp) < 4 THEN SET result = CONCAT(result, tmp); 
 ELSE SET result = CONCAT(result, UPPER(LEFT(tmp,1)),SUBSTR(tmp,2)); 
 END IF; 
 SET cadena = RIGHT(cadena,CHAR_LENGTH(cadena)-pos); 
UNTIL CHAR_LENGTH(cadena) = 0 END REPEAT; 
RETURN result;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talmacen`
--

CREATE TABLE IF NOT EXISTS `talmacen` (
  `nid_almacen` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla almacén',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_almacen`),
  KEY `fk_almacen_sucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbitacora`
--

CREATE TABLE IF NOT EXISTS `tbitacora` (
  `nid_bitacora` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cdireccion_ip` varchar(15) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la dirección IP del equipo donde se realizó la transacción',
  `csistema_operativo` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el Sistema Operativo del equipo donde se realizó la transacción',
  `cnavegador` varchar(35) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el Navegador Web del equipo donde se realizó la transacción',
  `cusuario_bd` varchar(30) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el Usuario de BD con el que se conectó el equipo donde se realizó la transacción',
  `cusuario_aplicacion` char(15) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el Usuario de la Aplicación con el que se conectó la persona del equipo donde se realizó la transacción',
  `cquery` text COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la instrucción SQL que se ejecutó en la transacción',
  `dfecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Identifica la fecha de la transacción',
  PRIMARY KEY (`nid_bitacora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=38 ;

--
-- Volcado de datos para la tabla `tbitacora`
--

INSERT INTO `tbitacora` (`nid_bitacora`, `cdireccion_ip`, `csistema_operativo`, `cnavegador`, `cusuario_bd`, `cusuario_aplicacion`, `cquery`, `dfecha`) VALUES
(1, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:33:25', '0000-00-00 00:00:00'),
(2, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:33:43', '0000-00-00 00:00:00'),
(3, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tcontras', '2015-05-17 19:33:43', '0000-00-00 00:00:00'),
(4, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:33:57', '0000-00-00 00:00:00'),
(5, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:36:26', '0000-00-00 00:00:00'),
(6, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tcontras', '2015-05-17 19:36:26', '0000-00-00 00:00:00'),
(7, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:38:20', '0000-00-00 00:00:00'),
(8, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tcontras', '2015-05-17 19:38:20', '0000-00-00 00:00:00'),
(9, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:40:40', '0000-00-00 00:00:00'),
(10, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 19:41:58', '0000-00-00 00:00:00'),
(11, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 21:00:51', '0000-00-00 00:00:00'),
(12, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-17 22:45:10', '0000-00-00 00:00:00'),
(13, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 11:46:09', '0000-00-00 00:00:00'),
(14, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 13:15:48', '0000-00-00 00:00:00'),
(15, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 13:47:19', '0000-00-00 00:00:00'),
(16, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 13:49:00', '0000-00-00 00:00:00'),
(17, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 13:53:27', '0000-00-00 00:00:00'),
(18, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 13:54:32', '0000-00-00 00:00:00'),
(19, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 13:55:38', '0000-00-00 00:00:00'),
(20, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 13:56:10', '0000-00-00 00:00:00'),
(21, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 21:57:31', '0000-00-00 00:00:00'),
(22, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 21:57:50', '0000-00-00 00:00:00'),
(23, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 22:08:56', '0000-00-00 00:00:00'),
(24, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 22:09:33', '0000-00-00 00:00:00'),
(25, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 22:15:37', '0000-00-00 00:00:00'),
(26, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 22:16:11', '0000-00-00 00:00:00'),
(27, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE trespues', '2015-05-31 22:19:32', '0000-00-00 00:00:00'),
(28, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 22:20:01', '0000-00-00 00:00:00'),
(29, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 22:22:51', '0000-00-00 00:00:00'),
(30, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tcontras', '2015-05-31 22:25:43', '0000-00-00 00:00:00'),
(31, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'INSERT INTO tco', '2015-05-31 22:25:43', '0000-00-00 00:00:00'),
(32, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 22:26:15', '0000-00-00 00:00:00'),
(33, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tusuario', '2015-05-31 22:26:22', '0000-00-00 00:00:00'),
(34, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'INSERT INTO tmo', '2015-05-31 23:11:25', '0000-00-00 00:00:00'),
(35, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'INSERT INTO tmo', '2015-05-31 23:11:38', '0000-00-00 00:00:00'),
(36, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tmodulo', '2015-05-31 23:14:10', '0000-00-00 00:00:00'),
(37, '::1', 'Linux', 'Google Chrome', 'admin@localhost', 'UPDATE tmodulo', '2015-05-31 23:14:16', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcategoria_producto`
--

CREATE TABLE IF NOT EXISTS `tcategoria_producto` (
  `nid_categoria` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla categoria de producto',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcompania`
--

CREATE TABLE IF NOT EXISTS `tcompania` (
  `crif_compania` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Registro de Información Fiscal de la Compañía',
  `cnombre` varchar(80) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre o Razón Social de la Compañía',
  `cemail` varchar(80) COLLATE latin1_general_ci NOT NULL COMMENT 'Dirección de Correo Electrónico de la Compañía',
  `cclave_email` varchar(100) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Clave de la dirección de correo electrónico',
  `cmision` text COLLATE latin1_general_ci COMMENT 'Misión de la Compañía',
  `cvision` text COLLATE latin1_general_ci COMMENT 'Visión de la Compañía',
  `cobjetivo` text COLLATE latin1_general_ci COMMENT 'Objetivo General y Especificos de la Compañía',
  `chistoria` text COLLATE latin1_general_ci COMMENT 'Historia de la Compañía',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`crif_compania`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `tcompania`
--

INSERT INTO `tcompania` (`crif_compania`, `cnombre`, `cemail`, `cclave_email`, `cmision`, `cvision`, `cobjetivo`, `chistoria`, `nestatus`) VALUES
('J000000000', 'EDUARDO COMPUTACIÓN,"EL DR. DE LAS COMPUTADORAS"', 'EDUARDO_COMPUTACION@GMAIL.COM', NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconfiguracion`
--

CREATE TABLE IF NOT EXISTS `tconfiguracion` (
  `nid_configuracion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(30) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla configuración',
  `cnivel_acceso` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'C' COMMENT 'Identifica el nivel de acceso al sistema si es por Compañía (C), Sucursal (S) o Ambos (A)',
  `nlongitud_minclave` int(11) NOT NULL DEFAULT '6' COMMENT 'Identifica la longitud mínima para la clave del usuario',
  `nlongitud_maxclave` int(11) NOT NULL DEFAULT '10' COMMENT 'Identifica la longitud máxima para la clave del usuario',
  `ncantidad_letrasmayusculas` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de letras mayusculas a usar para la clave del usuario',
  `ncantidad_letrasminusculas` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de letras minusculas a usar para la clave del usuario',
  `ncantidad_caracteresespeciales` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de caracteres especiales a usar para la clave del usuario',
  `ncantidad_numeros` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de números a usar para la clave del usuario',
  `ndias_vigenciaclave` int(11) NOT NULL DEFAULT '365' COMMENT 'Identifica la cantidad de días de vigencia para la clave del usuario',
  `nnumero_ultimasclaves` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de ultimas claves a validar para aceptar la nueva clave del usuario',
  `ndias_aviso` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de días para avisar el vencimiento de la clave del usuario',
  `nintentos_fallidos` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica la cantidad de intentos fallidos que debe hacer un usuario para bloquearlo',
  `nnumero_preguntas` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica el número de preguntas secretas disponibles para recuperar la clave del usuario',
  `nnumero_preguntasaresponder` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica el número de preguntas que se debe responder para poder recuperar la clave del usuario',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_configuracion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tconfiguracion`
--

INSERT INTO `tconfiguracion` (`nid_configuracion`, `cnombre`, `cnivel_acceso`, `nlongitud_minclave`, `nlongitud_maxclave`, `ncantidad_letrasmayusculas`, `ncantidad_letrasminusculas`, `ncantidad_caracteresespeciales`, `ncantidad_numeros`, `ndias_vigenciaclave`, `nnumero_ultimasclaves`, `ndias_aviso`, `nintentos_fallidos`, `nnumero_preguntas`, `nnumero_preguntasaresponder`, `nestatus`) VALUES
(1, 'POR DEFECTO', 'C', 6, 10, 1, 1, 1, 1, 365, 1, 1, 4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tcontrasena`
--

CREATE TABLE IF NOT EXISTS `tcontrasena` (
  `nid_contrasena` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre_usuario` char(17) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla usuario',
  `ccontrasena` varchar(60) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la clave encriptada del usuario',
  `nestado` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica el estado de la clave si la clave ha sido usada (0), si la clave esta activo (1), si la clave ha caducado (2), si la clave es de un usuario nuevo (3) o si el usuario esta bloqueado (4)',
  `dfecha_modificacion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Identifica la fecha de modificación del registro',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_contrasena`),
  KEY `fk_contrasena_usuario` (`cnombre_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tcontrasena`
--

INSERT INTO `tcontrasena` (`nid_contrasena`, `cnombre_usuario`, `ccontrasena`, `nestado`, `dfecha_modificacion`, `nestatus`) VALUES
(1, 'ADMINV00000000', '1f82ea75c5cc526729e2d581aeb3aeccfef4407e', 0, '2015-05-18 00:02:48', 1),
(2, 'ADMINV00000000', '2e5f402b1f0117f9f7217a3e8cbff136b1e304ad', 1, '2015-06-01 02:55:43', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tconversion`
--

CREATE TABLE IF NOT EXISTS `tconversion` (
  `nid_conversion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `nid_umbase` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `nid_umdestino` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `nid_producto` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
  `nfactor_multiplicador` float NOT NULL DEFAULT '0' COMMENT 'Indica el factor multiplicador de la conversión',
  `nfactor_divisor` float NOT NULL DEFAULT '0' COMMENT 'Indica el factor divisor de la conversión',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_conversion`),
  KEY `fk_conversion_umbase` (`nid_umbase`),
  KEY `fk_conversion_umdestino` (`nid_umdestino`),
  KEY `fk_conversion_producto` (`nid_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdetalle_orden`
--

CREATE TABLE IF NOT EXISTS `tdetalle_orden` (
  `nid_detalle_orden` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `nid_orden` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla orden de compra',
  `nid_producto` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
  `nid_um` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `ncantidad` float NOT NULL DEFAULT '0' COMMENT 'Identifica la cantidad solicitada en la orden de compra',
  `nprecio` float NOT NULL DEFAULT '0' COMMENT 'Identifica el precio facturado en la orden de compra',
  `ntotal_linea` float NOT NULL DEFAULT '0' COMMENT 'Identifica el neto de la línea de la orden de compra',
  PRIMARY KEY (`nid_detalle_orden`),
  KEY `fk_detorden_orden` (`nid_orden`),
  KEY `fk_detorden_producto` (`nid_producto`),
  KEY `fk_detorden_um` (`nid_um`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdetalle_recepcion`
--

CREATE TABLE IF NOT EXISTS `tdetalle_recepcion` (
  `nid_detalle_recepcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `nid_recepcion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla recepción',
  `nid_detalle_orden` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla detalle de orden de compra',
  `nid_producto` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
  `nid_um` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `nid_ubicacion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
  `ncantidad` float NOT NULL DEFAULT '0' COMMENT 'Identifica la cantidad a recepcionar de la orden de compra',
  PRIMARY KEY (`nid_detalle_recepcion`),
  KEY `fk_detrecepcion_recepcion` (`nid_recepcion`),
  KEY `fk_detrecepcion_detorden` (`nid_detalle_orden`),
  KEY `fk_detrecepcion_producto` (`nid_producto`),
  KEY `fk_detrecepcion_um` (`nid_um`),
  KEY `fk_detrecepcion_ubicacion` (`nid_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdetalle_recibo`
--

CREATE TABLE IF NOT EXISTS `tdetalle_recibo` (
  `nid_detalle_recibo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `nid_recibo` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla recibo',
  `nid_producto` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
  `nid_um` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `nid_ubicacion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
  `ncantidad` float NOT NULL DEFAULT '0' COMMENT 'Identifica la cantidad utilizada del producto',
  `nprecio` float NOT NULL DEFAULT '0' COMMENT 'Identifica eĺ precio unitario del producto',
  `ntotal_linea` float NOT NULL DEFAULT '0' COMMENT 'Identifica el neto de la línea del recibo',
  PRIMARY KEY (`nid_detalle_recibo`),
  KEY `fk_detrecibo_recibo` (`nid_recibo`),
  KEY `fk_detrecibo_producto` (`nid_producto`),
  KEY `fk_detrecibo_um` (`nid_um`),
  KEY `fk_detrecibo_ubicacion` (`nid_ubicacion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdetalle_servicio_perfil_opcion`
--

CREATE TABLE IF NOT EXISTS `tdetalle_servicio_perfil_opcion` (
  `nid_detalle_serv_perf_opc` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `nid_servicio` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla servicio',
  `nid_perfil` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla perfil',
  `nid_opcion` int(11) DEFAULT NULL COMMENT 'Identificador del registro de la entidad / tabla opción',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_detalle_serv_perf_opc`),
  KEY `fk_det_serv_perf_opc_opcion` (`nid_opcion`),
  KEY `fk_det_serv_perf_opc_servicio` (`nid_servicio`),
  KEY `fk_det_serv_perf_opc_perfil` (`nid_perfil`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=56 ;

--
-- Volcado de datos para la tabla `tdetalle_servicio_perfil_opcion`
--

INSERT INTO `tdetalle_servicio_perfil_opcion` (`nid_detalle_serv_perf_opc`, `nid_servicio`, `nid_perfil`, `nid_opcion`, `nestatus`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 1, 2, 1),
(3, 1, 1, 3, 1),
(4, 1, 1, 4, 1),
(5, 1, 1, 5, 1),
(6, 2, 1, 1, 1),
(7, 2, 1, 2, 1),
(8, 2, 1, 3, 1),
(9, 2, 1, 4, 1),
(10, 2, 1, 5, 1),
(11, 3, 1, 1, 1),
(12, 3, 1, 2, 1),
(13, 3, 1, 3, 1),
(14, 3, 1, 4, 1),
(15, 3, 1, 5, 1),
(16, 4, 1, 1, 1),
(17, 4, 1, 2, 1),
(18, 4, 1, 3, 1),
(19, 4, 1, 4, 1),
(20, 4, 1, 5, 1),
(21, 5, 1, 1, 1),
(22, 5, 1, 2, 1),
(23, 5, 1, 3, 1),
(24, 5, 1, 4, 1),
(25, 5, 1, 5, 1),
(26, 6, 1, 1, 1),
(27, 6, 1, 2, 1),
(28, 6, 1, 3, 1),
(29, 6, 1, 4, 1),
(30, 6, 1, 5, 1),
(31, 7, 1, 1, 1),
(32, 7, 1, 2, 1),
(33, 7, 1, 3, 1),
(34, 7, 1, 4, 1),
(35, 7, 1, 5, 1),
(36, 8, 1, 1, 1),
(37, 8, 1, 2, 1),
(38, 8, 1, 3, 1),
(39, 8, 1, 4, 1),
(40, 8, 1, 5, 1),
(41, 9, 1, 1, 1),
(42, 9, 1, 2, 1),
(43, 9, 1, 3, 1),
(44, 9, 1, 4, 1),
(45, 9, 1, 5, 1),
(46, 10, 1, 1, 1),
(47, 10, 1, 2, 1),
(48, 10, 1, 3, 1),
(49, 10, 1, 4, 1),
(50, 10, 1, 5, 1),
(51, 11, 1, 1, 1),
(52, 11, 1, 2, 1),
(53, 11, 1, 3, 1),
(54, 11, 1, 4, 1),
(55, 11, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tdireccion_persona`
--

CREATE TABLE IF NOT EXISTS `tdireccion_persona` (
  `nid_direccion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cdireccion` varchar(150) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la dirección de ubicación de la persona',
  `ctelefono_habitacion` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Identifica el número telefónico local de la persona',
  `crif_persona` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_localidad` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla parroquia',
  `nid_zona` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla zona',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_direccion`),
  KEY `fk_direccion_persona` (`crif_persona`),
  KEY `fk_direccion_localidad` (`nid_localidad`),
  KEY `fk_direccion_zona` (`nid_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `testado`
--

CREATE TABLE IF NOT EXISTS `testado` (
  `nid_estado` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla estado',
  `nid_pais` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla pais',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_estado`),
  KEY `fk_estado_pais` (`nid_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmarca`
--

CREATE TABLE IF NOT EXISTS `tmarca` (
  `nid_marca` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla marca',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodelo`
--

CREATE TABLE IF NOT EXISTS `tmodelo` (
  `nid_modelo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla modelo',
  `nid_marca` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla marca',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_modelo`),
  KEY `fk_modelo_marca` (`nid_marca`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmodulo`
--

CREATE TABLE IF NOT EXISTS `tmodulo` (
  `nid_modulo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(60) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla módulo',
  `cicono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Identifica la clase del framework Bootstrap o clase css a utilizar para dibujar el módulo',
  `norden` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica el orden a mantener en el menú',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_modulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tmodulo`
--

INSERT INTO `tmodulo` (`nid_modulo`, `cnombre`, `cicono`, `norden`, `nestatus`) VALUES
(1, 'SEGURIDAD', 'icon-lock', 8, 1),
(2, 'LOCALIDADES', 'icon-list', 1, 0),
(3, 'GENERAL', 'icon-list', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmovimiento_inventario`
--

CREATE TABLE IF NOT EXISTS `tmovimiento_inventario` (
  `nid_movinventario` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `ctipo_transaccion` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'E' COMMENT 'Identifica si el tipo de transacción es Entrada (E) o Salida (S)',
  `dfecha_movimiento` date NOT NULL COMMENT 'Identifica la fecha del movimiento',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `nid_producto` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
  `nid_ubicacion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
  `ncantidad_movimiento` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica la cantidad movida del producto',
  `nid_detalle_recepcion` int(11) DEFAULT NULL COMMENT 'Identificador del registro de la entidad / tabla detalle de recepción',
  `nid_detalle_recibo` int(11) DEFAULT NULL COMMENT 'Identificador del registro de la entidad / tabla detalle de recibo',
  PRIMARY KEY (`nid_movinventario`),
  KEY `fk_movinventario_sucursal` (`nid_sucursal`),
  KEY `fk_movinventario_producto` (`nid_producto`),
  KEY `fk_movinventario_ubicacion` (`nid_ubicacion`),
  KEY `fk_movinventario_recepcion` (`nid_detalle_recepcion`),
  KEY `fk_movinventario_recibo` (`nid_detalle_recibo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmunicipio`
--

CREATE TABLE IF NOT EXISTS `tmunicipio` (
  `nid_municipio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla municipio',
  `nid_estado` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla estado',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_municipio`),
  KEY `fk_municipio_estado` (`nid_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `topcion`
--

CREATE TABLE IF NOT EXISTS `topcion` (
  `nid_opcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(45) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla opción',
  `cicono` varchar(255) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Identifica la clase del framework Bootstrap o clase css a utilizar para dibujar la opción',
  `norden` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica el orden a mantener en el menú',
  `naccion` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica la acción dentro de la aplicación que realizará esta opción',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_opcion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `topcion`
--

INSERT INTO `topcion` (`nid_opcion`, `cnombre`, `cicono`, `norden`, `naccion`, `nestatus`) VALUES
(1, 'INSERTAR', 'icon-pencil', 1, 1, 1),
(2, 'ACTUALIZAR', 'icon-edit', 2, 2, 1),
(3, 'DESACTIVAR', 'icon-eye-close', 3, 3, 1),
(4, 'ACTIVAR', 'icon-eye-open', 4, 4, 1),
(5, 'CONSULTAR', 'icon-search', 5, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torden`
--

CREATE TABLE IF NOT EXISTS `torden` (
  `nid_orden` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnro_orden` char(10) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el número de la orden de compra',
  `dfecha` date NOT NULL COMMENT 'Identifica la fecha de la orden de compra',
  `crif_proveedor` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_direccion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla dirección de la persona',
  `crif_solicitante` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `ntotal` float NOT NULL DEFAULT '0' COMMENT 'Identifica el total de la orden de compra',
  `nestatus` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
  PRIMARY KEY (`nid_orden`),
  UNIQUE KEY `uk_orden` (`cnro_orden`),
  KEY `fk_orden_proveedor` (`crif_proveedor`),
  KEY `fk_orden_solicitante` (`crif_solicitante`),
  KEY `fk_orden_direccion` (`nid_direccion`),
  KEY `fk_orden_sucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpais`
--

CREATE TABLE IF NOT EXISTS `tpais` (
  `nid_pais` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(80) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla pais',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_pais`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tparroquia`
--

CREATE TABLE IF NOT EXISTS `tparroquia` (
  `nid_parroquia` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla parroquia',
  `nid_municipio` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla municipio',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_parroquia`),
  KEY `fk_parroquia_municipio` (`nid_municipio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tperfil`
--

CREATE TABLE IF NOT EXISTS `tperfil` (
  `nid_perfil` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(45) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla perfil',
  `nid_configuracion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla configuración',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_perfil`),
  KEY `fk_perfil_configuracion` (`nid_configuracion`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `tperfil`
--

INSERT INTO `tperfil` (`nid_perfil`, `cnombre`, `nid_configuracion`, `nestatus`) VALUES
(1, 'ADMINISTRADOR', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tpersona`
--

CREATE TABLE IF NOT EXISTS `tpersona` (
  `crif_persona` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Registro de Información Fiscal de la Persona',
  `cnombre` varchar(80) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre o Razón Social de la Persona',
  `cemail` varchar(80) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Dirección de Correo Electrónico de la Persona',
  `ctelefono_movil` varchar(11) COLLATE latin1_general_ci DEFAULT NULL COMMENT 'Número del Telefono Celular de la Persona',
  `ctecnico` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Técnico de Area (Y) o no (N)',
  `ccliente` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Cliente (Y) o no (N)',
  `cproveedor` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Proveedor (Y) o no (N)',
  `cvendedor` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Vendedor (Y) o no (N)',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`crif_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `tpersona`
--

INSERT INTO `tpersona` (`crif_persona`, `cnombre`, `cemail`, `ctelefono_movil`, `ctecnico`, `ccliente`, `cproveedor`, `cvendedor`, `nestatus`) VALUES
('V00000000', 'ADMINISTRADOR DEL SISTEMA', NULL, NULL, 'N', 'N', 'N', 'N', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tproducto`
--

CREATE TABLE IF NOT EXISTS `tproducto` (
  `nid_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(60) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla producto',
  `ctipo_producto` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'I' COMMENT 'Identificador del tipo de producto si es Item (I) o Servicio (S)',
  `calmacenado` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto tiene control de inventario (Y) o no (N)',
  `ccomprado` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto es comprado (Y) o no (N)',
  `cvendido` char(1) COLLATE latin1_general_ci NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto es vendido (Y) o no (N)',
  `nid_categoria` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla categoría de producto',
  `nid_um` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
  `nid_modelo` int(11) DEFAULT NULL COMMENT 'Identificador del registro de la entidad / tabla modelo',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_producto`),
  KEY `fk_producto_categoria` (`nid_categoria`),
  KEY `fk_producto_um` (`nid_um`),
  KEY `fk_producto_modelo` (`nid_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trecepcion`
--

CREATE TABLE IF NOT EXISTS `trecepcion` (
  `nid_recepcion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `dfecha` date NOT NULL COMMENT 'Identifica la fecha de la recepción de los productos',
  `nid_orden` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla orden de compra',
  `crif_recepcionista` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `nestatus` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
  PRIMARY KEY (`nid_recepcion`),
  KEY `fk_recepcion_orden` (`nid_orden`),
  KEY `fk_recepcion_recepcionista` (`crif_recepcionista`),
  KEY `fk_recepcion_sucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trecibo`
--

CREATE TABLE IF NOT EXISTS `trecibo` (
  `nid_recibo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnro_factura` char(10) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el número externo de la factura asociada con el recibo',
  `dfecha` date NOT NULL COMMENT 'Identifica la fecha del recibo',
  `cobservacion` text COLLATE latin1_general_ci COMMENT 'Identificador de observación o sugerencia aplicados al recibo',
  `crif_cliente` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_direccion` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla dirección de la persona',
  `crif_vendedor` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `crif_tecnico` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `ntotal` float NOT NULL DEFAULT '0' COMMENT 'Identifica el total del recibo',
  `nestatus` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
  PRIMARY KEY (`nid_recibo`),
  UNIQUE KEY `uk_recibo_factura` (`cnro_factura`),
  KEY `fk_recibo_cliente` (`crif_cliente`),
  KEY `fk_recibo_vendedor` (`crif_vendedor`),
  KEY `fk_recibo_tecnico` (`crif_tecnico`),
  KEY `fk_recibo_direccion` (`nid_direccion`),
  KEY `fk_recibo_sucursal` (`nid_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trespuesta_secreta`
--

CREATE TABLE IF NOT EXISTS `trespuesta_secreta` (
  `nid_respuesta` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre_usuario` char(17) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla usuario',
  `cpregunta` varchar(60) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la pregunta secreta',
  `crespuesta` varchar(60) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la respuesta de la pregunta secreta',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_respuesta`),
  KEY `fk_resp_secret_usuario` (`cnombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tservicio`
--

CREATE TABLE IF NOT EXISTS `tservicio` (
  `nid_servicio` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(45) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla servicio',
  `nid_modulo` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla módulo',
  `curl` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la url con la cual se podrá acceder al servicio',
  `norden` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica el orden a mantener en el menú',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_servicio`),
  KEY `fk_servicio_modulo` (`nid_modulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=12 ;

--
-- Volcado de datos para la tabla `tservicio`
--

INSERT INTO `tservicio` (`nid_servicio`, `cnombre`, `nid_modulo`, `curl`, `norden`, `nestatus`) VALUES
(1, 'COMPAÑÍA', 1, 'COMPANIA', 1, 1),
(2, 'CONFIG. SISTEMA', 1, 'CONFIGURACION', 2, 1),
(3, 'MÓDULO', 1, 'MODULO', 3, 1),
(4, 'SERVICIOS', 1, 'SERVICIO', 4, 1),
(5, 'BOTONERA', 1, 'BOTONES', 5, 1),
(6, 'PERFIL', 1, 'PERFILES', 6, 1),
(7, 'NUEVO USUARIO', 1, 'NUEVOUSUARIO', 7, 1),
(8, 'MÍ PERFIL', 1, 'PERFIL', 8, 1),
(9, 'CAMBIAR CONTRASEÑA', 1, 'CAMBIARCONTRASENA', 9, 1),
(10, 'DESBLOQUEAR USUARIO', 1, 'DESBLOQUEARUSUARIO', 10, 1),
(11, 'HISTÓRICO DE CAMBIOS', 1, 'BITACORA', 11, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tsucursal`
--

CREATE TABLE IF NOT EXISTS `tsucursal` (
  `nid_sucursal` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla sucursal',
  `cdireccion` varchar(120) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica la dirección de ubicación de la sucursal',
  `ctelefono_habitacion` varchar(11) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el número telefónico de la sucursal',
  `crif_compania` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla compañía',
  `nid_localidad` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla parroquia',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_sucursal`),
  KEY `fk_sucursal_compania` (`crif_compania`),
  KEY `fk_sucursal_localidad` (`nid_localidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tubicacion`
--

CREATE TABLE IF NOT EXISTS `tubicacion` (
  `nid_ubicacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla ubicación',
  `nid_almacen` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla almacén',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_ubicacion`),
  KEY `fk_ubicacion_almacen` (`nid_almacen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tunidad_medida`
--

CREATE TABLE IF NOT EXISTS `tunidad_medida` (
  `nid_um` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnid_iso` char(5) COLLATE latin1_general_ci NOT NULL COMMENT 'Código ISO para las Unidades de Medidas',
  `cnombre` varchar(50) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla unidad de medida',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_um`),
  UNIQUE KEY `uk_iso_code` (`cnid_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuario`
--

CREATE TABLE IF NOT EXISTS `tusuario` (
  `cnombre_usuario` char(17) COLLATE latin1_general_ci NOT NULL COMMENT 'Identifica el nombre del usuario con el cual podrá ingresar al sistema',
  `crif_persona` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nid_perfil` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla perfil',
  `nintentos_fallidos` int(11) NOT NULL DEFAULT '0' COMMENT 'Identifica el contador de intentos fallidos al sistema para comprobar si se debe bloquear o no según la configuración del perfil',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`cnombre_usuario`),
  KEY `fk_usuario_persona` (`crif_persona`),
  KEY `fk_usuario_perfil` (`nid_perfil`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Volcado de datos para la tabla `tusuario`
--

INSERT INTO `tusuario` (`cnombre_usuario`, `crif_persona`, `nid_perfil`, `nintentos_fallidos`, `nestatus`) VALUES
('ADMINV00000000', 'V00000000', 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tzona`
--

CREATE TABLE IF NOT EXISTS `tzona` (
  `nid_zona` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
  `cnombre` varchar(40) COLLATE latin1_general_ci NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla zona',
  `nid_sucursal` int(11) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
  `crif_persona` char(12) COLLATE latin1_general_ci NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
  `nestatus` int(11) NOT NULL DEFAULT '1' COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
  PRIMARY KEY (`nid_zona`),
  KEY `fk_zona_sucursal` (`nid_sucursal`),
  KEY `fk_zona_vendedor` (`crif_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `talmacen`
--
ALTER TABLE `talmacen`
  ADD CONSTRAINT `fk_almacen_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tcontrasena`
--
ALTER TABLE `tcontrasena`
  ADD CONSTRAINT `fk_contrasena_usuario` FOREIGN KEY (`cnombre_usuario`) REFERENCES `tusuario` (`cnombre_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tconversion`
--
ALTER TABLE `tconversion`
  ADD CONSTRAINT `fk_conversion_producto` FOREIGN KEY (`nid_producto`) REFERENCES `tproducto` (`nid_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conversion_umbase` FOREIGN KEY (`nid_umbase`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conversion_umdestino` FOREIGN KEY (`nid_umdestino`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tdetalle_orden`
--
ALTER TABLE `tdetalle_orden`
  ADD CONSTRAINT `fk_detorden_orden` FOREIGN KEY (`nid_orden`) REFERENCES `torden` (`nid_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detorden_producto` FOREIGN KEY (`nid_producto`) REFERENCES `tproducto` (`nid_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detorden_um` FOREIGN KEY (`nid_um`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tdetalle_recepcion`
--
ALTER TABLE `tdetalle_recepcion`
  ADD CONSTRAINT `fk_detrecepcion_detorden` FOREIGN KEY (`nid_detalle_orden`) REFERENCES `tdetalle_orden` (`nid_detalle_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecepcion_producto` FOREIGN KEY (`nid_producto`) REFERENCES `tproducto` (`nid_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecepcion_recepcion` FOREIGN KEY (`nid_recepcion`) REFERENCES `trecepcion` (`nid_recepcion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecepcion_ubicacion` FOREIGN KEY (`nid_ubicacion`) REFERENCES `tubicacion` (`nid_ubicacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecepcion_um` FOREIGN KEY (`nid_um`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tdetalle_recibo`
--
ALTER TABLE `tdetalle_recibo`
  ADD CONSTRAINT `fk_detrecibo_producto` FOREIGN KEY (`nid_producto`) REFERENCES `tproducto` (`nid_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecibo_recibo` FOREIGN KEY (`nid_recibo`) REFERENCES `trecibo` (`nid_recibo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecibo_ubicacion` FOREIGN KEY (`nid_ubicacion`) REFERENCES `tubicacion` (`nid_ubicacion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detrecibo_um` FOREIGN KEY (`nid_um`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tdetalle_servicio_perfil_opcion`
--
ALTER TABLE `tdetalle_servicio_perfil_opcion`
  ADD CONSTRAINT `fk_det_serv_perf_opc_opcion` FOREIGN KEY (`nid_opcion`) REFERENCES `topcion` (`nid_opcion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_det_serv_perf_opc_perfil` FOREIGN KEY (`nid_perfil`) REFERENCES `tperfil` (`nid_perfil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_det_serv_perf_opc_servicio` FOREIGN KEY (`nid_servicio`) REFERENCES `tservicio` (`nid_servicio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tdireccion_persona`
--
ALTER TABLE `tdireccion_persona`
  ADD CONSTRAINT `fk_direccion_localidad` FOREIGN KEY (`nid_localidad`) REFERENCES `tparroquia` (`nid_parroquia`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_direccion_persona` FOREIGN KEY (`crif_persona`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_direccion_zona` FOREIGN KEY (`nid_zona`) REFERENCES `tzona` (`nid_zona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `testado`
--
ALTER TABLE `testado`
  ADD CONSTRAINT `fk_estado_pais` FOREIGN KEY (`nid_pais`) REFERENCES `tpais` (`nid_pais`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tmodelo`
--
ALTER TABLE `tmodelo`
  ADD CONSTRAINT `fk_modelo_marca` FOREIGN KEY (`nid_marca`) REFERENCES `tmarca` (`nid_marca`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tmovimiento_inventario`
--
ALTER TABLE `tmovimiento_inventario`
  ADD CONSTRAINT `fk_movinventario_producto` FOREIGN KEY (`nid_producto`) REFERENCES `tproducto` (`nid_producto`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movinventario_recepcion` FOREIGN KEY (`nid_detalle_recepcion`) REFERENCES `tdetalle_recepcion` (`nid_detalle_recepcion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movinventario_recibo` FOREIGN KEY (`nid_detalle_recibo`) REFERENCES `tdetalle_recibo` (`nid_detalle_recibo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movinventario_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movinventario_ubicacion` FOREIGN KEY (`nid_ubicacion`) REFERENCES `tubicacion` (`nid_ubicacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tmunicipio`
--
ALTER TABLE `tmunicipio`
  ADD CONSTRAINT `fk_municipio_estado` FOREIGN KEY (`nid_estado`) REFERENCES `testado` (`nid_estado`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `torden`
--
ALTER TABLE `torden`
  ADD CONSTRAINT `fk_orden_direccion` FOREIGN KEY (`nid_direccion`) REFERENCES `tdireccion_persona` (`nid_direccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orden_proveedor` FOREIGN KEY (`crif_proveedor`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orden_solicitante` FOREIGN KEY (`crif_solicitante`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_orden_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tparroquia`
--
ALTER TABLE `tparroquia`
  ADD CONSTRAINT `fk_parroquia_municipio` FOREIGN KEY (`nid_municipio`) REFERENCES `tmunicipio` (`nid_municipio`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tperfil`
--
ALTER TABLE `tperfil`
  ADD CONSTRAINT `fk_perfil_configuracion` FOREIGN KEY (`nid_configuracion`) REFERENCES `tconfiguracion` (`nid_configuracion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tproducto`
--
ALTER TABLE `tproducto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`nid_categoria`) REFERENCES `tcategoria_producto` (`nid_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_modelo` FOREIGN KEY (`nid_modelo`) REFERENCES `tmodelo` (`nid_modelo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_producto_um` FOREIGN KEY (`nid_um`) REFERENCES `tunidad_medida` (`nid_um`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trecepcion`
--
ALTER TABLE `trecepcion`
  ADD CONSTRAINT `fk_recepcion_orden` FOREIGN KEY (`nid_orden`) REFERENCES `torden` (`nid_orden`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recepcion_recepcionista` FOREIGN KEY (`crif_recepcionista`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recepcion_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trecibo`
--
ALTER TABLE `trecibo`
  ADD CONSTRAINT `fk_recibo_cliente` FOREIGN KEY (`crif_cliente`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recibo_direccion` FOREIGN KEY (`nid_direccion`) REFERENCES `tdireccion_persona` (`nid_direccion`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recibo_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recibo_tecnico` FOREIGN KEY (`crif_tecnico`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_recibo_vendedor` FOREIGN KEY (`crif_vendedor`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `trespuesta_secreta`
--
ALTER TABLE `trespuesta_secreta`
  ADD CONSTRAINT `fk_resp_secret_usuario` FOREIGN KEY (`cnombre_usuario`) REFERENCES `tusuario` (`cnombre_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tservicio`
--
ALTER TABLE `tservicio`
  ADD CONSTRAINT `fk_servicio_modulo` FOREIGN KEY (`nid_modulo`) REFERENCES `tmodulo` (`nid_modulo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tsucursal`
--
ALTER TABLE `tsucursal`
  ADD CONSTRAINT `fk_sucursal_compania` FOREIGN KEY (`crif_compania`) REFERENCES `tcompania` (`crif_compania`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sucursal_localidad` FOREIGN KEY (`nid_localidad`) REFERENCES `tparroquia` (`nid_parroquia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tubicacion`
--
ALTER TABLE `tubicacion`
  ADD CONSTRAINT `fk_ubicacion_almacen` FOREIGN KEY (`nid_almacen`) REFERENCES `talmacen` (`nid_almacen`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tusuario`
--
ALTER TABLE `tusuario`
  ADD CONSTRAINT `fk_usuario_perfil` FOREIGN KEY (`nid_perfil`) REFERENCES `tperfil` (`nid_perfil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`crif_persona`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `tzona`
--
ALTER TABLE `tzona`
  ADD CONSTRAINT `fk_zona_sucursal` FOREIGN KEY (`nid_sucursal`) REFERENCES `tsucursal` (`nid_sucursal`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_zona_vendedor` FOREIGN KEY (`crif_persona`) REFERENCES `tpersona` (`crif_persona`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
