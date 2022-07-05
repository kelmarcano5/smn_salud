UPDATE smn_salud.smn_ruta_paciente SET
	rta_estatus=${fld:rta_estatus},
	rta_observacion=${fld:rta_observacion},
	rta_idioma='${def:locale}',
	rta_usuario='${def:user}',
	rta_fecha_registro={d '${def:date}'},
	rta_hora='${def:time}'

WHERE
	smn_ruta_id=${fld:id}

