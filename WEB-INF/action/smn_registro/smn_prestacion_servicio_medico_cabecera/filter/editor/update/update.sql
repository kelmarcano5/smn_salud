UPDATE smn_salud.smn_prestacion_servicio_medico_cabecera SET
	smn_ingresos_id=${fld:smn_ingresos_id},
	smn_mov_caja_cabecera_id=${fld:smn_mov_caja_cabecera_id},
	smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf},
	psc_estatus=${fld:psc_estatus},
	psc_idioma='${def:locale}',
	psc_usuario='${def:user}',
	psc_fecha_registro={d '${def:date}'},
	psc_hora='${def:time}'

WHERE
	smn_prestacion_servicio_medico_cabecera_id=${fld:id}

