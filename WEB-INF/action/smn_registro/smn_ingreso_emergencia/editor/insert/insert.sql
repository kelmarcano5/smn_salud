INSERT INTO smn_salud.smn_ingresos
(
	smn_ingresos_id,
	smn_doc_orig,
	smn_documento_id,
	igs_doc_origen,
	igs_num_ingreso,
	smn_entidades_rf,
	smn_sucursales_rf,
	smn_areas_servicios_rf,
	smn_unidades_servicios_rf,
	ctm_observaciones_id,
	igs_ticket,
	smn_clase_rf,
	smn_auxiliar_rf,
	smn_contratante_id,
	smn_auxiliar_sucursales_rf,
	smn_auxiliar_areas_servicios_rf,
	smn_auxilia_unidad_servicio_rf,
	smn_motivos_id,
	smn_observaciones_ingresos_id,
	igs_monto_moneda_local,
	smn_moneda_rf,
	igs_monto_moneda_alterna,
	smn_sintoma_id,
	igs_estatus_financiero,
	igs_idioma,
	igs_usuario,
	igs_fecha_registro,
	igs_hora,
	smn_patologia_id,
	smn_prestador_servicio_rf,
	igs_numero_autorizacion,
	igs_fecha_ingreso,
	igs_dias_hospitalizacion,
	igs_fecha_salida,
	smn_activo_fijo,
	igs_monto_cobertura,
	igs_monto_cobertura_ma
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_ingresos},
	${fld:smn_doc_orig},
	${fld:smn_documento_id},
	${fld:igs_doc_origen},
	${seq:nextval@smn_salud.seq_smn_ingresos_numero},
	${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
	${fld:ctm_observaciones_id},
	${fld:igs_ticket},
	${fld:cts_clase_auxiliar},
	${fld:cts_auxiliar},
	${fld:smn_contratante_id},
	${fld:smn_auxiliar_sucursales_rf},
	${fld:smn_auxiliar_areas_servicios_rf},
	${fld:smn_auxilia_unidad_servicio_rf},
	${fld:smn_motivos_id},
	${fld:smn_observaciones_ingresos_id},
	0,
	0,
	0,
	${fld:smn_sintoma_id},
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',	
	${fld:smn_patologia_id},
	${fld:smn_prestador_servicio_rf},
	${fld:igs_numero_autorizacion},
	${fld:igs_fecha_ingreso},
	${fld:igs_dias_hospitalizacion},
	${fld:igs_fecha_salida},
	${fld:smn_activo_fijo_rf},
	0,
	0
);

with wor as (
	 select smn_salud.smn_rel_documentos_servicios.smn_servicios_id as servicios from smn_salud.smn_rel_documentos_servicios
 where smn_salud.smn_rel_documentos_servicios.smn_documentos_id = ${fld:smn_documento_id}

)
INSERT INTO smn_salud.smn_ingreso_movimiento (
	smn_ingresos_mov_id,
	smn_ingreso_id,
	smn_servicios_rf,
	smn_unidades_servicios_rf,
	smn_componente_rf,
	inm_accion,
	inm_cantidad,
	smn_tipo_consulta_rf,
	smn_grupo_prestador_servicio_rf,
	smn_prestador_servicio_rf,
	smn_motivos_id,
	smn_clase_auxiliar_rf,
	smn_auxiliar_rf,
	inm_ordenante_descripcion,
	smn_sintoma_id,
	inm_tipo_orden,
	inm_num_orden_medica,
	inm_estatus,
	inm_idioma,
	inm_usuario,
	inm_fecha_registro,
	inm_hora) 	
	SELECT 
		${seq:nextval@smn_salud.seq_smn_ingreso_movimiento},
		${seq:currval@smn_salud.seq_smn_ingresos},
		wor.servicios,
		(select smn_unidades_servicios_rf from smn_base.smn_rel_servicio_area_unidad where smn_base.smn_rel_servicio_area_unidad.smn_areas_servicios_rf = ${fld:smn_areas_servicios_rf} and smn_base.smn_rel_servicio_area_unidad.smn_servicios_id = wor.servicios),
		0,
		0,
		1,
		0,
		(select smn_base.smn_servicios.smn_clase_auxiliar_rf from smn_base.smn_servicios where smn_base.smn_servicios.smn_servicios_id=wor.servicios),
		0,
		0,
		0,
		0,
		0,
  		0,
  		'CO',
  		0,
  		'AC',
		'${def:locale}',
		'${def:user}',
		{d '${def:date}'},
		'${def:time}'		
	FROM wor;

