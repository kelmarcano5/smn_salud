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
	(select smn_caja.smn_mov_caja_cabecera.smn_mov_caja_cabecera_id from smn_caja.smn_mov_caja_cabecera where smn_caja.smn_mov_caja_cabecera.smn_num_doc_origen_rf=(select smn_salud.smn_ingresos.igs_num_ingreso from smn_salud.smn_ingresos where smn_salud.smn_ingresos.smn_ingresos_id=${fld:smn_ingreso_id})),
	${fld:smn_unidades_servicios_rf},
	'PE',
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	'PE',
	${fld:smn_prestador_servicio_rf},
	${fld:smn_grupos_prestadores_id}
) RETURNING smn_prestacion_servicio_medico_cabecera_id, ${fld:smn_ingreso_id} as smn_ingreso_id, ${fld:smn_unidades_servicios_rf} as smn_unidades_servicios_rf, ${fld:smn_grupos_prestadores_id} as smn_grupos_prestadores_id, ${fld:smn_prestador_servicio_rf} as smn_prestador_servicio_rf;
