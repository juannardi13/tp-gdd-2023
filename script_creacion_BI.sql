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

-----------------------------------
-- Borrado de Tablas y de vistas --
-----------------------------------

IF OBJECT_ID('DELOREAN_V2.BI_tiempo', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_tiempo
IF OBJECT_ID('DELOREAN_V2.BI_ambientes', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_ambientes
IF OBJECT_ID('DELOREAN_V2.BI_tipo_inmueble', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_tipo_inmueble
IF OBJECT_ID('DELOREAN_V2.BI_rango_m2', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_rango_m2
IF OBJECT_ID('DELOREAN_V2.BI_tipo_operacion', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_tipo_operacion
IF OBJECT_ID('DELOREAN_V2.BI_ubicacion', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_ubicacion
IF OBJECT_ID('DELOREAN_V2.BI_tipo_moneda', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_tipo_moneda
IF OBJECT_ID('DELOREAN_V2.BI_rango_etario', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_rango_etario
IF OBJECT_ID('DELOREAN_V2.BI_sucursal', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_sucursal
IF OBJECT_ID('DELOREAN_V2.BI_estado_alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_estado_alquiler

IF OBJECT_ID('DELOREAN_V2.BI_anuncio', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_anuncio
IF OBJECT_ID('DELOREAN_V2.BI_alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_alquiler
IF OBJECT_ID('DELOREAN_V2.BI_pago_alquiler', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_pago_alquiler
IF OBJECT_ID('DELOREAN_V2.BI_venta', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_venta
IF OBJECT_ID('DELOREAN_V2.BI_operacion', 'U') IS NOT NULL DROP TABLE DELOREAN_V2.BI_operacion

IF OBJECT_ID('DELOREAN_V2.vista_duracion_promedio_anuncios', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_duracion_promedio_anuncios
IF OBJECT_ID('DELOREAN_V2.vista_precio_promedio_anuncios', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_precio_promedio_anuncios
IF OBJECT_ID('DELOREAN_V2.vista_5_barrios_mas_elegidos', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_5_barrios_mas_elegidos
IF OBJECT_ID('DELOREAN_V2.vista_porcentaje_de_incumplimiento_de_alquileres_a_termino', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_porcentaje_de_incumplimiento_de_alquileres_a_termino
IF OBJECT_ID('DELOREAN_V2.vista_porcentaje_promedio_de_incremento_de_alquiler', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_porcentaje_promedio_de_incremento_de_alquiler
IF OBJECT_ID('DELOREAN_V2.vista_precio_promedio_m2', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_precio_promedio_m2
IF OBJECT_ID('DELOREAN_V2.vista_valor_promedio_comision', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_valor_promedio_comision
IF OBJECT_ID('DELOREAN_V2.vista_porcentaje_operaciones_concretadas', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_porcentaje_operaciones_concretadas
IF OBJECT_ID('DELOREAN_V2.vista_monto_total_cierre_contratos_por_operacion', 'V') IS NOT NULL DROP VIEW DELOREAN_V2.vista_monto_total_cierre_contratos_por_operacion

IF OBJECT_ID('DELOREAN_V2.comision_segun_operacion', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.comision_segun_operacion
IF OBJECT_ID('DELOREAN_V2.fecha_segun_operacion', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.fecha_segun_operacion
IF OBJECT_ID('DELOREAN_V2.funcion_aumento_alquiler', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_aumento_alquiler
IF OBJECT_ID('DELOREAN_V2.funcion_cuatrimestre', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_cuatrimestre
IF OBJECT_ID('DELOREAN_V2.funcion_id_rango', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_id_rango
IF OBJECT_ID('DELOREAN_V2.funcion_id_tiempo', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_id_tiempo
IF OBJECT_ID('DELOREAN_V2.funcion_mes', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_mes
IF OBJECT_ID('DELOREAN_V2.funcion_pago_atrasado', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_pago_atrasado
IF OBJECT_ID('DELOREAN_V2.funcion_rango_etario', 'FN') IS NOT NULL DROP FUNCTION DELOREAN_V2.funcion_rango_etario

IF OBJECT_ID('DELOREAN_V2.cargar_datos', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.cargar_datos
IF OBJECT_ID('DELOREAN_V2.cargar_datos_hechos', 'P') IS NOT NULL DROP PROCEDURE DELOREAN_V2.cargar_datos_hechos

-----------------------------
-- Creación de Dimensiones --
-----------------------------

CREATE TABLE DELOREAN_V2.BI_tiempo 
(
	id_tiempo NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	anio NUMERIC(18, 0),
	mes NUMERIC(18, 0),
	cuatrimestre NUMERIC(18, 0)
)
GO

CREATE TABLE DELOREAN_V2.BI_ambientes
(
	id_ambientes NUMERIC(18, 0) PRIMARY KEY,
	cant_ambientes VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_tipo_inmueble
(
	id_tipo_inmueble NUMERIC(18, 0) PRIMARY KEY,
	tipo_inmueble VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_rango_m2
(
	id_rango NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	rango VARCHAR(10)
)
GO

CREATE TABLE DELOREAN_V2.BI_tipo_operacion
(
	id_tipo_operacion NUMERIC(18, 0) PRIMARY KEY,
	tipo_operacion VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_ubicacion
(
	id_ubicacion NUMERIC(18, 0) PRIMARY KEY,
	barrio VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_tipo_moneda
(
	id_moneda NUMERIC(18, 0) PRIMARY KEY,
	moneda VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_rango_etario
(
	id_rango_etario NUMERIC(18, 0) IDENTITY(1, 1) PRIMARY KEY,
	rango_etario VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_sucursal
(
	id_sucursal NUMERIC(18, 0) PRIMARY KEY,
	nombre VARCHAR(100)
)
GO

CREATE TABLE DELOREAN_V2.BI_estado_alquiler
(
	id_estado_alquiler NUMERIC(18, 0) PRIMARY KEY,
	estado_alquiler VARCHAR(100)
)
GO

--------------------
-- Carga de Datos --
--------------------

CREATE PROCEDURE DELOREAN_V2.cargar_datos AS
BEGIN
INSERT INTO DELOREAN_V2.BI_rango_m2 (rango)
VALUES ('<35'), ('35-55'), ('55-75'), ('75-100'), ('> 100')

INSERT INTO DELOREAN_V2.BI_rango_etario (rango_etario)
VALUES ('< 25'), ('25 - 35'), ('35 - 50'), ('> 50')

INSERT INTO DELOREAN_V2.BI_tiempo
SELECT DISTINCT
	YEAR(fecha_de_publicacion),
	DATEPART(MONTH, fecha_de_publicacion),
	DATEPART(QUARTER, fecha_de_publicacion)
FROM DELOREAN_V2.anuncio
UNION
SELECT DISTINCT
	YEAR(fecha_de_finalizacion),
	DATEPART(MONTH, fecha_de_finalizacion),
	DATEPART(QUARTER, fecha_de_finalizacion)
FROM DELOREAN_V2.anuncio
UNION
SELECT DISTINCT
	YEAR(fecha_de_nacimiento),
	DATEPART(MONTH, fecha_de_nacimiento),
	DATEPART(QUARTER, fecha_de_nacimiento)
FROM DELOREAN_V2.propietario
UNION
SELECT DISTINCT
	YEAR(fecha_de_registro),
	DATEPART(MONTH, fecha_de_registro),
	DATEPART(QUARTER, fecha_de_registro)
FROM DELOREAN_V2.propietario
UNION
SELECT DISTINCT
	YEAR(fecha_de_registro),
	DATEPART(MONTH, fecha_de_registro),
	DATEPART(QUARTER, fecha_de_registro)
FROM DELOREAN_V2.agente
UNION
SELECT DISTINCT
	YEAR(fecha_de_nacimiento),
	DATEPART(MONTH, fecha_de_nacimiento),
	DATEPART(QUARTER, fecha_de_nacimiento)
FROM DELOREAN_V2.agente
UNION
SELECT DISTINCT
	YEAR(fecha_venta),
	DATEPART(MONTH, fecha_venta),
	DATEPART(QUARTER, fecha_venta)
FROM DELOREAN_V2.venta
UNION
SELECT DISTINCT
	YEAR(fecha_de_registro),
	DATEPART(MONTH, fecha_de_registro),
	DATEPART(QUARTER, fecha_de_registro)
FROM DELOREAN_V2.comprador
UNION 
SELECT DISTINCT
	YEAR(fecha_de_nacimiento),
	DATEPART(MONTH, fecha_de_nacimiento),
	DATEPART(QUARTER, fecha_de_nacimiento)
FROM DELOREAN_V2.comprador
UNION
SELECT DISTINCT
	YEAR(fecha_de_inicio),
	DATEPART(MONTH, fecha_de_inicio),
	DATEPART(QUARTER, fecha_de_inicio)
FROM DELOREAN_V2.alquiler
UNION
SELECT DISTINCT
	YEAR(fecha_de_finalizacion),
	DATEPART(MONTH, fecha_de_finalizacion),
	DATEPART(QUARTER, fecha_de_finalizacion)
FROM DELOREAN_V2.anuncio
UNION
SELECT DISTINCT
	YEAR(fecha_de_registro),
	DATEPART(MONTH, fecha_de_registro),
	DATEPART(QUARTER, fecha_de_registro)
FROM DELOREAN_V2.inquilino
UNION
SELECT DISTINCT
	YEAR(fecha_de_nacimiento),
	DATEPART(MONTH, fecha_de_nacimiento),
	DATEPART(QUARTER, fecha_de_nacimiento)
FROM DELOREAN_V2.inquilino
UNION
SELECT DISTINCT
	YEAR(fecha_de_pago),
	DATEPART(MONTH, fecha_de_pago),
	DATEPART(QUARTER, fecha_de_pago)
FROM DELOREAN_V2.pago_alquiler
UNION
SELECT DISTINCT
	YEAR(fecha_de_vencimiento),
	DATEPART(MONTH, fecha_de_vencimiento),
	DATEPART(QUARTER, fecha_de_vencimiento)
FROM DELOREAN_V2.pago_alquiler
UNION
SELECT DISTINCT
	YEAR(fecha_fin_periodo),
	DATEPART(MONTH, fecha_fin_periodo),
	DATEPART(QUARTER, fecha_fin_periodo)
FROM DELOREAN_V2.pago_alquiler
UNION
SELECT DISTINCT
	YEAR(fecha_inicio_periodo),
	DATEPART(MONTH, fecha_inicio_periodo),
	DATEPART(QUARTER, fecha_inicio_periodo)
FROM DELOREAN_V2.pago_alquiler

INSERT INTO DELOREAN_V2.BI_ambientes
SELECT id_ambientes, descripcion
FROM DELOREAN_V2.ambientes_inmueble

INSERT INTO DELOREAN_V2.BI_tipo_inmueble
SELECT id_tipo_inmueble, descripcion
FROM DELOREAN_V2.tipo_inmueble

INSERT INTO DELOREAN_V2.BI_tipo_operacion
SELECT id_tipo_operacion, descripcion
FROM DELOREAN_V2.tipo_operacion

INSERT INTO DELOREAN_V2.BI_ubicacion
SELECT id_barrio, b.nombre + ', ' + l.nombre + ', ' + p.nombre
FROM DELOREAN_V2.barrio b JOIN DELOREAN_V2.localidad l ON (b.id_localidad = l.id_localidad)
						  JOIN DELOREAN_V2.provincia p ON (l.id_provincia = p.id_provincia)

INSERT INTO DELOREAN_V2.BI_tipo_moneda
SELECT id_moneda, descripcion
FROM DELOREAN_V2.moneda

INSERT INTO DELOREAN_V2.BI_sucursal
SELECT id_sucursal, nombre
FROM DELOREAN_V2.sucursal

INSERT INTO DELOREAN_V2.BI_estado_alquiler
SELECT id_estado_alquiler,
	   descripcion_estado
FROM DELOREAN_V2.estado_alquiler
END
GO

EXEC DELOREAN_V2.cargar_datos
GO

---------------------------
-- Creación de Funciones --
---------------------------

CREATE FUNCTION DELOREAN_V2.funcion_id_tiempo
(@FECHA DATETIME)
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @RETORNO NUMERIC(18, 0)
	DECLARE @ANIO NUMERIC(18, 0)
	DECLARE @MES NUMERIC(18, 0)
	DECLARE @CUATRIMESTRE NUMERIC(18, 0)

	SET @ANIO = YEAR(@FECHA)
	SET @MES = DATEPART(month, @FECHA)
	SET @CUATRIMESTRE = DATEPART(quarter, @FECHA)

	SET @RETORNO = (SELECT DISTINCT id_tiempo
						FROM DELOREAN_V2.BI_tiempo 
						WHERE anio = @ANIO AND mes = @MES AND
							  cuatrimestre = @CUATRIMESTRE)

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_id_rango
(@RANGO NUMERIC(18, 0))
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @RETORNO NUMERIC(18, 0)

	SET @RETORNO = (CASE
						WHEN @RANGO < 35 THEN (SELECT id_rango FROM DELOREAN_V2.BI_rango_m2 WHERE rango LIKE '<35')
						WHEN @RANGO BETWEEN 35 AND 54 THEN (SELECT id_rango FROM DELOREAN_V2.BI_rango_m2 WHERE rango LIKE '35-55')
						WHEN @RANGO BETWEEN 55 AND 74 THEN (SELECT id_rango FROM DELOREAN_V2.BI_rango_m2 WHERE rango LIKE '55-75')
						WHEN @RANGO BETWEEN 75 AND 100 THEN (SELECT id_rango FROM DELOREAN_V2.BI_rango_m2 WHERE rango LIKE '75-100')
						ELSE (SELECT id_rango FROM DELOREAN_V2.BI_rango_m2 WHERE rango LIKE '> 100')
					END)

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_cuatrimestre 
(@NUMERO_CUATRIMESTRE NUMERIC(18, 0))
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @RETORNO VARCHAR(20)

	IF @NUMERO_CUATRIMESTRE = 1
	BEGIN
		SET @RETORNO = '1er Cuatrimestre'
	END
	ELSE IF @NUMERO_CUATRIMESTRE = 2
	BEGIN
		SET @RETORNO = '2do Cuatrimestre'
	END
	ELSE IF @NUMERO_CUATRIMESTRE = 3
	BEGIN
		SET @RETORNO = '3er Cuatrimestre'
	END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_rango_etario
(@FECHA DATETIME)
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @EDAD NUMERIC(18, 0)
	DECLARE @RETORNO NUMERIC(18, 0)

	SET @EDAD = DATEDIFF(year, @FECHA, GETDATE())

	SET @RETORNO = CASE
					WHEN @EDAD < 25 THEN (SELECT id_rango_etario FROM DELOREAN_V2.BI_rango_etario WHERE rango_etario LIKE '< 25')
					WHEN @EDAD BETWEEN 25 AND 34 THEN (SELECT id_rango_etario FROM DELOREAN_V2.BI_rango_etario WHERE rango_etario LIKE '25 - 35')
					WHEN @EDAD BETWEEN 35 AND 49 THEN (SELECT id_rango_etario FROM DELOREAN_V2.BI_rango_etario WHERE rango_etario LIKE '35 - 50')
					ELSE (SELECT id_rango_etario FROM DELOREAN_V2.BI_rango_etario WHERE rango_etario LIKE '> 50')
				   END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.fecha_segun_operacion
(@FECHA1 DATETIME,
 @FECHA2 DATETIME)
RETURNS DATETIME
AS
BEGIN
	DECLARE @RETORNO DATETIME

	SET @RETORNO = CASE
						WHEN @FECHA1 IS NOT NULL THEN @FECHA1
						ELSE @FECHA2
					END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.comision_segun_operacion
(@COMISION1 NUMERIC(16, 2),
 @COMISION2 NUMERIC(16, 2))
RETURNS NUMERIC(16, 2)
AS
BEGIN
	DECLARE @RETORNO NUMERIC(16, 2)

	SET @RETORNO = CASE
						WHEN @COMISION1 IS NOT NULL THEN @COMISION1
						ELSE @COMISION2
					END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_aumento_alquiler
(@NUMERO_PERIODO NUMERIC(18, 0),
 @CODIGO_ALQUILER NUMERIC(18, 0),
 @PRECIO_PERIODO NUMERIC(16, 2))
RETURNS NUMERIC(16, 2)
AS
BEGIN
	DECLARE @RETORNO NUMERIC(16, 2)

	IF @NUMERO_PERIODO = 0
	BEGIN
		SET @RETORNO = 0
	END
	ELSE
	BEGIN
		DECLARE @PRECIO_ANTERIOR NUMERIC(16, 2)
		SET @PRECIO_ANTERIOR = (SELECT importe FROM DELOREAN_V2.pago_alquiler WHERE codigo_de_alquiler = @CODIGO_ALQUILER AND numero_de_periodo = @NUMERO_PERIODO - 1)
		SET @RETORNO = ((@PRECIO_PERIODO - @PRECIO_ANTERIOR) * 100) / @PRECIO_ANTERIOR
	END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_mes
(@NUMERO_MES NUMERIC(18, 0))
RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @RETORNO VARCHAR(20)

	SET @RETORNO = CASE
					WHEN @NUMERO_MES = 1 THEN 'Enero'
					WHEN @NUMERO_MES = 2 THEN 'Febrero'
					WHEN @NUMERO_MES = 3 THEN 'Marzo'
					WHEN @NUMERO_MES = 4 THEN 'Abril'
					WHEN @NUMERO_MES = 5 THEN 'Mayo'
					WHEN @NUMERO_MES = 6 THEN 'Junio'
					WHEN @NUMERO_MES = 7 THEN 'Julio'
					WHEN @NUMERO_MES = 8 THEN 'Agosto'
					WHEN @NUMERO_MES = 9 THEN 'Septiembre'
					WHEN @NUMERO_MES = 10 THEN 'Octubre'
					WHEN @NUMERO_MES = 11 THEN 'Noviembre'
					ELSE 'Diciembre'
				   END

	RETURN @RETORNO
END
GO

CREATE FUNCTION DELOREAN_V2.funcion_pago_atrasado
(@FECHA_PAGO DATETIME,
 @FECHA_VENCIMIENTO DATETIME)
RETURNS NUMERIC(18, 0)
AS
BEGIN
	DECLARE @RETORNO NUMERIC(18, 0)

	IF @FECHA_PAGO > @FECHA_VENCIMIENTO
	BEGIN
		SET @RETORNO = 1
	END
	ELSE
	BEGIN
		SET @RETORNO = 0
	END

	RETURN @RETORNO
END
GO

----------------------------------
-- Creación de Tablas de Hechos --
----------------------------------

CREATE TABLE DELOREAN_V2.BI_anuncio
(
	id_tiempo NUMERIC(18, 0) NOT NULL, --FK
	id_tipo_operacion NUMERIC(18, 0) NOT NULL, --FK
	id_ambientes NUMERIC(18, 0) NOT NULL, --FK
	id_ubicacion NUMERIC(18, 0) NOT NULL, --FK
	id_moneda NUMERIC(18, 0) NOT NULL, --FK
	id_rango NUMERIC(18, 0) NOT NULL, --FK
	id_tipo_inmueble NUMERIC(18, 0) NOT NULL, --FK
	duracion_anuncio_promedio NUMERIC(16, 2),
	precio_publicado_promedio NUMERIC(16, 2),
	CONSTRAINT PK_BI_anuncio PRIMARY KEY(id_tiempo, id_tipo_operacion, id_ambientes, id_ubicacion, id_moneda, id_rango, id_tipo_inmueble)
)
GO

CREATE TABLE DELOREAN_V2.BI_alquiler
(
	id_tiempo NUMERIC(18, 0) NOT NULL, --FK
	id_rango_etario NUMERIC(18, 0) NOT NULL, --FK
	id_ubicacion NUMERIC(18, 0) NOT NULL, --FK
	id_estado_alquiler NUMERIC(18, 0) NOT NULL, --FK
	cantidad_pagos NUMERIC(18, 0),
	cantidad_alquileres NUMERIC(18, 0),
	porcentaje_incumplimiento_pagos NUMERIC(16, 2)
	CONSTRAINT PK_BI_pago_alquiler PRIMARY KEY(id_rango_etario, id_tiempo, id_ubicacion, id_estado_alquiler)
)
GO

CREATE TABLE DELOREAN_V2.BI_pago_alquiler 
(
    id_tiempo NUMERIC(18, 0), 
	id_estado_alquiler NUMERIC(18, 0),
    promedio_aumento_alquiler NUMERIC(16, 2),
    cantidad_pagos NUMERIC(18, 0)
    CONSTRAINT PK_BI_hecho_pago_alquiler PRIMARY KEY (id_tiempo, id_estado_alquiler)
)
GO

CREATE TABLE DELOREAN_V2.BI_venta
(
	id_tiempo NUMERIC(18, 0) NOT NULL, --FK
	id_tipo_inmueble NUMERIC(18, 0) NOT NULL, --FK
	id_ubicacion NUMERIC(18, 0) NOT NULL, --FK
	precio_m2_promedio NUMERIC(16, 2)
	CONSTRAINT PK_BI_venta PRIMARY KEY(id_tiempo, id_ubicacion, id_tipo_inmueble)
)
GO

CREATE TABLE DELOREAN_V2.BI_operacion
(
	id_tiempo NUMERIC(18, 0) NOT NULL,
	id_tipo_operacion NUMERIC(18, 0), --FK
	id_moneda NUMERIC(18, 0), --FK
	id_sucursal NUMERIC(18, 0), --FK
	id_rango_etario NUMERIC(18, 0), --FK
	comision_promedio NUMERIC(16, 2),
	cantidad_operaciones_realizadas NUMERIC(18, 0),
	cantidad_operaciones_totales NUMERIC(18, 0),
	precio_operaciones_totales NUMERIC(16, 2)
	CONSTRAINT PK_BI_operacion PRIMARY KEY(id_rango_etario, id_tiempo, id_tipo_operacion, id_moneda, id_sucursal)
)
GO

----------------------------------------
-- Carga de datos en Tablas de Hechos --
----------------------------------------

CREATE PROCEDURE DELOREAN_V2.cargar_datos_hechos AS
BEGIN
INSERT INTO DELOREAN_V2.BI_anuncio
SELECT DELOREAN_V2.funcion_id_tiempo(fecha_de_publicacion),
	   BI_to.id_tipo_operacion,
	   BI_a.id_ambientes,
	   BI_u.id_ubicacion,
	   BI_m.id_moneda,
	   DELOREAN_V2.funcion_id_rango(i.superficie_total),
	   BI_t.id_tipo_inmueble,
	   AVG(DATEDIFF(day, a.fecha_de_publicacion, a.fecha_de_finalizacion)),
	   AVG(a.precio_publicado)
FROM DELOREAN_V2.anuncio a JOIN DELOREAN_V2.inmueble i ON (i.numero_inmueble = a.numero_inmueble)
						   JOIN DELOREAN_V2.moneda m ON (a.id_moneda = m.id_moneda)
						   JOIN DELOREAN_V2.BI_tipo_moneda BI_m ON (BI_m.moneda = m.descripcion)
						   JOIN DELOREAN_V2.tipo_inmueble ti ON (i.id_tipo_inmueble = ti.id_tipo_inmueble)
						   JOIN DELOREAN_V2.BI_tipo_inmueble BI_t ON (ti.descripcion = BI_t.tipo_inmueble)
						   JOIN DELOREAN_V2.tipo_operacion o ON (o.id_tipo_operacion = a.id_tipo_operacion)
						   JOIN DELOREAN_V2.BI_tipo_operacion BI_to ON (o.descripcion = BI_to.tipo_operacion)
						   JOIN DELOREAN_V2.ambientes_inmueble amb ON (amb.id_ambientes = i.id_ambientes)
						   JOIN DELOREAN_V2.BI_ambientes BI_a ON (BI_a.cant_ambientes = amb.descripcion)
						   JOIN DELOREAN_V2.barrio b ON (b.id_barrio = i.id_barrio)
						   JOIN DELOREAN_V2.BI_ubicacion BI_u ON (BI_u.id_ubicacion = b.id_barrio)
GROUP BY DELOREAN_V2.funcion_id_tiempo(fecha_de_publicacion), BI_to.id_tipo_operacion,
	     BI_a.id_ambientes, BI_u.id_ubicacion, BI_m.id_moneda, DELOREAN_V2.funcion_id_rango(i.superficie_total),
	     BI_t.id_tipo_inmueble


INSERT INTO DELOREAN_V2.BI_alquiler
SELECT DELOREAN_V2.funcion_id_tiempo(a.fecha_de_inicio),
	   DELOREAN_V2.funcion_rango_etario(i.fecha_de_nacimiento),
	   BI_u.id_ubicacion,
	   BI_e.id_estado_alquiler,
       COUNT(DISTINCT pa.codigo_de_pago),
	   COUNT(DISTINCT a.codigo_de_alquiler),
       SUM(CASE WHEN (DATEDIFF(DAY, pa.fecha_de_pago, pa.fecha_de_vencimiento) > 0) THEN 1 ELSE 0 END) / COUNT(*) * 100
FROM DELOREAN_V2.alquiler a JOIN DELOREAN_V2.inquilino i ON (a.codigo_de_alquiler = i.codigo_alquiler)
                            JOIN DELOREAN_V2.anuncio an ON (a.numero_de_anuncio = an.numero_de_anuncio)
							JOIN DELOREAN_V2.inmueble inm ON (an.numero_inmueble = inm.numero_inmueble)
							JOIN DELOREAN_V2.barrio b ON (inm.id_barrio = b.id_barrio)
							JOIN DELOREAN_V2.BI_ubicacion BI_u ON (BI_u.id_ubicacion = b.id_barrio)
							JOIN DELOREAN_V2.estado_alquiler ea ON (a.id_estado_alquiler = ea.id_estado_alquiler)
							JOIN DELOREAN_V2.BI_estado_alquiler BI_e ON (BI_e.estado_alquiler = ea.descripcion_estado)
							JOIN DELOREAN_V2.pago_alquiler pa ON (a.codigo_de_alquiler = pa.codigo_de_alquiler)
GROUP BY DELOREAN_V2.funcion_id_tiempo(a.fecha_de_inicio), DELOREAN_V2.funcion_rango_etario(i.fecha_de_nacimiento),
	   BI_u.id_ubicacion, BI_e.id_estado_alquiler


INSERT INTO DELOREAN_V2.BI_pago_alquiler
SELECT DELOREAN_V2.funcion_id_tiempo(pa.fecha_de_pago),
	   BI_e.id_estado_alquiler,
	   SUM((pa.importe - pant.importe) / pant.importe*100) / COUNT(*),
       COUNT(*)
FROM DELOREAN_V2.pago_alquiler pa JOIN DELOREAN_V2.alquiler alq ON (pa.codigo_de_alquiler = alq.codigo_de_alquiler)
								  JOIN DELOREAN_V2.estado_alquiler ea ON (alq.id_estado_alquiler = ea.id_estado_alquiler)
								  JOIN DELOREAN_V2.BI_estado_alquiler BI_e ON (ea.descripcion_estado = BI_e.estado_alquiler)
								  JOIN DELOREAN_V2.pago_alquiler pant ON (pant.codigo_de_alquiler = pa.codigo_de_alquiler 
								   AND YEAR(pant.fecha_de_pago) * 12 + 
								   MONTH(pant.fecha_de_pago) = YEAR(pa.fecha_de_pago) * 12 + MONTH(pa.fecha_de_pago) - 1 
								   AND pant.importe != pa.importe)
GROUP BY DELOREAN_V2.funcion_id_tiempo(pa.fecha_de_pago), BI_e.id_estado_alquiler

INSERT INTO DELOREAN_V2.BI_venta
SELECT DELOREAN_V2.funcion_id_tiempo(v.fecha_venta),
	   BI_t.id_tipo_inmueble,
	   BI_u.id_ubicacion,
	   AVG(v.precio_venta / i.superficie_total)
FROM DELOREAN_V2.venta v JOIN DELOREAN_V2.anuncio a ON (v.numero_de_anuncio = a.numero_de_anuncio)
						 JOIN DELOREAN_V2.inmueble i ON (a.numero_inmueble = i.numero_inmueble)
						 JOIN DELOREAN_V2.tipo_inmueble ti ON (i.id_tipo_inmueble = ti.id_tipo_inmueble)
						 JOIN DELOREAN_V2.BI_tipo_inmueble BI_t ON (ti.descripcion = BI_t.tipo_inmueble)
						 JOIN DELOREAN_V2.barrio b ON (i.id_barrio = b.id_barrio)
						 JOIN DELOREAN_V2.BI_ubicacion BI_u ON (BI_u.id_ubicacion = b.id_barrio)
GROUP BY DELOREAN_V2.funcion_id_tiempo(v.fecha_venta),
	   BI_t.id_tipo_inmueble,
	   BI_u.id_ubicacion


INSERT INTO DELOREAN_V2.BI_operacion
SELECT DELOREAN_V2.funcion_id_tiempo(a.fecha_de_publicacion),
	   BI_t.id_tipo_operacion,
	   BI_m.id_moneda,
	   BI_s.id_sucursal,
	   DELOREAN_V2.funcion_rango_etario(ag.fecha_de_nacimiento),
	   AVG(DELOREAN_V2.comision_segun_operacion(v.comision, alq.comision)),
	   SUM(CASE WHEN alq.codigo_de_alquiler IS NOT NULL OR v.codigo_de_venta IS NOT NULL THEN 1 ELSE 0 END),
	   COUNT(DISTINCT a.numero_de_anuncio),
	   SUM(CASE WHEN alq.codigo_de_alquiler IS NOT NULL OR v.codigo_de_venta IS NOT NULL THEN a.precio_publicado ELSE 0 END)
FROM DELOREAN_V2.anuncio a JOIN DELOREAN_V2.tipo_operacion o ON (a.id_tipo_operacion = o.id_tipo_operacion)
						   JOIN DELOREAN_V2.BI_tipo_operacion BI_t ON (o.descripcion = BI_t.tipo_operacion)
						   JOIN DELOREAN_V2.moneda m ON (a.id_moneda = m.id_moneda)
						   JOIN DELOREAN_V2.BI_tipo_moneda BI_m ON (BI_m.moneda = m.descripcion)
						   JOIN DELOREAN_V2.agente ag ON (ag.id_agente_inmobiliario = a.id_agente_inmobiliario)
						   JOIN DELOREAN_V2.sucursal s ON (ag.id_sucursal = s.id_sucursal)
						   JOIN DELOREAN_V2.BI_sucursal BI_s ON (BI_s.nombre = s.nombre)
						   LEFT JOIN DELOREAN_V2.venta v ON (v.numero_de_anuncio = a.numero_de_anuncio)
						   LEFT JOIN DELOREAN_V2.alquiler alq ON (alq.numero_de_anuncio = a.numero_de_anuncio)
GROUP BY DELOREAN_V2.funcion_id_tiempo(a.fecha_de_publicacion), BI_t.id_tipo_operacion, BI_m.id_moneda,
	   BI_s.id_sucursal, DELOREAN_V2.funcion_rango_etario(ag.fecha_de_nacimiento)
END 
GO

EXEC DELOREAN_V2.cargar_datos_hechos
GO

------------------------
-- Creación de vistas --
------------------------

CREATE VIEW DELOREAN_V2.vista_duracion_promedio_anuncios AS
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre) AS cuatrimestre,
	   op.tipo_operacion AS tipo_operacion,
	   b.barrio AS barrio,
	   amb.cant_ambientes AS cantidad_ambientes,
	   REPLACE(CONVERT(VARCHAR, CAST((AVG(a.duracion_anuncio_promedio)) AS DECIMAL(10,2))), '.00', '') AS promedio_dias
FROM DELOREAN_V2.BI_anuncio a JOIN DELOREAN_V2.BI_tiempo t ON (a.id_tiempo = t.id_tiempo)
							  JOIN DELOREAN_V2.BI_tipo_operacion op ON (a.id_tipo_operacion = op.id_tipo_operacion)
							  JOIN DELOREAN_V2.BI_ubicacion b ON (a.id_ubicacion = b.id_ubicacion)
							  JOIN DELOREAN_V2.BI_ambientes amb ON (a.id_ambientes = amb.id_ambientes)
GROUP BY t.anio, DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre), op.tipo_operacion, b.barrio, amb.cant_ambientes
GO

CREATE VIEW DELOREAN_V2.vista_precio_promedio_anuncios AS
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_cuatrimestre(cuatrimestre) AS cuatrimestre,
	   op.tipo_operacion AS tipo_operacion,
	   i.tipo_inmueble AS tipo_inmueble,
	   r.rango AS rango_m2,
	   '$ ' + REPLACE(CONVERT(VARCHAR, CAST((AVG(a.precio_publicado_promedio)) AS DECIMAL(10,2))), '.00', '') AS promedio_m2
FROM DELOREAN_V2.BI_anuncio a JOIN DELOREAN_V2.BI_tiempo t ON (a.id_tiempo = t.id_tiempo)
						      JOIN DELOREAN_V2.BI_tipo_operacion op ON (a.id_tipo_operacion = op.id_tipo_operacion)
						      JOIN DELOREAN_V2.BI_tipo_inmueble i ON (a.id_tipo_inmueble = i.id_tipo_inmueble)
							  JOIN DELOREAN_V2.BI_rango_m2 r ON (a.id_rango = r.id_rango)
GROUP BY t.anio, DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre), op.tipo_operacion, i.tipo_inmueble, r.rango
GO

CREATE VIEW DELOREAN_V2.vista_5_barrios_mas_elegidos AS
SELECT TOP 5
    t.anio,
    t.cuatrimestre,
	r.rango_etario,
    u.barrio,
    COUNT(*) AS cantAlquileres
FROM
    DELOREAN_V2.BI_alquiler a JOIN DELOREAN_V2.BI_tiempo t ON (a.id_tiempo = t.id_tiempo)
							  JOIN DELOREAN_V2.BI_rango_etario r ON (a.id_rango_etario = r.id_rango_etario)
							  JOIN DELOREAN_V2.BI_ubicacion u ON (a.id_ubicacion = u.id_ubicacion)
GROUP BY t.anio, t.cuatrimestre, r.rango_etario, u.barrio
ORDER BY cantAlquileres DESC
/*SELECT
    anio,
    cuatrimestre,
    rango_etario,
    barrio,
    cantidad_alquileres
FROM (
    SELECT
        anio,
        DELOREAN_V2.funcion_cuatrimestre(cuatrimestre) AS cuatrimestre,
        rango_etario,
        barrio,
        cantidad_alquileres,
        ROW_NUMBER() OVER (PARTITION BY anio, cuatrimestre, rango_etario ORDER BY cantidad_alquileres DESC) AS RankingBarrios
    FROM (
        SELECT
            t.anio,
            cuatrimestre,
            e.rango_etario,
            b.barrio,
            COUNT(DISTINCT al.id_alquiler) AS cantidad_alquileres
        FROM
            DELOREAN_V2.BI_pago_alquiler al
            JOIN DELOREAN_V2.BI_tiempo t ON (al.id_tiempo = t.id_tiempo)
            JOIN DELOREAN_V2.BI_rango_etario e ON (al.id_rango_etario = e.id_rango_etario)
            JOIN DELOREAN_V2.BI_ubicacion b ON (al.id_ubicacion = b.id_ubicacion)
        GROUP BY
            t.anio, cuatrimestre, e.rango_etario, b.barrio
    ) AS AlquileresPorBarrio
) AS RankedBarrios
WHERE
    RankingBarrios <= 5*/
GO

CREATE VIEW DELOREAN_V2.vista_porcentaje_de_incumplimiento_de_alquileres_a_termino AS
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_mes(t.mes) AS mes,
	   REPLACE(CONVERT(VARCHAR, CAST((SUM(a.porcentaje_incumplimiento_pagos * a.cantidad_pagos) / SUM(a.cantidad_pagos)) AS DECIMAL(10,2))), '.00', '') + '%'  AS porcentaje_incumplimiento
FROM DELOREAN_V2.BI_alquiler a JOIN DELOREAN_V2.BI_tiempo t ON (a.id_tiempo = t.id_tiempo)
GROUP BY t.anio, DELOREAN_V2.funcion_mes(t.mes)
GO

CREATE VIEW DELOREAN_V2.vista_porcentaje_promedio_de_incremento_de_alquiler AS 
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_mes(t.mes) AS mes,
	   REPLACE(CONVERT(VARCHAR, CAST((SUM(pa.promedio_aumento_alquiler * pa.cantidad_pagos) / SUM(pa.cantidad_pagos)) AS DECIMAL(10,2))), '.00', '') + '%' AS porcentaje_promedio_incremento_alquiler
FROM DELOREAN_V2.BI_pago_alquiler pa JOIN DELOREAN_V2.BI_tiempo t ON (pa.id_tiempo = t.id_tiempo)
--									 JOIN DELOREAN_V2.BI_estado_alquiler ea ON (pa.id_estado_alquiler = ea.id_estado_alquiler AND ea.estado_alquiler LIKE 'Activo')
GROUP BY t.anio, DELOREAN_V2.funcion_mes(t.mes)
-- HAVING SUM(pa.promedio_aumento_alquiler * pa.cantidad_pagos) / SUM(pa.cantidad_pagos) > 0
GO

CREATE VIEW DELOREAN_V2.vista_precio_promedio_m2 AS 
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_cuatrimestre(cuatrimestre) AS cuatrimestre,
	   ti.tipo_inmueble AS tipo_inmueble,
	   u.barrio AS barrio,
	   '$ ' + REPLACE(CONVERT(VARCHAR, CAST(v.precio_m2_promedio AS DECIMAL(10,2))), '.00', '') AS promedio_m2
FROM DELOREAN_V2.BI_venta v JOIN DELOREAN_V2.BI_tiempo t ON (v.id_tiempo = t.id_tiempo)
							JOIN DELOREAN_V2.BI_tipo_inmueble ti ON (v.id_tipo_inmueble = ti.id_tipo_inmueble)
							JOIN DELOREAN_V2.BI_ubicacion u ON (v.id_ubicacion = u.id_ubicacion)
GO

CREATE VIEW DELOREAN_V2.vista_valor_promedio_comision AS
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre) AS cuatrimestre,
	   tiop.tipo_operacion AS tipo_operacion,
	   s.nombre AS sucursal,
	   '$ ' + REPLACE(CONVERT(VARCHAR, CAST(AVG(o.comision_promedio) AS DECIMAL(10,2))), '.00', '') AS promedio_comision
FROM DELOREAN_V2.BI_operacion o JOIN DELOREAN_V2.BI_tiempo t ON (o.id_tiempo = t.id_tiempo)
								JOIN DELOREAN_V2.BI_tipo_operacion tiop ON (o.id_tipo_operacion = tiop.id_tipo_operacion)
								JOIN DELOREAN_V2.BI_sucursal s ON (o.id_sucursal = s.id_sucursal)
GROUP BY t.anio, DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre),
	   tiop.tipo_operacion, s.nombre
GO

CREATE VIEW DELOREAN_V2.vista_porcentaje_operaciones_concretadas AS 
SELECT t.anio AS anio,
	   s.nombre AS sucursal,
	   r.rango_etario AS rango_etario_agente,
	   REPLACE(CONVERT(VARCHAR, CAST((AVG(o.cantidad_operaciones_realizadas / cantidad_operaciones_totales) * 100) AS DECIMAL(10,2))), '.00', '') + '%' AS porcentaje_operaciones_concretadas
FROM DELOREAN_V2.BI_operacion o JOIN DELOREAN_V2.BI_tiempo t ON (o.id_tiempo = t.id_tiempo)
								JOIN DELOREAN_V2.BI_sucursal s ON (o.id_sucursal = s.id_sucursal)
								JOIN DELOREAN_V2.BI_rango_etario r ON (o.id_rango_etario = r.id_rango_etario)
GROUP BY t.anio, s.nombre, r.rango_etario
GO

CREATE VIEW DELOREAN_V2.vista_monto_total_cierre_contratos_por_operacion AS
SELECT t.anio AS anio,
	   DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre) AS cuatrimestre,
	   s.nombre AS sucursal,
	   tiop.tipo_operacion AS tipo_operacion,
	   m.moneda AS moneda,
	   '$ ' + REPLACE(CONVERT(VARCHAR, CAST(SUM(o.precio_operaciones_totales) AS DECIMAL(16,2))), '.00', '') AS monto_total
FROM DELOREAN_V2.BI_operacion o JOIN DELOREAN_V2.BI_tiempo t ON (o.id_tiempo = t.id_tiempo)
								JOIN DELOREAN_V2.BI_sucursal s ON (o.id_sucursal = s.id_sucursal)
								JOIN DELOREAN_V2.BI_tipo_operacion tiop ON (o.id_tipo_operacion = tiop.id_tipo_operacion)
								JOIN DELOREAN_V2.BI_tipo_moneda m ON (o.id_moneda = m.id_moneda)
GROUP BY t.anio, DELOREAN_V2.funcion_cuatrimestre(t.cuatrimestre), s.nombre, tiop.tipo_operacion, m.moneda
GO

-----------
-- Tests --
-----------

-- SELECT * FROM DELOREAN_V2.vista_duracion_promedio_anuncios
-- SELECT * FROM DELOREAN_V2.vista_precio_promedio_anuncios
-- SELECT * FROM DELOREAN_V2.vista_5_barrios_mas_elegidos
-- SELECT * FROM DELOREAN_V2.vista_porcentaje_de_incumplimiento_de_alquileres_a_termino
-- SELECT * FROM DELOREAN_V2.vista_porcentaje_promedio_de_incremento_de_alquiler
-- SELECT * FROM DELOREAN_V2.vista_precio_promedio_m2
-- SELECT * FROM DELOREAN_V2.vista_valor_promedio_comision
-- SELECT * FROM DELOREAN_V2.vista_porcentaje_operaciones_concretadas
-- SELECT * FROM DELOREAN_V2.vista_monto_total_cierre_contratos_por_operacion