DROP DATABASE IF EXISTS bdsisgeinv;

CREATE DATABASE bdsisgeinv DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci ;

USE bdsisgeinv;

CREATE TABLE tcompania (
	crif_compania CHAR(12) NOT NULL COMMENT 'Registro de Información Fiscal de la Compañía',
	cnombre VARCHAR(80) NOT NULL COMMENT 'Nombre o Razón Social de la Compañía',
	cemail VARCHAR(80) NOT NULL COMMENT 'Dirección de Correo Electrónico de la Compañía',
	cclave_email VARCHAR(100) COMMENT 'Clave de la dirección de correo electrónico',
	cmision TEXT COMMENT 'Misión de la Compañía',
	cvision TEXT COMMENT 'Visión de la Compañía',
	cobjetivo TEXT COMMENT 'Objetivo General y Especificos de la Compañía',
	chistoria TEXT COMMENT 'Historia de la Compañía',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_compania PRIMARY KEY(crif_compania)
) ENGINE INNODB;

CREATE TABLE tpais (
	nid_pais INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(80) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla pais',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_pais PRIMARY KEY(nid_pais)
) ENGINE INNODB;

CREATE TABLE tpersona (
	crif_persona CHAR(12) NOT NULL COMMENT 'Registro de Información Fiscal de la Persona',
	cnombre VARCHAR(80) NOT NULL COMMENT 'Nombre o Razón Social de la Persona',
	cemail VARCHAR(80) COMMENT 'Dirección de Correo Electrónico de la Persona',
	ctelefono_movil VARCHAR(11) COMMENT  'Número del Telefono Celular de la Persona',
	ctecnico CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Técnico de Area (Y) o no (N)',
	ccliente CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Cliente (Y) o no (N)',
	cproveedor CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Proveedor (Y) o no (N)',
	cvendedor CHAR(1) NOT NULL DEFAULT 'N' COMMENT 'Indicador si la Persona es un Vendedor (Y) o no (N)',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_persona PRIMARY KEY(crif_persona)
) ENGINE INNODB;

CREATE TABLE tmarca (
	nid_marca INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla marca',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_marca PRIMARY KEY(nid_marca)
) ENGINE INNODB;

CREATE TABLE tcategoria_producto (
	nid_categoria INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla categoria de producto',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_categoria PRIMARY KEY(nid_categoria)
) ENGINE INNODB;

CREATE TABLE tunidad_medida (
	nid_um INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnid_iso CHAR(5) NOT NULL COMMENT 'Código ISO para las Unidades de Medidas',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla unidad de medida',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_um PRIMARY KEY(nid_um),
	CONSTRAINT uk_iso_code UNIQUE (cnid_iso)
) ENGINE INNODB;

