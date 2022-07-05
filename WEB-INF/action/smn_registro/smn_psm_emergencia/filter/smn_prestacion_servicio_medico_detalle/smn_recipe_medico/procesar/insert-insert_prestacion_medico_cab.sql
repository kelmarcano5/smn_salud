INSERT INTO smn_salud.smn_prestacion_servicio_medico_cabecera
(
	smn_prestacion_servicio_medico_cabecera_id,
	smn_ingresos_id,
	smn_mov_caja_cabecera_id,
	smn_unidades_servicios_rf,
	psc_estatus,
	psc_idioma,
	psc_usuario,
	psc_fecha_registro,
	psc_hora,
	psc_estatus_financiero,
	smn_prestador_servicio_rf,
	smn_grupo_prestador_rf
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_prestacion_servicio_medico_cabecera},
	${fld:smn_ingreso_id},
	0,
	(select smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf from smn_base.smn_rel_servicio_area_unidad where smn_base.smn_rel_servicio_area_unidad.smn_servicios_id=(select smn_salud.smn_documento.smn_servicio_med_rf from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id=${fld:smn_documento_id})),
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'PA',
	${fld:smn_prestador_servicio_rf},
	(select smn_base.smn_servicios.smn_clase_auxiliar_rf  as grupo_prestador from smn_base.smn_servicios where smn_base.smn_servicios.smn_servicios_id = (select smn_salud.smn_documento.smn_servicio_med_rf from smn_salud.smn_documento where smn_salud.smn_documento.smn_documento_id=${fld:smn_documento_id}))
) RETURNING smn_prestacion_servicio_medico_cabecera_id, ${fld:smn_ingreso_id} as smn_ingreso_id, ${fld:smn_documento_id} as smn_documento_id, ${fld:smn_recipe_medico_id} as smn_recipe_medico_id, ${fld:smn_prestador_servicio_rf} as smn_prestador_servicio_rf;
