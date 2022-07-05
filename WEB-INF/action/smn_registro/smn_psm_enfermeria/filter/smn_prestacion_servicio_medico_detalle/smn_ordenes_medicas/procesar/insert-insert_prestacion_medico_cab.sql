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
	(select smn_base.smn_rel_servicio_area_unidad.smn_unidades_servicios_rf from smn_base.smn_rel_servicio_area_unidad where smn_base.smn_rel_servicio_area_unidad.smn_servicios_id=${fld:smn_servicios_rf}),
	'RE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'PE',
	0,
	(SELECT smn_base.smn_rel_grupo_prestador_servicio.smn_grupos_prestadores_id FROM smn_base.smn_rel_grupo_prestador_servicio where smn_base.smn_rel_grupo_prestador_servicio.smn_prestadores_servicios_id=${fld:smn_prestador_servicio_rf} limit 1)
) RETURNING smn_prestacion_servicio_medico_cabecera_id, ${fld:smn_ingreso_id} as smn_ingreso_id, ${fld:smn_servicios_rf} as smn_servicios_rf;