INSERT INTO smn_salud.smn_ruta_paciente
    (

       	smn_ruta_id,
        smn_clase_auxiliar_rf,
        smn_auxiliar_rf,
        rta_numero_documento_identidad,
        smn_entidad_rf,
        smn_sucursal_rf,
        smn_area_servicio_rf,
        smn_unidad_servicio_rf,
        rta_estatus,
        rta_secuencia,
        smn_serie_id,
        rta_ticket,
        rta_idioma,
        rta_usuario,
        rta_fecha_registro,
        rta_hora,
        smn_contratante_id,
        smn_ingreso_id

    )
    VALUES
    (
    ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
    ${fld:cts_clase_auxiliar},
    ${fld:cts_auxiliar},
    (select smn_base.smn_auxiliar.aux_codigo from smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id=${fld:cts_auxiliar}),
    ${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
    'PE',
    (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_areas_servicios_rf} and smn_salud.smn_series.sri_codigo='EM' 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=1 limit 1),
    (select smn_salud.smn_series.smn_series_id from smn_salud.smn_series where smn_salud.smn_series.sri_codigo='EM'),
    (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'EM'),
    '${def:locale}',
    '${def:user}',
    {d '${def:date}'},
    '${def:time}',
    ${fld:smn_contratante_id},
    ${seq:currval@smn_salud.seq_smn_ingresos}
);


INSERT INTO smn_salud.smn_ruta_paciente
    (
       	smn_ruta_id,
        smn_clase_auxiliar_rf,
        smn_auxiliar_rf,
        rta_numero_documento_identidad,
        smn_entidad_rf,
        smn_sucursal_rf,
        smn_area_servicio_rf,
        smn_unidad_servicio_rf,
        rta_estatus,
        rta_secuencia,
        smn_serie_id,
        rta_ticket,
        rta_idioma,
        rta_usuario,
        rta_fecha_registro,
        rta_hora,
        smn_contratante_id,
        smn_ingreso_id
    )
    VALUES
    (
    ${seq:nextval@smn_salud.seq_smn_ruta_paciente},
    ${fld:cts_clase_auxiliar},
    ${fld:cts_auxiliar},
    (select smn_base.smn_auxiliar.aux_codigo from smn_base.smn_auxiliar where smn_base.smn_auxiliar.smn_auxiliar_id=${fld:cts_auxiliar}),
    ${fld:smn_entidades_rf},
	${fld:smn_sucursales_rf},
	${fld:smn_areas_servicios_rf},
	${fld:smn_unidades_servicios_rf},
    'PE',
    (select smn_salud.smn_relacion_unidad_paso.rup_secuencia from smn_salud.smn_relacion_unidad_paso
    LEFT OUTER JOIN smn_salud.smn_series on smn_salud.smn_series.smn_series_id = smn_salud.smn_relacion_unidad_paso.smn_serie_id
    where smn_salud.smn_relacion_unidad_paso.smn_area_servicio_rf=${fld:smn_areas_servicios_rf} and smn_salud.smn_series.sri_codigo='EM' 
    and smn_salud.smn_relacion_unidad_paso.rup_unidad_administrativa='AD' and smn_salud.smn_relacion_unidad_paso.rup_secuencia=2 limit 1),
    (select smn_salud.smn_series.smn_series_id from smn_salud.smn_series where smn_salud.smn_series.sri_codigo='EM'),
    (select sri_ultimo_numero from smn_salud.smn_series where sri_codigo = 'EM'),
    '${def:locale}',
    '${def:user}',
    {d '${def:date}'},
    '${def:time}',
    ${fld:smn_contratante_id},
    ${seq:currval@smn_salud.seq_smn_ingresos}
);


UPDATE smn_salud.smn_habitaciones SET hab_estatus='OC'
WHERE smn_salud.smn_habitaciones.smn_habitaciones_id=${fld:smn_activo_fijo_rf};


INSERT INTO smn_salud.smn_habitaciones_disponibles
(
	smn_habitaciones_disponibles_id,
	smn_habitaciones_id,
	smn_ingreso_id,
	had_fecha_ingreso,
	had_estatus,
	had_idioma,
	had_usuario,
	had_fecha_registro,
	had_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_habitaciones_disponibles},
	${fld:smn_activo_fijo_rf},
	${seq:currval@smn_salud.seq_smn_ingresos},
	{d '${def:date}'},
	'OC',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
);
