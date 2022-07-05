UPDATE smn_salud.smn_citas SET
	smn_estatus_citas_id=4
WHERE
	smn_citas_id=${fld:id};

UPDATE smn_salud.smn_citas_mov SET
	ctm_estatus_id=4
WHERE
	smn_citas_id=${fld:id};


INSERT INTO smn_salud.smn_ingreso_cola_virtual
(
	smn_ingreso_cola_virtual_id,
	smn_entidad_rf,
	smn_sucursal_rf,
	smn_area_servicio_rf,
	smn_unidad_servicio_rf,
	smn_documento_id,
	smn_contratante_id,
	ivc_estatus_financiero,
	icv_numero_control,
	smn_serie_id,
	icv_numero_ticket,
	icv_fecha_registro_evento,
	icv_fecha_evento,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	smn_unidad_servicio_rf_pres,
	smn_grupo_prestador_rf,
	icv_observacion,
	icv_numero_documento_identidad,
	icv_idioma,
	icv_usuario,
	icv_fecha_registro,
	icv_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_ingreso_cola_virtual},
	(select smn_salud.smn_citas_mov.smn_entidades_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	(select smn_salud.smn_citas_mov.smn_sucursales_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	(select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	(select smn_salud.smn_citas_mov.smn_unidades_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	(select smn_salud.smn_citas_mov.smn_documento_id from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	(select smn_salud.smn_citas.smn_contratante_id from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
	'PE',
	0,
	'C',
	(select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'C'),
	{d '${def:date}'},
	{d '${def:date}'},
	(select smn_salud.smn_citas.cts_clase_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
	(select smn_salud.smn_citas.cts_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
	0,
	(select case when smn_salud.smn_citas_mov.smn_grupo_prestador_servicio_rf is null then 0 else smn_salud.smn_citas_mov.smn_grupo_prestador_servicio_rf end from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
	'CREACION DESDE CITAS',
	(select smn_base.smn_auxiliar.aux_codigo from smn_salud.smn_citas inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);

-- INSERT INTO smn_salud.smn_ruta_paciente
--     (

--        smn_ruta_id,
--         smn_clase_auxiliar_rf,
--         smn_auxiliar_rf,
--         rta_numero_documento_identidad,
--         smn_entidad_rf,
--         smn_sucursal_rf,
--         smn_area_servicio_rf,
--         smn_unidad_servicio_rf,
--         rta_estatus,
--         rta_secuencia,
--         smn_serie_id,
--         rta_ticket,
--         rta_hora_llegada_unidad,
--         rta_idioma,
--         rta_usuario,
--         rta_fecha_registro,
--         rta_hora

--     )
--     VALUES
--     (
--     ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
--     (select smn_salud.smn_citas.cts_clase_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
--     (select smn_salud.smn_citas.cts_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
--     (select smn_base.smn_auxiliar.aux_codigo from smn_salud.smn_citas inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
--     (select smn_salud.smn_citas_mov.smn_entidades_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
--     (select smn_salud.smn_citas_mov.smn_sucursales_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
--     (select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
-- 	(select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf= (select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1) and smn_salud.smn_series.sri_codigo='C' and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
--     'PE',
--     (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf= (select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1) and smn_salud.smn_series.sri_codigo='C' and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
--     'C',
--     (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'C'),
--     '${def:time}',
--     '${def:locale}',
--     '${def:user}',
--     {d '${def:date}'},
--     '${def:time}'
-- );

-- with rows as (
-- 	INSERT INTO smn_salud.smn_ruta_paciente
-- 	(

-- 	   smn_ruta_id,
-- 	    smn_clase_auxiliar_rf,
-- 	    smn_auxiliar_rf,
-- 	    rta_numero_documento_identidad,
-- 	    smn_entidad_rf,
-- 	    smn_sucursal_rf,
-- 	    smn_area_servicio_rf,
-- 	    smn_unidad_servicio_rf,
-- 	    rta_estatus,
-- 	    rta_secuencia,
-- 	    smn_serie_id,
-- 	    rta_ticket,
-- 	    rta_idioma,
-- 	    rta_usuario,
-- 	    rta_fecha_registro,
-- 	    rta_hora

-- 	)
-- 	VALUES
-- 	(
-- 	    ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
-- 	    (select smn_salud.smn_citas.cts_clase_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
-- 	    (select smn_salud.smn_citas.cts_auxiliar from smn_salud.smn_citas where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
-- 	    (select smn_base.smn_auxiliar.aux_codigo from smn_salud.smn_citas inner join smn_base.smn_auxiliar on smn_base.smn_auxiliar.smn_auxiliar_id = smn_salud.smn_citas.cts_auxiliar where smn_salud.smn_citas.smn_citas_id = ${fld:id}),
-- 	    (select smn_salud.smn_citas_mov.smn_entidades_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
-- 	    (select smn_salud.smn_citas_mov.smn_sucursales_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
-- 	    (select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1),
-- 	  	(select smn_salud.smn_relacion_unidad_paso.smn_unidad_servicio_rf from smn_salud.smn_relacion_unidad_paso LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=(select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1) and smn_salud.smn_series.sri_codigo='C' and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
-- 	    'PE',
-- 	  	(select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf(select smn_salud.smn_citas_mov.smn_areas_servicios_rf from smn_salud.smn_citas_mov where smn_salud.smn_citas_mov.smn_citas_mov_id=${fld:mov_id} and smn_salud.smn_citas_mov.smn_citas_id = ${fld:id} limit 1) and smn_salud.smn_series.sri_codigo='C' and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
-- 	   'C',
-- 	    (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'C'),
-- 	    '${def:locale}',
-- 	    '${def:user}',
-- 	    {d '${def:date}'},
-- 	    '${def:time}'
-- 	    )
-- 	    RETURNING rta_ticket, smn_serie_id
-- )
-- UPDATE smn_salud.smn_series set sri_ultimo_numero = rows.rta_ticket
-- FROM rows
--     where sri_codigo = rows.smn_serie_id
