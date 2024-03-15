--------------------------
-- Creación del Esquema --
--------------------------

USE GD2C2023
GO

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'DELOREAN_V2')
BEGIN
		EXEC ('CREATE SCHEMA DELOREAN_V2')
END
GO 

-----------------------
-- BORRADO DE TABLAS --
-----------------------

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_ambientes', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_ambientes;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_tipo_inmueble', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_tipo_inmueble;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_orientacion', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_orientacion;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_disposicion', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_disposicion;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_estado', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_estado;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_barrio', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_barrio;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inmueble_propietario', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inmueble
DROP CONSTRAINT FK_inmueble_propietario;
GO

IF OBJECT_ID('DELOREAN_V2.FK_caracteristicas_inmueble', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.caracteristicas_del_inmueble
DROP CONSTRAINT FK_caracteristicas_inmueble;
GO

IF OBJECT_ID('DELOREAN_V2.FK_caracteristicas_caracteristica', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.caracteristicas_del_inmueble
DROP CONSTRAINT FK_caracteristicas_caracteristica;
GO

IF OBJECT_ID('DELOREAN_V2.FK_anuncio_agente', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.anuncio
DROP CONSTRAINT FK_anuncio_agente;
GO

IF OBJECT_ID('DELOREAN_V2.FK_anuncio_inmueble', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.anuncio
DROP CONSTRAINT FK_anuncio_inmueble;
GO

IF OBJECT_ID('DELOREAN_V2.FK_anuncio_estado', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.anuncio
DROP CONSTRAINT FK_anuncio_estado;
GO

IF OBJECT_ID('DELOREAN_V2.FK_anuncio_moneda', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.anuncio
DROP CONSTRAINT FK_anuncio_moneda;
GO

IF OBJECT_ID('DELOREAN_V2.FK_anuncio_operacion', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.anuncio
DROP CONSTRAINT FK_anuncio_operacion;
GO

IF OBJECT_ID('DELOREAN_V2.FK_venta_anuncio', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.venta
DROP CONSTRAINT FK_venta_anuncio;
GO

IF OBJECT_ID('DELOREAN_V2.FK_venta_comprador', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.venta
DROP CONSTRAINT FK_venta_comprador;
GO

IF OBJECT_ID('DELOREAN_V2.FK_venta_moneda', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.venta
DROP CONSTRAINT FK_venta_moneda;
GO

IF OBJECT_ID('DELOREAN_V2.FK_pago_venta_medio_pago', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.pago_venta
DROP CONSTRAINT FK_pago_venta_medio_pago;
GO

IF OBJECT_ID('DELOREAN_V2.FK_pago_venta_moneda', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.pago_venta
DROP CONSTRAINT FK_pago_venta_moneda;
GO

IF OBJECT_ID('DELOREAN_V2.FK_pago_venta_venta', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.pago_venta
DROP CONSTRAINT FK_pago_venta_venta;
GO

IF OBJECT_ID('DELOREAN_V2.FK_alquiler_anuncio', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.alquiler
DROP CONSTRAINT FK_alquiler_anuncio;
GO

IF OBJECT_ID('DELOREAN_V2.FK_alquiler_estado', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.alquiler
DROP CONSTRAINT FK_alquiler_estado;
GO

IF OBJECT_ID('DELOREAN_V2.FK_agente_sucursal', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.agente
DROP CONSTRAINT FK_agente_sucursal;
GO

IF OBJECT_ID('DELOREAN_V2.FK_sucursal_localidad', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.sucursal
DROP CONSTRAINT FK_sucursal_localidad;
GO

IF OBJECT_ID('DELOREAN_V2.FK_pago_alquiler_alquiler', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.pago_alquiler
DROP CONSTRAINT FK_pago_alquiler_alquiler;
GO

IF OBJECT_ID('DELOREAN_V2.FK_pago_alquiler_medio_de_pago', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.pago_alquiler
DROP CONSTRAINT FK_pago_alquiler_medio_de_pago;
GO

IF OBJECT_ID('DELOREAN_V2.FK_inquilino_alquiler', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.inquilino
DROP CONSTRAINT FK_inquilino_alquiler;
GO

IF OBJECT_ID('DELOREAN_V2.FK_localidad_provincia', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.localidad
DROP CONSTRAINT FK_localidad_provincia;
GO

IF OBJECT_ID('DELOREAN_V2.FK_barrio_localidad', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.barrio
DROP CONSTRAINT FK_barrio_localidad;
GO

IF OBJECT_ID('DELOREAN_V2.FK_detalle_alquiler_alquiler', 'F') IS NOT NULL
ALTER TABLE DELOREAN_V2.detalle_alquiler_importe
DROP CONSTRAINT FK_detalle_alquiler_alquiler;
GO

IF OBJECT_ID('DELOREAN_V2.caracteristicas_del_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.caracteristicas_del_inmueble;
IF OBJECT_ID('DELOREAN_V2.pago_alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.pago_alquiler;
IF OBJECT_ID('DELOREAN_V2.alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.alquiler;
IF OBJECT_ID('DELOREAN_V2.estado_alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.estado_alquiler;
IF OBJECT_ID('DELOREAN_V2.venta', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.venta;
IF OBJECT_ID('DELOREAN_V2.anuncio', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.anuncio;
IF OBJECT_ID('DELOREAN_V2.inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.inmueble;
IF OBJECT_ID('DELOREAN_V2.inquilino', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.inquilino;
IF OBJECT_ID('DELOREAN_V2.agente', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.agente;
IF OBJECT_ID('DELOREAN_V2.propietario', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.propietario;
IF OBJECT_ID('DELOREAN_V2.pago_venta', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.pago_venta;
IF OBJECT_ID('DELOREAN_V2.comprador', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.comprador;
IF OBJECT_ID('DELOREAN_V2.sucursal', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.sucursal;
IF OBJECT_ID('DELOREAN_V2.barrio', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.barrio;
IF OBJECT_ID('DELOREAN_V2.localidad', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.localidad;
IF OBJECT_ID('DELOREAN_V2.ambientes_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.ambientes_inmueble;
IF OBJECT_ID('DELOREAN_V2.detalle_alquiler_importe', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.detalle_alquiler_importe;
IF OBJECT_ID('DELOREAN_V2.caracteristicas', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.caracteristicas;
IF OBJECT_ID('DELOREAN_V2.provincia', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.provincia;
IF OBJECT_ID('DELOREAN_V2.disposicion_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.disposicion_inmueble;
IF OBJECT_ID('DELOREAN_V2.estado_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.estado_inmueble;
IF OBJECT_ID('DELOREAN_V2.orientacion_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.orientacion_inmueble;
IF OBJECT_ID('DELOREAN_V2.tipo_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.tipo_inmueble;
IF OBJECT_ID('DELOREAN_V2.medio_de_pago', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.medio_de_pago;
IF OBJECT_ID('DELOREAN_V2.tipo_operacion', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.tipo_operacion;
IF OBJECT_ID('DELOREAN_V2.estado_anuncio', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.estado_anuncio;
IF OBJECT_ID('DELOREAN_V2.moneda', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.moneda;

IF OBJECT_ID('DELOREAN_V2.migrar_moneda', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_moneda
IF OBJECT_ID('DELOREAN_V2.migrar_disposicion_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_disposicion_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_estado_anuncio', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_estado_anuncio
IF OBJECT_ID('DELOREAN_V2.migrar_estado_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_estado_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_medio_de_pago', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_medio_de_pago
IF OBJECT_ID('DELOREAN_V2.migrar_orientacion_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_orientacion_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_provincia', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_provincia
IF OBJECT_ID('DELOREAN_V2.migrar_tipo_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_tipo_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_tipo_operacion', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_tipo_operacion
IF OBJECT_ID('DELOREAN_V2.migrar_caracteristicas', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_caracteristicas
IF OBJECT_ID('DELOREAN_V2.migrar_detalle_alquiler_importe', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_detalle_alquiler_importe
IF OBJECT_ID('DELOREAN_V2.migrar_agente', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_agente
IF OBJECT_ID('DELOREAN_V2.migrar_ambientes_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_ambientes_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_anuncio', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_anuncio
IF OBJECT_ID('DELOREAN_V2.migrar_barrio', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_barrio
IF OBJECT_ID('DELOREAN_V2.migrar_comprador', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_comprador
IF OBJECT_ID('DELOREAN_V2.migrar_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_inquilino', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_inquilino
IF OBJECT_ID('DELOREAN_V2.migrar_venta', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_venta
IF OBJECT_ID('DELOREAN_V2.migrar_localidad', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_localidad
IF OBJECT_ID('DELOREAN_V2.migrar_pago_venta', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_pago_venta
IF OBJECT_ID('DELOREAN_V2.migrar_propietario', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_propietario
IF OBJECT_ID('DELOREAN_V2.migrar_sucursal', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_sucursal
IF OBJECT_ID('DELOREAN_V2.migrar_estado_alquiler', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_estado_alquiler
IF OBJECT_ID('DELOREAN_V2.migrar_alquiler', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_alquiler
IF OBJECT_ID('DELOREAN_V2.migrar_caracteristicas_del_inmueble', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_caracteristicas_del_inmueble
IF OBJECT_ID('DELOREAN_V2.migrar_pago_alquiler', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.migrar_pago_alquiler

------------------------ 
-- CREACIÓN DE TABLAS --
------------------------
	
CREATE TABLE DELOREAN_V2.inmueble
(
	numero_inmueble NUMERIC(18, 0) PRIMARY KEY,
	id_ambientes NUMERIC(18, 0) NOT NULL, --FK
	id_tipo_inmueble NUMERIC(18, 0) NOT NULL, --FK
	id_orientacion NUMERIC(18, 0) NOT NULL, --FK
	id_disposicion NUMERIC(18, 0) NOT NULL, --FK
	id_estado NUMERIC(18, 0) NOT NULL, --FK
	id_barrio NUMERIC(18, 0) NOT NULL, --FK
	id_propietario NUMERIC(18, 0) NOT NULL, --FK
	descripcion NVARCHAR(100) NOT NULL, 
	superficie_total NUMERIC(18, 0) NOT NULL,
	antiguedad NUMERIC(18, 0) NOT NULL,
	nombre NVARCHAR(100) NOT NULL,
	direccion NVARCHAR(100) NOT NULL,
	valor_ultima_expensa NUMERIC(18, 2) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.caracteristicas_del_inmueble
(
	numero_inmueble NUMERIC(18, 0), --FK
	id_caracteristica NUMERIC(18, 0), --FK
	PRIMARY KEY(numero_inmueble, id_caracteristica)
)
GO

CREATE TABLE DELOREAN_V2.caracteristicas
(
	id_caracteristica NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.orientacion_inmueble
(
	id_orientacion NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.tipo_inmueble
(
	id_tipo_inmueble NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.ambientes_inmueble
(
	id_ambientes NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.disposicion_inmueble
(
	id_disposicion NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.estado_inmueble
(
	id_estado NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.alquiler
(
	codigo_de_alquiler NUMERIC(18, 0) PRIMARY KEY,
	numero_de_anuncio NUMERIC(18, 0) NOT NULL, --FK
	id_estado_alquiler NUMERIC(18, 0) NOT NULL, --FK
	fecha_de_inicio DATETIME NOT NULL,
	cantidad_de_periodos NUMERIC(18, 0) NOT NULL,
	deposito NUMERIC(18, 2) NOT NULL,
	comision NUMERIC(18, 2) NOT NULL,
	gastos_averiguacionales NUMERIC(18, 2) NOT NULL,
	fecha_fin DATETIME NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.sucursal
(
	id_sucursal NUMERIC(18, 0) PRIMARY KEY,
	id_localidad NUMERIC(18, 0) NOT NULL, --FK
	nombre NVARCHAR(100) NOT NULL,
	telefono NVARCHAR(100) NOT NULL,
	direccion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.detalle_alquiler_importe
(
	id_detalle NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	codigo_de_alquiler NUMERIC(18, 0) NOT NULL, --FK
	periodo_inicio NUMERIC(18, 0) NOT NULL,
	periodo_fin NUMERIC(18, 0) NOT NULL,
	precio NUMERIC(18, 2) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.agente
(
	id_agente_inmobiliario NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	id_sucursal NUMERIC(18, 0) NOT NULL, --FK
	nombre NVARCHAR(100) NOT NULL,
	apellido NVARCHAR(100) NOT NULL,
	dni NUMERIC(18, 0) NOT NULL,
	fecha_de_registro DATETIME NOT NULL,
	telefono NUMERIC(18, 0) NOT NULL,
	mail NVARCHAR(100) NOT NULL,
	fecha_de_nacimiento DATETIME NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.pago_alquiler
(
    codigo_de_pago NUMERIC(18, 0) PRIMARY KEY, 
    codigo_de_alquiler NUMERIC(18, 0) NOT NULL, --fk
    id_medio_de_pago NUMERIC(18, 0) NOT NULL, --fk
    numero_de_periodo NUMERIC(18, 0) NOT NULL,
    descripcion NVARCHAR(100) NOT NULL,
    fecha_de_pago DATETIME NOT NULL,
    fecha_inicio_periodo DATETIME NOT NULL,
    fecha_fin_periodo DATETIME NOT NULL,
    importe NUMERIC(18, 2) NOT NULL, 
    fecha_de_vencimiento DATETIME NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.inquilino
(
    id_inquilino NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	codigo_alquiler NUMERIC(18, 0) NOT NULL, --FK
    nombre NVARCHAR(100) NOT NULL,
    apellido NVARCHAR(100) NOT NULL,
    dni NUMERIC(18, 0) NOT NULL,
    fecha_de_registro DATETIME NOT NULL,
    fecha_de_nacimiento DATETIME NOT NULL,
    mail NVARCHAR(100) NOT NULL,
    telefono NUMERIC(18, 0) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.provincia
(
    id_provincia NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.localidad
(
    id_localidad NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY, 
    id_provincia NUMERIC(18, 0) NOT NULL, --fk
    nombre NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.barrio
(
    id_barrio NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
    id_localidad NUMERIC(18, 0) NOT NULL, --fk
    nombre NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.medio_de_pago
(
    id_medio_de_pago NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
    nombre_medio NVARCHAR(100) NOT NULL
)
GO 

CREATE TABLE DELOREAN_V2.anuncio
(
	numero_de_anuncio NUMERIC(18,0) PRIMARY KEY,
	id_agente_inmobiliario NUMERIC(18,0) NOT NULL, --fk,
	numero_inmueble NUMERIC(18,0), --fk,
	id_estado_anuncio NUMERIC(18,0) NOT NULL, --fk,
	id_moneda NUMERIC(18,0) NOT NULL, --fk,
	id_tipo_operacion NUMERIC(18,0) NOT NULL, --fk,
	tipo_periodo NVARCHAR(100) NOT NULL,
	fecha_de_publicacion DATETIME NOT NULL, 
	fecha_de_finalizacion DATETIME NOT NULL,
	precio_publicado NUMERIC(18, 2) NOT NULL,
	costo_anuncio NUMERIC(18,2) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.estado_anuncio
(
	id_estado_anuncio NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.tipo_operacion
(
	id_tipo_operacion NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.moneda
(
	id_moneda NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion NVARCHAR(100) NOT NULL
) 
GO 

CREATE TABLE DELOREAN_V2.propietario
(
	id_propietario NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL,
	apellido NVARCHAR(100) NOT NULL,
	dni NUMERIC(18,0) NOT NULL,
	fecha_de_registro DATETIME NOT NULL,
	fecha_de_nacimiento DATETIME NOT NULL,
	mail NVARCHAR(255) NOT NULL, 
	telefono NUMERIC(18,0) NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.venta
(
	codigo_de_venta NUMERIC(18,0) PRIMARY KEY, 
	numero_de_anuncio NUMERIC(18,0), -- fk,
	id_comprador NUMERIC(18,0), --fk, 
	id_moneada NUMERIC(18,0), --fk,
	fecha_venta DATETIME NOT NULL, 
	precio_venta NUMERIC(18, 2) NOT NULL, 
	comision NUMERIC(18,2) NOT NULL
)
GO 

CREATE TABLE DELOREAN_V2.pago_venta
(
	id_pago NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY, 
	id_medio_pago NUMERIC(18, 0), --fk,
	id_moneda NUMERIC(18, 0), --fk,
	codigo_de_venta NUMERIC(18, 0), --FK
	importe NUMERIC(18,2) NOT NULL,
	cotizacion NUMERIC(18,2) NOT NULL
)
GO 

CREATE TABLE DELOREAN_V2.comprador
(
	id_comprador NUMERIC(18,0) IDENTITY(1, 1) PRIMARY KEY,
	nombre NVARCHAR(100) NOT NULL, 
	apellido NVARCHAR(100) NOT NULL, 
	dni NUMERIC(18,0) NOT NULL,  
	fecha_de_registro DATETIME NOT NULL, 
	telefono NUMERIC(18,0) NOT NULL,
	mail NVARCHAR(100) NOT NULL, 
	fecha_de_nacimiento DATETIME NOT NULL
)
GO

CREATE TABLE DELOREAN_V2.estado_alquiler
(
	id_estado_alquiler NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	descripcion_estado NVARCHAR(100) NOT NULL
)
GO

--------------------------
-- FUNCIONES AUXILIARES --
--------------------------

CREATE FUNCTION DELOREAN_V2.identificador_provincia 
(@NOMBRE_PROVINCIA NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_PROVINCIA NUMERIC(18, 0)
	SET @ID_PROVINCIA = (SELECT p.id_provincia
							FROM DELOREAN_V2.provincia p
							WHERE p.nombre = @NOMBRE_PROVINCIA)
	RETURN @ID_PROVINCIA
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_localidad
(@NOMBRE_LOCALIDAD NVARCHAR(100),
 @NOMBRE_PROVINCIA NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_LOCALIDAD NUMERIC(18, 0)
	SET @ID_LOCALIDAD = (SELECT DISTINCT l.id_localidad
							FROM DELOREAN_V2.localidad l
							WHERE l.nombre = @NOMBRE_LOCALIDAD AND
								  l.id_provincia = DELOREAN_V2.identificador_provincia(@NOMBRE_PROVINCIA))
	RETURN @ID_LOCALIDAD
END
GO 

CREATE FUNCTION DELOREAN_V2.identificador_barrio
(@NOMBRE_BARRIO NVARCHAR(100),
 @NOMBRE_LOCALIDAD NVARCHAR(100),
 @NOMBRE_PROVINCIA NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_BARRIO NUMERIC(18, 0)
	SET @ID_BARRIO = (SELECT DISTINCT b.id_barrio
						FROM DELOREAN_V2.barrio b
						WHERE b.nombre = @NOMBRE_BARRIO AND
						      b.id_localidad = DELOREAN_V2.identificador_localidad(@NOMBRE_LOCALIDAD, @NOMBRE_PROVINCIA))
	RETURN @ID_BARRIO
END												     
GO 

CREATE FUNCTION DELOREAN_V2.identificador_moneda
(@NOMBRE_MONEDA NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_MONEDA NUMERIC(18, 0)
	SET @ID_MONEDA = (SELECT m.id_moneda
						FROM DELOREAN_V2.moneda m
						WHERE m.descripcion = @NOMBRE_MONEDA)
	RETURN @ID_MONEDA
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_medio_de_pago
(@NOMBRE_MEDIO_DE_PAGO NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_MEDIO_DE_PAGO NUMERIC(18, 0)
	SET @ID_MEDIO_DE_PAGO = (SELECT mp.id_medio_de_pago
								FROM DELOREAN_V2.medio_de_pago mp
								WHERE mp.nombre_medio = @NOMBRE_MEDIO_DE_PAGO)
	RETURN @ID_MEDIO_DE_PAGO
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_agente
(@NOMBRE_AGENTE NVARCHAR(100),
 @APELLIDO_AGENTE NVARCHAR(100),
 @DNI_AGENTE NUMERIC(18, 0))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_AGENTE NUMERIC(18, 0)
	SET @ID_AGENTE = (SELECT a.id_agente_inmobiliario
						FROM DELOREAN_V2.agente a
						WHERE a.nombre = @NOMBRE_AGENTE AND
							  a.apellido = @APELLIDO_AGENTE AND
							  a.dni = @DNI_AGENTE)
	RETURN @ID_AGENTE
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_estado_anuncio
(@ESTADO_ANUNCIO NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_ESTADO_ANUNCIO NUMERIC(18, 0)
	SET @ID_ESTADO_ANUNCIO = (SELECT e.id_estado_anuncio
									FROM DELOREAN_V2.estado_anuncio e
									WHERE e.descripcion = @ESTADO_ANUNCIO)
	RETURN @ID_ESTADO_ANUNCIO
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_tipo_operacion
(@TIPO_OPERACION NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_TIPO_OPERACION NUMERIC(18, 0)
	SET @ID_TIPO_OPERACION = (SELECT o.id_tipo_operacion
									FROM DELOREAN_V2.tipo_operacion o
									WHERE o.descripcion = @TIPO_OPERACION)
	RETURN @ID_TIPO_OPERACION
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_comprador
(@NOMBRE_COMPRADOR NVARCHAR(100),
 @APELLIDO_COMPRADOR NVARCHAR(100),
 @DNI_COMPRADOR NVARCHAR(100),
 @MAIL_COMPRADOR NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_COMPRADOR NUMERIC(18, 0)
	SET @ID_COMPRADOR = (SELECT DISTINCT c.id_comprador
							FROM DELOREAN_V2.comprador c
							WHERE c.nombre = @NOMBRE_COMPRADOR AND
								  c.apellido = @APELLIDO_COMPRADOR AND
								  c.dni = @DNI_COMPRADOR AND
								  c.mail = @MAIL_COMPRADOR)
	RETURN @ID_COMPRADOR
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_pago_venta 
(@MEDIO_DE_PAGO NVARCHAR(100),
 @MONEDA NVARCHAR(100),
 @IMPORTE NUMERIC(18, 2),
 @COTIZACION NUMERIC(18, 2))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_PAGO_VENTA NUMERIC(18, 0)
	SET @ID_PAGO_VENTA = (SELECT DISTINCT v.id_pago
							FROM DELOREAN_V2.pago_venta v
							WHERE v.id_medio_pago = DELOREAN_V2.identificador_medio_de_pago(@MEDIO_DE_PAGO) AND
							      v.id_moneda = DELOREAN_V2.identificador_moneda(@MONEDA) AND
								  v.cotizacion = @COTIZACION AND
								  v.importe = @IMPORTE)
	RETURN @ID_PAGO_VENTA
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_detalle_alquiler
(@PERIODO_INICIO NUMERIC(18, 0),
 @PERIODO_FIN NUMERIC(18, 0),
 @PRECIO NUMERIC(18, 2))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_DETALLE_ALQUILER NUMERIC(18, 0)
	SET @ID_DETALLE_ALQUILER = (SELECT DISTINCT d.id_detalle
									FROM DELOREAN_V2.detalle_alquiler_importe d
									WHERE d.periodo_inicio = @PERIODO_INICIO AND
									      d.periodo_fin = @PERIODO_FIN AND
										  d.precio = @PRECIO)
	RETURN @ID_DETALLE_ALQUILER
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_estado_alquiler
(@ESTADO_ALQUILER NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_ESTADO_ALQUILER NUMERIC(18, 0)
	SET @ID_ESTADO_ALQUILER = (SELECT DISTINCT a.id_estado_alquiler
									FROM DELOREAN_V2.estado_alquiler a
									WHERE a.descripcion_estado = @ESTADO_ALQUILER)
	RETURN @ID_ESTADO_ALQUILER
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_cantidad_ambientes
(@CANTIDAD_AMBIENTES NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_CANTIDAD_AMBIENTES NUMERIC(18, 0)
	SET @ID_CANTIDAD_AMBIENTES = (SELECT DISTINCT a.id_ambientes
									FROM DELOREAN_V2.ambientes_inmueble a
									WHERE a.descripcion = @CANTIDAD_AMBIENTES)
	RETURN @ID_CANTIDAD_AMBIENTES
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_tipo_inmueble
(@TIPO_INMUEBLE NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_TIPO_INMUEBLE NUMERIC(18, 0)
	SET @ID_TIPO_INMUEBLE = (SELECT DISTINCT t.id_tipo_inmueble
									FROM DELOREAN_V2.tipo_inmueble t
									WHERE t.descripcion = @TIPO_INMUEBLE)
	RETURN @ID_TIPO_INMUEBLE
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_orientacion_inmueble
(@ORIENTACION_INMUEBLE NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_ORIENTACION_INMUEBLE NUMERIC(18, 0)
	SET @ID_ORIENTACION_INMUEBLE = (SELECT DISTINCT o.id_orientacion
									FROM DELOREAN_V2.orientacion_inmueble o
									WHERE o.descripcion = @ORIENTACION_INMUEBLE)
	RETURN @ID_ORIENTACION_INMUEBLE
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_disposicion_inmueble
(@DISPOSICION_INMUEBLE NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_DISPOSICION_INMUEBLE NUMERIC(18, 0)
	SET @ID_DISPOSICION_INMUEBLE = (SELECT DISTINCT d.id_disposicion
										FROM DELOREAN_V2.disposicion_inmueble d
										WHERE d.descripcion = @DISPOSICION_INMUEBLE)
	RETURN @ID_DISPOSICION_INMUEBLE
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_estado_inmueble
(@ESTADO_INMUEBLE NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_ESTADO_INMUEBLE NUMERIC(18, 0)
	SET @ID_ESTADO_INMUEBLE = (SELECT DISTINCT i.id_estado
									FROM DELOREAN_V2.estado_inmueble i
									WHERE i.descripcion = @ESTADO_INMUEBLE)
	RETURN @ID_ESTADO_INMUEBLE
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_caracteristicas
(@NOMBRE_CARACTERISTICA NVARCHAR(100))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_CARACTERISTICA NUMERIC(18, 0)
	SET @ID_CARACTERISTICA = (SELECT DISTINCT c.id_caracteristica
									FROM DELOREAN_V2.caracteristicas c
									WHERE c.descripcion = @NOMBRE_CARACTERISTICA)
	RETURN @ID_CARACTERISTICA
END
GO

CREATE FUNCTION DELOREAN_V2.identificador_propietario 
(@NOMBRE_PROPIETARIO NVARCHAR(100),
 @APELLIDO_PROPIETARIO NVARCHAR(100),
 @DNI_PROPIETARIO NUMERIC(18, 0))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @ID_PROPIETARIO NUMERIC(18, 0)
	SET @ID_PROPIETARIO = (SELECT DISTINCT p.id_propietario
								FROM DELOREAN_V2.propietario p
								WHERE p.nombre = @NOMBRE_PROPIETARIO AND
									  p.apellido = @APELLIDO_PROPIETARIO AND
									  p.dni = @DNI_PROPIETARIO)
	RETURN @ID_PROPIETARIO
END
GO

-----------------------------------
-- PROCEDIMIENTOS DE MIGRACIONES --
-----------------------------------

CREATE PROCEDURE DELOREAN_V2.migrar_moneda AS
BEGIN
	INSERT INTO DELOREAN_V2.moneda 
	SELECT DISTINCT  
		m.PAGO_VENTA_MONEDA
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_VENTA_MONEDA IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_estado_anuncio AS
BEGIN 
	INSERT INTO DELOREAN_V2.estado_anuncio
	SELECT DISTINCT
		m.ANUNCIO_ESTADO
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_tipo_operacion AS
BEGIN
	INSERT INTO DELOREAN_V2.tipo_operacion
	SELECT DISTINCT
		m.ANUNCIO_TIPO_OPERACION
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_TIPO_OPERACION IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_medio_de_pago AS
BEGIN
	INSERT INTO DELOREAN_V2.medio_de_pago
	SELECT DISTINCT
		m.PAGO_ALQUILER_MEDIO_PAGO
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_ALQUILER_MEDIO_PAGO IS NOT NULL
	UNION
	SELECT DISTINCT 
		m.PAGO_VENTA_MEDIO_PAGO
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_VENTA_MEDIO_PAGO IS NOT NULL
END
GO
		
CREATE PROCEDURE DELOREAN_V2.migrar_tipo_inmueble AS
BEGIN
	INSERT INTO DELOREAN_V2.tipo_inmueble
	SELECT DISTINCT
		m.INMUEBLE_TIPO_INMUEBLE
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_TIPO_INMUEBLE IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_orientacion_inmueble AS
BEGIN
	INSERT INTO DELOREAN_V2.orientacion_inmueble
	SELECT DISTINCT
		m.INMUEBLE_ORIENTACION
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_ORIENTACION IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_estado_inmueble AS 
BEGIN
	INSERT INTO DELOREAN_V2.estado_inmueble
	SELECT DISTINCT
		m.INMUEBLE_ESTADO
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_disposicion_inmueble AS
BEGIN
	INSERT INTO DELOREAN_V2.disposicion_inmueble
	SELECT DISTINCT
		m.INMUEBLE_DISPOSICION
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_DISPOSICION IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_provincia AS
BEGIN
	INSERT INTO DELOREAN_V2.provincia
	SELECT DISTINCT
		m.INMUEBLE_PROVINCIA
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_PROVINCIA IS NOT NULL
	UNION 
	SELECT DISTINCT 
		m.SUCURSAL_PROVINCIA
	FROM gd_esquema.Maestra m
	WHERE m.SUCURSAL_PROVINCIA IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_caracteristicas AS 
BEGIN 
	INSERT INTO DELOREAN_V2.caracteristicas
		VALUES ('Cable'), ('Calefacción'), ('Gas'), ('WiFi')
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_detalle_alquiler_importe AS 
BEGIN 
	INSERT INTO DELOREAN_V2.detalle_alquiler_importe
	SELECT DISTINCT
		m.ALQUILER_CODIGO,
		m.DETALLE_ALQ_NRO_PERIODO_INI,
		m.DETALLE_ALQ_NRO_PERIODO_FIN,
		m.DETALLE_ALQ_PRECIO
	FROM gd_esquema.Maestra m
	WHERE m.DETALLE_ALQ_NRO_PERIODO_INI IS NOT NULL AND m.DETALLE_ALQ_NRO_PERIODO_FIN IS NOT NULL AND m.DETALLE_ALQ_PRECIO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_ambientes_inmueble AS
BEGIN 
	INSERT INTO DELOREAN_V2.ambientes_inmueble
	SELECT DISTINCT
		m.INMUEBLE_CANT_AMBIENTES
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_CANT_AMBIENTES IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_localidad AS
BEGIN
	INSERT INTO DELOREAN_V2.localidad
	SELECT DISTINCT
		DELOREAN_V2.identificador_provincia(m.SUCURSAL_PROVINCIA),
		m.SUCURSAL_LOCALIDAD
	FROM gd_esquema.Maestra m
	WHERE m.SUCURSAL_LOCALIDAD IS NOT NULL 
	UNION 
	SELECT DISTINCT
		DELOREAN_V2.identificador_provincia(m.INMUEBLE_PROVINCIA),
		m.INMUEBLE_LOCALIDAD
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_LOCALIDAD IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_barrio AS
BEGIN 
	INSERT INTO DELOREAN_V2.barrio
	SELECT DISTINCT
		DELOREAN_V2.identificador_localidad(m.INMUEBLE_LOCALIDAD, m.INMUEBLE_PROVINCIA),
		m.INMUEBLE_BARRIO
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_BARRIO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_sucursal AS
BEGIN
	INSERT INTO DELOREAN_V2.sucursal
	SELECT DISTINCT
		m.SUCURSAL_CODIGO,
		DELOREAN_V2.identificador_localidad(m.SUCURSAL_LOCALIDAD, m.SUCURSAL_PROVINCIA),
		m.SUCURSAL_NOMBRE,
		m.SUCURSAL_TELEFONO,
		m.SUCURSAL_DIRECCION
	FROM gd_esquema.Maestra m
	WHERE m.SUCURSAL_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_comprador AS
BEGIN 
	INSERT INTO DELOREAN_V2.comprador
	SELECT DISTINCT 
		m.COMPRADOR_NOMBRE,
		m.COMPRADOR_APELLIDO,
		m.COMPRADOR_DNI,
		m.COMPRADOR_FECHA_REGISTRO,
		m.COMPRADOR_TELEFONO,
		m.COMPRADOR_MAIL,
		m.COMPRADOR_FECHA_NAC
	FROM gd_esquema.Maestra m
	WHERE m.COMPRADOR_APELLIDO IS NOT NULL AND m.COMPRADOR_DNI IS NOT NULL
		  AND m.COMPRADOR_FECHA_NAC IS NOT NULL AND m.COMPRADOR_FECHA_REGISTRO IS NOT NULL
		  AND m.COMPRADOR_MAIL IS NOT NULL AND m.COMPRADOR_NOMBRE IS NOT NULL 
		  AND m.COMPRADOR_TELEFONO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_pago_venta AS
BEGIN 
	INSERT INTO DELOREAN_V2.pago_venta
	SELECT DISTINCT
		DELOREAN_V2.identificador_medio_de_pago(m.PAGO_VENTA_MEDIO_PAGO),
		DELOREAN_V2.identificador_moneda(m.PAGO_VENTA_MONEDA),
		m.VENTA_CODIGO,
		m.PAGO_VENTA_IMPORTE,
		m.PAGO_VENTA_COTIZACION
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_VENTA_IMPORTE IS NOT NULL 
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_propietario AS
BEGIN
	INSERT INTO DELOREAN_V2.propietario
	SELECT DISTINCT
		m.PROPIETARIO_NOMBRE,
		m.PROPIETARIO_APELLIDO,
		m.PROPIETARIO_DNI,
		m.PROPIETARIO_FECHA_REGISTRO,
		m.PROPIETARIO_FECHA_NAC,
		m.PROPIETARIO_MAIL,
		m.PROPIETARIO_TELEFONO
	FROM gd_esquema.Maestra m
	WHERE m.PROPIETARIO_NOMBRE IS NOT NULL AND m.PROPIETARIO_APELLIDO IS NOT NULL AND
		  m.PROPIETARIO_DNI IS NOT NULL AND m.PROPIETARIO_FECHA_NAC IS NOT NULL AND
		  m.PROPIETARIO_FECHA_REGISTRO IS NOT NULL AND m.PROPIETARIO_MAIL IS NOT NULL AND
		  m.PROPIETARIO_NOMBRE IS NOT NULL AND m.PROPIETARIO_TELEFONO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_agente AS	
BEGIN 
	INSERT INTO DELOREAN_V2.agente 
	SELECT DISTINCT
		m.SUCURSAL_CODIGO,
		m.AGENTE_NOMBRE,
		m.AGENTE_APELLIDO,
		m.AGENTE_DNI,
		m.AGENTE_FECHA_REGISTRO,
		m.AGENTE_TELEFONO,
		m.AGENTE_MAIL,
		m.AGENTE_FECHA_NAC
	FROM gd_esquema.Maestra m
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_inquilino AS
BEGIN
	INSERT INTO DELOREAN_V2.inquilino
	SELECT DISTINCT
		m.ALQUILER_CODIGO,
		m.INQUILINO_NOMBRE,
		m.INQUILINO_APELLIDO,
		m.INQUILINO_DNI,
		m.INQUILINO_FECHA_REGISTRO,
		m.INQUILINO_FECHA_NAC,
		m.INQUILINO_MAIL,
		m.INQUILINO_TELEFONO
	FROM gd_esquema.Maestra m
	WHERE m.INQUILINO_NOMBRE IS NOT NULL AND m.INQUILINO_APELLIDO IS NOT NULL AND
		  m.INQUILINO_DNI IS NOT NULL AND m.INQUILINO_FECHA_REGISTRO IS NOT NULL AND
		  m.INQUILINO_FECHA_NAC IS NOT NULL AND m.INQUILINO_MAIL IS NOT NULL AND
		  m.INQUILINO_TELEFONO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_inmueble AS
BEGIN
	INSERT INTO DELOREAN_V2.inmueble
	SELECT DISTINCT
		m.INMUEBLE_CODIGO,
		DELOREAN_V2.identificador_cantidad_ambientes(m.INMUEBLE_CANT_AMBIENTES),
		DELOREAN_V2.identificador_tipo_inmueble(m.INMUEBLE_TIPO_INMUEBLE),
		DELOREAN_V2.identificador_orientacion_inmueble(m.INMUEBLE_ORIENTACION),
		DELOREAN_V2.identificador_disposicion_inmueble(m.INMUEBLE_DISPOSICION),
		DELOREAN_V2.identificador_estado_inmueble(m.INMUEBLE_ESTADO),
		DELOREAN_V2.identificador_barrio(m.INMUEBLE_BARRIO, m.INMUEBLE_LOCALIDAD, m.INMUEBLE_PROVINCIA),
		DELOREAN_V2.identificador_propietario(m.PROPIETARIO_NOMBRE, m.PROPIETARIO_APELLIDO, m.PROPIETARIO_DNI),
		m.INMUEBLE_DESCRIPCION,
		m.INMUEBLE_SUPERFICIETOTAL,
		m.INMUEBLE_ANTIGUEDAD,
		m.INMUEBLE_NOMBRE,
		m.INMUEBLE_DIRECCION,
		m.INMUEBLE_EXPESAS
	FROM gd_esquema.Maestra m
	WHERE m.INMUEBLE_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_anuncio AS
BEGIN
	INSERT INTO DELOREAN_V2.anuncio
	SELECT DISTINCT
		m.ANUNCIO_CODIGO,
		DELOREAN_V2.identificador_agente(m.AGENTE_NOMBRE, m.AGENTE_APELLIDO, m.AGENTE_DNI),
		m.INMUEBLE_CODIGO,
		DELOREAN_V2.identificador_estado_anuncio(m.ANUNCIO_ESTADO),
		DELOREAN_V2.identificador_moneda(m.ANUNCIO_MONEDA),
		DELOREAN_V2.identificador_tipo_operacion(m.ANUNCIO_TIPO_OPERACION),
		m.ANUNCIO_TIPO_PERIODO,
		m.ANUNCIO_FECHA_PUBLICACION,
		m.ANUNCIO_FECHA_FINALIZACION,
		m.ANUNCIO_PRECIO_PUBLICADO,
		m.ANUNCIO_COSTO_ANUNCIO
	FROM gd_esquema.Maestra m
	WHERE m.ANUNCIO_CODIGO IS NOT NULL AND m.INMUEBLE_CODIGO IS NOT NULL
END
GO 

CREATE PROCEDURE DELOREAN_V2.migrar_venta AS
BEGIN
	INSERT INTO DELOREAN_V2.venta
	SELECT DISTINCT
		m.VENTA_CODIGO,
		m.ANUNCIO_CODIGO,
		DELOREAN_V2.identificador_comprador(m.COMPRADOR_NOMBRE, m.COMPRADOR_APELLIDO, m.COMPRADOR_DNI, m.COMPRADOR_MAIL),
		DELOREAN_V2.identificador_moneda(m.VENTA_MONEDA),
		m.VENTA_FECHA,
		m.VENTA_PRECIO_VENTA,
		m.VENTA_COMISION
	FROM gd_esquema.Maestra m
	WHERE m.VENTA_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_estado_alquiler AS
BEGIN
	INSERT INTO DELOREAN_V2.estado_alquiler
	SELECT DISTINCT
		m.ALQUILER_ESTADO
	FROM gd_esquema.Maestra m
	WHERE m.ALQUILER_ESTADO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_alquiler AS
BEGIN
	INSERT INTO DELOREAN_V2.alquiler
	SELECT DISTINCT
		m.ALQUILER_CODIGO,
		m.ANUNCIO_CODIGO,
		DELOREAN_V2.identificador_estado_alquiler(m.ALQUILER_ESTADO),
		m.ALQUILER_FECHA_INICIO,
		m.ALQUILER_CANT_PERIODOS,
		m.ALQUILER_DEPOSITO,
		m.ALQUILER_COMISION,
		m.ALQUILER_GASTOS_AVERIGUA,
		m.ALQUILER_FECHA_FIN
	FROM gd_esquema.Maestra m
	WHERE m.ALQUILER_CODIGO IS NOT NULL
END
GO

CREATE PROCEDURE DELOREAN_V2.migrar_pago_alquiler AS
BEGIN 
	INSERT INTO DELOREAN_V2.pago_alquiler
	SELECT DISTINCT
		m.PAGO_ALQUILER_CODIGO,
		m.ALQUILER_CODIGO,
		DELOREAN_V2.identificador_medio_de_pago(m.PAGO_ALQUILER_MEDIO_PAGO),
		m.PAGO_ALQUILER_NRO_PERIODO,
		m.PAGO_ALQUILER_DESC,
		m.PAGO_ALQUILER_FECHA,
		m.PAGO_ALQUILER_FEC_INI,
		m.PAGO_ALQUILER_FEC_FIN,
		m.PAGO_ALQUILER_IMPORTE,
		m.PAGO_ALQUILER_FECHA_VENCIMIENTO
	FROM gd_esquema.Maestra m
	WHERE m.PAGO_ALQUILER_CODIGO IS NOT NULL
END
GO 

CREATE PROCEDURE DELOREAN_V2.migrar_caracteristicas_del_inmueble AS
BEGIN
	DECLARE cursor_caracteristicas CURSOR FOR
		SELECT DISTINCT m.INMUEBLE_CODIGO, m.INMUEBLE_CARACTERISTICA_CABLE, m.INMUEBLE_CARACTERISTICA_CALEFACCION, m.INMUEBLE_CARACTERISTICA_GAS, m.INMUEBLE_CARACTERISTICA_WIFI
			FROM gd_esquema.Maestra m
			WHERE m.INMUEBLE_CODIGO IS NOT NULL
	
	DECLARE @CODIGO NUMERIC(18, 0)
	DECLARE @CARAC_CABLE NUMERIC(18, 0)
	DECLARE @CARAC_CALEF NUMERIC(18, 0)
	DECLARE @CARAC_GAS NUMERIC(18, 0)
	DECLARE @CARAC_WIFI NUMERIC(18, 0)

	OPEN cursor_caracteristicas

	FETCH NEXT FROM cursor_caracteristicas INTO @CODIGO, @CARAC_CABLE, @CARAC_CALEF, @CARAC_GAS, @CARAC_WIFI

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @CARAC_CABLE = 1
		BEGIN
			INSERT INTO DELOREAN_V2.caracteristicas_del_inmueble
				VALUES(@CODIGO, DELOREAN_V2.identificador_caracteristicas('Cable'))
		END

		IF @CARAC_CALEF = 1
		BEGIN
			INSERT INTO DELOREAN_V2.caracteristicas_del_inmueble
				VALUES(@CODIGO, DELOREAN_V2.identificador_caracteristicas('Calefacción'))
		END

		IF @CARAC_GAS = 1
		BEGIN
			INSERT INTO DELOREAN_V2.caracteristicas_del_inmueble
				VALUES(@CODIGO, DELOREAN_V2.identificador_caracteristicas('Gas'))
		END

		IF @CARAC_WIFI = 1
		BEGIN
			INSERT INTO DELOREAN_V2.caracteristicas_del_inmueble
				VALUES(@CODIGO, DELOREAN_V2.identificador_caracteristicas('WiFi'))
		END

		FETCH NEXT FROM cursor_caracteristicas INTO @CODIGO, @CARAC_CABLE, @CARAC_CALEF, @CARAC_GAS, @CARAC_WIFI
	END

	CLOSE cursor_caracteristicas
	DEALLOCATE cursor_caracteristicas
END 
GO 

--------------------------
-- EJECUTAR MIGRACIONES --
--------------------------

BEGIN TRANSACTION

EXEC DELOREAN_V2.migrar_moneda;
EXEC DELOREAN_V2.migrar_estado_anuncio;
EXEC DELOREAN_V2.migrar_tipo_operacion;
EXEC DELOREAN_V2.migrar_medio_de_pago;
EXEC DELOREAN_V2.migrar_tipo_inmueble;
EXEC DELOREAN_V2.migrar_orientacion_inmueble;
EXEC DELOREAN_V2.migrar_estado_inmueble;
EXEC DELOREAN_V2.migrar_disposicion_inmueble;
EXEC DELOREAN_V2.migrar_provincia;
EXEC DELOREAN_V2.migrar_caracteristicas;
EXEC DELOREAN_V2.migrar_detalle_alquiler_importe;
EXEC DELOREAN_V2.migrar_ambientes_inmueble;
EXEC DELOREAN_V2.migrar_localidad;
EXEC DELOREAN_V2.migrar_barrio;
EXEC DELOREAN_V2.migrar_sucursal;
EXEC DELOREAN_V2.migrar_comprador;
EXEC DELOREAN_V2.migrar_pago_venta;
EXEC DELOREAN_V2.migrar_propietario;
EXEC DELOREAN_V2.migrar_agente;
EXEC DELOREAN_V2.migrar_inquilino;
EXEC DELOREAN_V2.migrar_inmueble;
EXEC DELOREAN_V2.migrar_anuncio;
EXEC DELOREAN_V2.migrar_venta;
EXEC DELOREAN_V2.migrar_estado_alquiler;
EXEC DELOREAN_V2.migrar_alquiler;
EXEC DELOREAN_V2.migrar_pago_alquiler;
EXEC DELOREAN_V2.migrar_caracteristicas_del_inmueble;

COMMIT TRANSACTION

-----------------------------
-- ELIMINAR PROCEDIMIENTOS --
-----------------------------

DROP PROCEDURE DELOREAN_V2.migrar_moneda;
DROP PROCEDURE DELOREAN_V2.migrar_disposicion_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_estado_anuncio;
DROP PROCEDURE DELOREAN_V2.migrar_estado_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_medio_de_pago;
DROP PROCEDURE DELOREAN_V2.migrar_orientacion_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_provincia;
DROP PROCEDURE DELOREAN_V2.migrar_tipo_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_tipo_operacion;
DROP PROCEDURE DELOREAN_V2.migrar_caracteristicas;
DROP PROCEDURE DELOREAN_V2.migrar_detalle_alquiler_importe;
DROP PROCEDURE DELOREAN_V2.migrar_agente;
DROP PROCEDURE DELOREAN_V2.migrar_ambientes_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_anuncio;
DROP PROCEDURE DELOREAN_V2.migrar_barrio;
DROP PROCEDURE DELOREAN_V2.migrar_comprador;
DROP PROCEDURE DELOREAN_V2.migrar_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_inquilino;
DROP PROCEDURE DELOREAN_V2.migrar_venta;
DROP PROCEDURE DELOREAN_V2.migrar_localidad;
DROP PROCEDURE DELOREAN_V2.migrar_pago_venta;
DROP PROCEDURE DELOREAN_V2.migrar_propietario;
DROP PROCEDURE DELOREAN_V2.migrar_sucursal;
DROP PROCEDURE DELOREAN_V2.migrar_estado_alquiler;
DROP PROCEDURE DELOREAN_V2.migrar_alquiler;
DROP PROCEDURE DELOREAN_V2.migrar_caracteristicas_del_inmueble;
DROP PROCEDURE DELOREAN_V2.migrar_pago_alquiler;

------------------------
-- ELIMINAR FUNCIONES --
------------------------

DROP FUNCTION DELOREAN_V2.identificador_provincia;
DROP FUNCTION DELOREAN_V2.identificador_agente;
DROP FUNCTION DELOREAN_V2.identificador_barrio;
DROP FUNCTION DELOREAN_V2.identificador_estado_anuncio;
DROP FUNCTION DELOREAN_V2.identificador_localidad;
DROP FUNCTION DELOREAN_V2.identificador_medio_de_pago;
DROP FUNCTION DELOREAN_V2.identificador_moneda;
DROP FUNCTION DELOREAN_V2.identificador_tipo_operacion;
DROP FUNCTION DELOREAN_V2.identificador_comprador;
DROP FUNCTION DELOREAN_V2.identificador_detalle_alquiler;
DROP FUNCTION DELOREAN_V2.identificador_estado_alquiler;
DROP FUNCTION DELOREAN_V2.identificador_pago_venta;
DROP FUNCTION DELOREAN_V2.identificador_cantidad_ambientes;
DROP FUNCTION DELOREAN_V2.identificador_caracteristicas;
DROP FUNCTION DELOREAN_V2.identificador_disposicion_inmueble;
DROP FUNCTION DELOREAN_V2.identificador_estado_inmueble;
DROP FUNCTION DELOREAN_V2.identificador_orientacion_inmueble;
DROP FUNCTION DELOREAN_V2.identificador_propietario;
DROP FUNCTION DELOREAN_V2.identificador_tipo_inmueble;

------------------
-- FOREIGN KEYS --
------------------

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_ambientes
FOREIGN KEY (id_ambientes) REFERENCES DELOREAN_V2.ambientes_inmueble(id_ambientes);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_tipo_inmueble
FOREIGN KEY (id_tipo_inmueble) REFERENCES DELOREAN_V2.tipo_inmueble(id_tipo_inmueble);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_orientacion
FOREIGN KEY (id_orientacion) REFERENCES DELOREAN_V2.orientacion_inmueble(id_orientacion);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_disposicion
FOREIGN KEY (id_disposicion) REFERENCES DELOREAN_V2.disposicion_inmueble(id_disposicion);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_estado
FOREIGN KEY (id_estado) REFERENCES DELOREAN_V2.estado_inmueble(id_estado);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_barrio
FOREIGN KEY (id_barrio) REFERENCES DELOREAN_V2.barrio(id_barrio);

ALTER TABLE DELOREAN_V2.inmueble
ADD CONSTRAINT FK_inmueble_propietario
FOREIGN KEY (id_propietario) REFERENCES DELOREAN_V2.propietario(id_propietario);

ALTER TABLE DELOREAN_V2.caracteristicas_del_inmueble
ADD CONSTRAINT FK_caracteristicas_inmueble
FOREIGN KEY (numero_inmueble) REFERENCES DELOREAN_V2.inmueble(numero_inmueble);

ALTER TABLE DELOREAN_V2.caracteristicas_del_inmueble
ADD CONSTRAINT FK_caracteristicas_caracteristica
FOREIGN KEY (id_caracteristica) REFERENCES DELOREAN_V2.caracteristicas(id_caracteristica);

ALTER TABLE DELOREAN_V2.anuncio
ADD CONSTRAINT FK_anuncio_agente
FOREIGN KEY (id_agente_inmobiliario) REFERENCES DELOREAN_V2.agente(id_agente_inmobiliario);

ALTER TABLE DELOREAN_V2.anuncio
ADD CONSTRAINT FK_anuncio_inmueble
FOREIGN KEY (numero_inmueble) REFERENCES DELOREAN_V2.inmueble(numero_inmueble);

ALTER TABLE DELOREAN_V2.anuncio
ADD CONSTRAINT FK_anuncio_estado
FOREIGN KEY (id_estado_anuncio) REFERENCES DELOREAN_V2.estado_anuncio(id_estado_anuncio);

ALTER TABLE DELOREAN_V2.anuncio
ADD CONSTRAINT FK_anuncio_moneda
FOREIGN KEY (id_moneda) REFERENCES DELOREAN_V2.moneda(id_moneda);

ALTER TABLE DELOREAN_V2.anuncio
ADD CONSTRAINT FK_anuncio_operacion
FOREIGN KEY (id_tipo_operacion) REFERENCES DELOREAN_V2.tipo_operacion(id_tipo_operacion);

ALTER TABLE DELOREAN_V2.venta
ADD CONSTRAINT FK_venta_anuncio
FOREIGN KEY (numero_de_anuncio) REFERENCES DELOREAN_V2.anuncio(numero_de_anuncio);

ALTER TABLE DELOREAN_V2.venta
ADD CONSTRAINT FK_venta_comprador
FOREIGN KEY (id_comprador) REFERENCES DELOREAN_V2.comprador(id_comprador);

ALTER TABLE DELOREAN_V2.venta
ADD CONSTRAINT FK_venta_moneda
FOREIGN KEY (id_moneada) REFERENCES DELOREAN_V2.moneda(id_moneda);

ALTER TABLE DELOREAN_V2.pago_venta
ADD CONSTRAINT FK_pago_venta_medio_pago
FOREIGN KEY (id_medio_pago) REFERENCES DELOREAN_V2.medio_de_pago(id_medio_de_pago);

ALTER TABLE DELOREAN_V2.pago_venta
ADD CONSTRAINT FK_pago_venta_moneda
FOREIGN KEY (id_moneda) REFERENCES DELOREAN_V2.moneda(id_moneda);

ALTER TABLE DELOREAN_V2.pago_venta
ADD CONSTRAINT FK_pago_venta_venta
FOREIGN KEY (codigo_de_venta) REFERENCES DELOREAN_V2.venta(codigo_de_venta);

ALTER TABLE DELOREAN_V2.alquiler
ADD CONSTRAINT FK_alquiler_anuncio
FOREIGN KEY (numero_de_anuncio) REFERENCES DELOREAN_V2.anuncio(numero_de_anuncio);

ALTER TABLE DELOREAN_V2.alquiler
ADD CONSTRAINT FK_alquiler_estado
FOREIGN KEY (id_estado_alquiler) REFERENCES DELOREAN_V2.estado_alquiler(id_estado_alquiler);

ALTER TABLE DELOREAN_V2.agente
ADD CONSTRAINT FK_agente_sucursal
FOREIGN KEY (id_sucursal) REFERENCES DELOREAN_V2.sucursal(id_sucursal);

ALTER TABLE DELOREAN_V2.sucursal
ADD CONSTRAINT FK_sucursal_localidad
FOREIGN KEY (id_localidad) REFERENCES DELOREAN_V2.localidad(id_localidad);

ALTER TABLE DELOREAN_V2.pago_alquiler
ADD CONSTRAINT FK_pago_alquiler_alquiler
FOREIGN KEY (codigo_de_alquiler) REFERENCES DELOREAN_V2.alquiler(codigo_de_alquiler);

ALTER TABLE DELOREAN_V2.pago_alquiler
ADD CONSTRAINT FK_pago_alquiler_medio_de_pago
FOREIGN KEY (id_medio_de_pago) REFERENCES DELOREAN_V2.medio_de_pago(id_medio_de_pago);

ALTER TABLE DELOREAN_V2.inquilino
ADD CONSTRAINT FK_inquilino_alquiler
FOREIGN KEY (codigo_alquiler) REFERENCES DELOREAN_V2.alquiler(codigo_de_alquiler);

ALTER TABLE DELOREAN_V2.localidad
ADD CONSTRAINT FK_localidad_provincia
FOREIGN KEY (id_provincia) REFERENCES DELOREAN_V2.provincia(id_provincia);

ALTER TABLE DELOREAN_V2.barrio
ADD CONSTRAINT FK_barrio_localidad
FOREIGN KEY (id_localidad) REFERENCES DELOREAN_V2.localidad(id_localidad);

ALTER TABLE DELOREAN_V2.detalle_alquiler_importe 
ADD CONSTRAINT FK_detalle_alquiler_alquiler
FOREIGN KEY (codigo_de_alquiler) REFERENCES DELOREAN_V2.alquiler(codigo_de_alquiler);