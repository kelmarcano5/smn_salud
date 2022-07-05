UPDATE smn_salud.smn_rel_patologia_servicios SET
	smn_patologia_id=${fld:smn_patologia_id},
	smn_servicio_rf=${fld:smn_servicio_rf},
	rps_cantidad=${fld:rps_cantidad},
	rps_idioma='${def:locale}',
	rps_usuario_id='${def:user}',
	rps_fecha_registro={d '${def:date}'},
	rps_hora='${def:time}'

WHERE
	smn_rel_patologia_servicios_id=${fld:id}

