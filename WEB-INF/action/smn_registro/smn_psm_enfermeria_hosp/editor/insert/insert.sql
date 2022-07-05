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
	psc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_prestacion_servicio_medico_cabecera},
	${fld:smn_ingresos_id},
	${fld:smn_mov_caja_cabecera_id},
	${fld:smn_unidades_servicios_rf},
	${fld:psc_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