CREATE TABLE testado (
	nid_estado INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla estado',
	nid_pais INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla pais',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_estado PRIMARY KEY(nid_estado),
	CONSTRAINT fk_estado_pais FOREIGN KEY(nid_pais) REFERENCES tpais(nid_pais) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tmodelo (
	nid_modelo INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla modelo',
	nid_marca INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla marca',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_modelo PRIMARY KEY(nid_modelo),
	CONSTRAINT fk_modelo_marca FOREIGN KEY(nid_marca) REFERENCES tmarca(nid_marca) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tmunicipio (
	nid_municipio INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla municipio',
	nid_estado INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla estado',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_municipio PRIMARY KEY(nid_municipio),
	CONSTRAINT fk_municipio_estado FOREIGN KEY(nid_estado) REFERENCES testado(nid_estado) ON UPDATE CASCADE ON DELETE RESTRICT 
) ENGINE INNODB;

CREATE TABLE tproducto (
	nid_producto INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(60) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla producto',
	ctipo_producto CHAR(1) NOT NULL DEFAULT 'I' COMMENT 'Identificador del tipo de producto si es Item (I) o Servicio (S)',
	calmacenado CHAR(1) NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto tiene control de inventario (Y) o no (N)',
	ccomprado CHAR(1) NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto es comprado (Y) o no (N)',
	cvendido CHAR(1) NOT NULL DEFAULT 'Y' COMMENT 'Identifica si el producto es vendido (Y) o no (N)',
	nid_categoria INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla categoría de producto',
	nid_um INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	nid_modelo INT NULL COMMENT 'Identificador del registro de la entidad / tabla modelo',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_producto PRIMARY KEY(nid_producto),
	CONSTRAINT fk_producto_categoria FOREIGN KEY(nid_categoria) REFERENCES tcategoria_producto(nid_categoria) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_producto_um FOREIGN KEY(nid_um) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_producto_modelo FOREIGN KEY(nid_modelo) REFERENCES tmodelo(nid_modelo) ON UPDATE CASCADE ON DELETE RESTRICT 
) ENGINE INNODB;

CREATE TABLE tparroquia (
	nid_parroquia INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(50) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla parroquia',
	nid_municipio INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla municipio',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_parroquia PRIMARY KEY(nid_parroquia),
	CONSTRAINT fk_parroquia_municipio FOREIGN KEY(nid_municipio) REFERENCES tmunicipio(nid_municipio) ON UPDATE CASCADE ON DELETE RESTRICT 
) ENGINE INNODB;

CREATE TABLE tconversion (
	nid_conversion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	nid_umbase INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	nid_umdestino INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	nid_producto INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
	nfactor_multiplicador FLOAT NOT NULL DEFAULT 0 COMMENT 'Indica el factor multiplicador de la conversión',
	nfactor_divisor FLOAT NOT NULL DEFAULT 0 COMMENT 'Indica el factor divisor de la conversión',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_conversion PRIMARY KEY(nid_conversion),
	CONSTRAINT fk_conversion_umbase FOREIGN KEY(nid_umbase) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_conversion_umdestino FOREIGN KEY(nid_umdestino) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_conversion_producto FOREIGN KEY(nid_producto) REFERENCES tproducto(nid_producto) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tsucursal (
	nid_sucursal INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(40) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla sucursal',
	cdireccion VARCHAR(120) NOT NULL COMMENT 'Identifica la dirección de ubicación de la sucursal',
	ctelefono_habitacion VARCHAR(11) NOT NULL COMMENT 'Identifica el número telefónico de la sucursal',
	crif_compania CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla compañía',
	nid_localidad INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla parroquia',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_sucursal PRIMARY KEY(nid_sucursal),
	CONSTRAINT fk_sucursal_compania FOREIGN KEY(crif_compania) REFERENCES tcompania(crif_compania) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_sucursal_localidad FOREIGN KEY(nid_localidad) REFERENCES tparroquia(nid_parroquia) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE talmacen (
	nid_almacen INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(40) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla almacén',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_almacen PRIMARY KEY(nid_almacen),
	CONSTRAINT fk_almacen_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tzona (
	nid_zona INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR	(40) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla zona',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	crif_persona CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_zona PRIMARY KEY(nid_zona),
	CONSTRAINT fk_zona_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_zona_vendedor FOREIGN KEY(crif_persona) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tubicacion (
	nid_ubicacion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(40) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla ubicación',
	nid_almacen INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla almacén',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_ubicacion PRIMARY KEY(nid_ubicacion),
	CONSTRAINT fk_ubicacion_almacen FOREIGN KEY(nid_almacen) REFERENCES talmacen(nid_almacen) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tdireccion_persona (
	nid_direccion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cdireccion VARCHAR(150) NOT NULL COMMENT 'Identifica la dirección de ubicación de la persona',
	ctelefono_habitacion VARCHAR(11) COMMENT 'Identifica el número telefónico local de la persona',
	crif_persona CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_localidad INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla parroquia',
	nid_zona INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla zona',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_direccion PRIMARY KEY(nid_direccion),
	CONSTRAINT fk_direccion_persona FOREIGN KEY(crif_persona) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_direccion_localidad FOREIGN KEY(nid_localidad) REFERENCES tparroquia(nid_parroquia) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_direccion_zona FOREIGN KEY(nid_zona) REFERENCES tzona(nid_zona) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE torden (
	nid_orden INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnro_orden CHAR(10) NOT NULL COMMENT 'Identifica el número de la orden de compra',
	dfecha DATE NOT NULL COMMENT 'Identifica la fecha de la orden de compra',
	crif_proveedor CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_direccion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla dirección de la persona',
	crif_solicitante CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	ntotal FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica el total de la orden de compra',
	nestatus INT NOT NULL DEFAULT 0 COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
	CONSTRAINT pk_orden PRIMARY KEY(nid_orden),
	CONSTRAINT uk_orden UNIQUE (cnro_orden),
	CONSTRAINT fk_orden_proveedor FOREIGN KEY(crif_proveedor) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_orden_solicitante FOREIGN KEY(crif_solicitante) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_orden_direccion FOREIGN KEY(nid_direccion) REFERENCES tdireccion_persona(nid_direccion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_orden_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE trecepcion (
	nid_recepcion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	dfecha DATE NOT NULL COMMENT 'Identifica la fecha de la recepción de los productos',
	nid_orden INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla orden de compra',
	crif_recepcionista CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	nestatus INT NOT NULL DEFAULT 0 COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
	CONSTRAINT pk_recepcion PRIMARY KEY(nid_recepcion),
	CONSTRAINT fk_recepcion_orden FOREIGN KEY(nid_orden) REFERENCES torden(nid_orden) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recepcion_recepcionista FOREIGN KEY(crif_recepcionista) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recepcion_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE trecibo (
	nid_recibo INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnro_factura CHAR(10) NOT NULL COMMENT 'Identifica el número externo de la factura asociada con el recibo',
	dfecha DATE NOT NULL COMMENT 'Identifica la fecha del recibo',
	cobservacion TEXT COMMENT 'Identificador de observación o sugerencia aplicados al recibo',
	crif_cliente CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_direccion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla dirección de la persona',
	crif_vendedor CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	crif_tecnico CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	ntotal FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica el total del recibo',
	nestatus INT NOT NULL DEFAULT 0 COMMENT 'Identifica si el registro se encuentra procesado (1) o en borrador (0)',
	CONSTRAINT pk_recibo PRIMARY KEY(nid_recibo),
	CONSTRAINT uk_recibo_factura UNIQUE (cnro_factura),
	CONSTRAINT fk_recibo_cliente FOREIGN KEY(crif_cliente) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recibo_vendedor FOREIGN KEY(crif_vendedor) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recibo_tecnico FOREIGN KEY(crif_tecnico) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recibo_direccion FOREIGN KEY(nid_direccion) REFERENCES tdireccion_persona(nid_direccion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_recibo_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tdetalle_orden (
	nid_detalle_orden INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	nid_orden INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla orden de compra',
	nid_producto INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
	nid_um INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	ncantidad FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica la cantidad solicitada en la orden de compra',
	nprecio FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica el precio facturado en la orden de compra',
	ntotal_linea FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica el neto de la línea de la orden de compra',
	CONSTRAINT pk_detorden PRIMARY KEY(nid_detalle_orden),
	CONSTRAINT fk_detorden_orden FOREIGN KEY(nid_orden) REFERENCES torden(nid_orden) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detorden_producto FOREIGN KEY(nid_producto) REFERENCES tproducto(nid_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detorden_um FOREIGN KEY(nid_um) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tdetalle_recepcion (
	nid_detalle_recepcion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	nid_recepcion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla recepción',
	nid_detalle_orden INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla detalle de orden de compra',
	nid_producto INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
	nid_um INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	nid_ubicacion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
	ncantidad FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica la cantidad a recepcionar de la orden de compra',
	CONSTRAINT pk_detrecepcion PRIMARY KEY(nid_detalle_recepcion),
	CONSTRAINT fk_detrecepcion_recepcion FOREIGN KEY(nid_recepcion) REFERENCES trecepcion(nid_recepcion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecepcion_detorden FOREIGN KEY(nid_detalle_orden) REFERENCES tdetalle_orden(nid_detalle_orden) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecepcion_producto FOREIGN KEY(nid_producto) REFERENCES tproducto(nid_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecepcion_um FOREIGN KEY(nid_um) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecepcion_ubicacion FOREIGN KEY(nid_ubicacion) REFERENCES tubicacion(nid_ubicacion) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tdetalle_recibo (
	nid_detalle_recibo INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	nid_recibo INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla recibo',
	nid_producto INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
	nid_um INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla unidad de medida',
	nid_ubicacion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
	ncantidad FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica la cantidad utilizada del producto',
	nprecio FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica eĺ precio unitario del producto',
	ntotal_linea FLOAT NOT NULL DEFAULT 0 COMMENT 'Identifica el neto de la línea del recibo',
	CONSTRAINT pk_detrecibo PRIMARY KEY(nid_detalle_recibo),
	CONSTRAINT fk_detrecibo_recibo FOREIGN KEY(nid_recibo) REFERENCES trecibo(nid_recibo) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecibo_producto FOREIGN KEY(nid_producto) REFERENCES tproducto(nid_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecibo_um FOREIGN KEY(nid_um) REFERENCES tunidad_medida(nid_um) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_detrecibo_ubicacion FOREIGN KEY(nid_ubicacion) REFERENCES tubicacion(nid_ubicacion) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tmovimiento_inventario (
	nid_movinventario INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	ctipo_transaccion CHAR(1) NOT NULL DEFAULT 'E' COMMENT 'Identifica si el tipo de transacción es Entrada (E) o Salida (S)',
	dfecha_movimiento DATE NOT NULL COMMENT 'Identifica la fecha del movimiento',
	nid_sucursal INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla sucursal',
	nid_producto INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla producto',
	nid_ubicacion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla ubicación',
	ncantidad_movimiento INT NOT NULL DEFAULT 0 COMMENT 'Identifica la cantidad movida del producto',
	nid_detalle_recepcion INT COMMENT 'Identificador del registro de la entidad / tabla detalle de recepción',
	nid_detalle_recibo INT COMMENT 'Identificador del registro de la entidad / tabla detalle de recibo',
	CONSTRAINT pk_movinventario PRIMARY KEY(nid_movinventario),
	CONSTRAINT fk_movinventario_sucursal FOREIGN KEY(nid_sucursal) REFERENCES tsucursal(nid_sucursal) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_movinventario_producto FOREIGN KEY(nid_producto) REFERENCES tproducto(nid_producto) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_movinventario_ubicacion FOREIGN KEY(nid_ubicacion) REFERENCES tubicacion(nid_ubicacion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_movinventario_recepcion FOREIGN KEY(nid_detalle_recepcion) REFERENCES tdetalle_recepcion(nid_detalle_recepcion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_movinventario_recibo FOREIGN KEY(nid_detalle_recibo) REFERENCES tdetalle_recibo(nid_detalle_recibo) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE tbitacora (
	nid_bitacora INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cdireccion_ip VARCHAR(15) NOT NULL COMMENT 'Identifica la dirección IP del equipo donde se realizó la transacción',
	csistema_operativo VARCHAR(50) NOT NULL COMMENT 'Identifica el Sistema Operativo del equipo donde se realizó la transacción',
	cnavegador VARCHAR(35) NOT NULL COMMENT 'Identifica el Navegador Web del equipo donde se realizó la transacción',
	cusuario_bd VARCHAR(30) NOT NULL COMMENT 'Identifica el Usuario de BD con el que se conectó el equipo donde se realizó la transacción',
	cusuario_aplicacion CHAR(15) NOT NULL COMMENT 'Identifica el Usuario de la Aplicación con el que se conectó la persona del equipo donde se realizó la transacción',
	cquery TEXT NOT NULL COMMENT 'Identifica la instrucción SQL que se ejecutó en la transacción',
	dfecha TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Identifica la fecha de la transacción',
	CONSTRAINT pk_bitacora PRIMARY KEY(nid_bitacora)
) ENGINE INNODB;

CREATE TABLE tconfiguracion (
	nid_configuracion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(30) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla configuración',
	cnivel_acceso CHAR(1) NOT NULL DEFAULT 'C' COMMENT 'Identifica el nivel de acceso al sistema si es por Compañía (C), Sucursal (S) o Ambos (A)',
	nlongitud_minclave INT NOT NULL DEFAULT 6 COMMENT 'Identifica la longitud mínima para la clave del usuario',
	nlongitud_maxclave INT NOT NULL DEFAULT 10 COMMENT 'Identifica la longitud máxima para la clave del usuario',
	ncantidad_letrasmayusculas INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de letras mayusculas a usar para la clave del usuario',
	ncantidad_letrasminusculas INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de letras minusculas a usar para la clave del usuario',
	ncantidad_caracteresespeciales INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de caracteres especiales a usar para la clave del usuario',
	ncantidad_numeros INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de números a usar para la clave del usuario',
	ndias_vigenciaclave INT NOT NULL DEFAULT 365 COMMENT 'Identifica la cantidad de días de vigencia para la clave del usuario',
	nnumero_ultimasclaves INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de ultimas claves a validar para aceptar la nueva clave del usuario',
	ndias_aviso INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de días para avisar el vencimiento de la clave del usuario',
	nintentos_fallidos INT NOT NULL DEFAULT 1 COMMENT 'Identifica la cantidad de intentos fallidos que debe hacer un usuario para bloquearlo',
	nnumero_preguntas INT NOT NULL DEFAULT 1 COMMENT 'Identifica el número de preguntas secretas disponibles para recuperar la clave del usuario',
	nnumero_preguntasaresponder INT NOT NULL DEFAULT 1 COMMENT 'Identifica el número de preguntas que se debe responder para poder recuperar la clave del usuario',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_configuracion PRIMARY KEY(nid_configuracion) 
) ENGINE INNODB;

CREATE TABLE tperfil (
	nid_perfil INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(45) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla perfil',
	nid_configuracion INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla configuración',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_perfil PRIMARY KEY(nid_perfil),
	CONSTRAINT fk_perfil_configuracion FOREIGN KEY(nid_configuracion) REFERENCES tconfiguracion(nid_configuracion) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE tmodulo (
	nid_modulo INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(60) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla módulo',
	cicono VARCHAR(255) COMMENT 'Identifica la clase del framework Bootstrap o clase css a utilizar para dibujar el módulo',
	norden INT NOT NULL DEFAULT 0 COMMENT 'Identifica el orden a mantener en el menú',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_modulo PRIMARY KEY(nid_modulo)
) ENGINE INNODB;

CREATE TABLE tservicio (
	nid_servicio INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(45) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla servicio',
	nid_modulo INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla módulo',
	curl varchar(50) NOT NULL COMMENT 'Identifica la url con la cual se podrá acceder al servicio',
	norden INT NOT NULL DEFAULT 0 COMMENT 'Identifica el orden a mantener en el menú',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_servicio PRIMARY KEY(nid_servicio),
	CONSTRAINT fk_servicio_modulo FOREIGN KEY(nid_modulo) REFERENCES tmodulo(nid_modulo) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE topcion (
	nid_opcion INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre VARCHAR(45) NOT NULL COMMENT 'Nombre descriptivo del registro para la entidad / tabla opción',
	cicono VARCHAR(255) COMMENT 'Identifica la clase del framework Bootstrap o clase css a utilizar para dibujar la opción',
	norden INT NOT NULL DEFAULT 0 COMMENT 'Identifica el orden a mantener en el menú',
	naccion INT NOT NULL DEFAULT 0 COMMENT 'Identifica la acción dentro de la aplicación que realizará esta opción',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_opcion PRIMARY KEY(nid_opcion)
) ENGINE INNODB;

CREATE TABLE tusuario (
	cnombre_usuario CHAR(17) NOT NULL COMMENT 'Identifica el nombre del usuario con el cual podrá ingresar al sistema',
	crif_persona CHAR(12) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla persona',
	nid_perfil INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla perfil',
	nintentos_fallidos INT NOT NULL DEFAULT 0 COMMENT 'Identifica el contador de intentos fallidos al sistema para comprobar si se debe bloquear o no según la configuración del perfil',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_usuario PRIMARY KEY(cnombre_usuario),
	CONSTRAINT fk_usuario_persona FOREIGN KEY(crif_persona) REFERENCES tpersona(crif_persona) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_usuario_perfil FOREIGN KEY(nid_perfil) REFERENCES tperfil(nid_perfil) ON UPDATE CASCADE ON DELETE RESTRICT 
) ENGINE INNODB;

CREATE TABLE tcontrasena (
	nid_contrasena INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre_usuario CHAR(17) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla usuario',
	ccontrasena VARCHAR(60) NOT NULL COMMENT 'Identifica la clave encriptada del usuario',
	nestado INT NOT NULL DEFAULT 0 COMMENT 'Identifica el estado de la clave si la clave ha sido usada (0), si la clave esta activo (1), si la clave ha caducado (2), si la clave es de un usuario nuevo (3) o si el usuario esta bloqueado (4)',
	dfecha_modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Identifica la fecha de modificación del registro',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_contrasena PRIMARY KEY(nid_contrasena),
	CONSTRAINT fk_contrasena_usuario FOREIGN KEY(cnombre_usuario) REFERENCES tusuario(cnombre_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE trespuesta_secreta (
	nid_respuesta INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	cnombre_usuario char(17) NOT NULL COMMENT 'Identificador del registro de la entidad / tabla usuario',
	cpregunta VARCHAR(60) NOT NULL COMMENT 'Identifica la pregunta secreta',
	crespuesta VARCHAR(60) NOT NULL COMMENT 'Identifica la respuesta de la pregunta secreta',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_resp_secret PRIMARY KEY(nid_respuesta),
	CONSTRAINT fk_resp_secret_usuario FOREIGN KEY(cnombre_usuario) REFERENCES tusuario(cnombre_usuario) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE tdetalle_servicio_perfil_opcion (
	nid_detalle_serv_perf_opc INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro',
	nid_servicio INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla servicio',
	nid_perfil INT NOT NULL COMMENT 'Identificador del registro de la entidad / tabla perfil',
	nid_opcion INT COMMENT 'Identificador del registro de la entidad / tabla opción',
	nestatus INT NOT NULL DEFAULT 1 COMMENT 'Identifica si el registro se encuentra activo (1) o inactivo (0)',
	CONSTRAINT pk_det_serv_perf_opc PRIMARY KEY(nid_detalle_serv_perf_opc),
	CONSTRAINT fk_det_serv_perf_opc_opcion FOREIGN KEY(nid_opcion) REFERENCES topcion(nid_opcion) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_det_serv_perf_opc_servicio FOREIGN KEY(nid_servicio) REFERENCES tservicio(nid_servicio) ON UPDATE CASCADE ON DELETE RESTRICT,
	CONSTRAINT fk_det_serv_perf_opc_perfil FOREIGN KEY(nid_perfil) REFERENCES tperfil(nid_perfil) ON UPDATE CASCADE ON DELETE RESTRICT
);