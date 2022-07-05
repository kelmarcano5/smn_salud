UPDATE smn_salud.smn_prestacion_servicio_medico_detalle SET
	psd_estatus='AP',
	psd_idioma='${def:locale}',
	psd_usuario='${def:user}',
	psd_fecha_registro={d '${def:date}'},
	psd_hora='${def:time}'

WHERE
	smn_prestacion_servicio_medico_detalle_id=${fld:id}




