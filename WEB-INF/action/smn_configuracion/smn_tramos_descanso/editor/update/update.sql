UPDATE smn_salud.smn_tramos_descanso SET
	smn_tramos_id=${fld:smn_tramos_id},
	trd_hora_descanso_desde=${fld:trd_hora_descanso_desde},
	trd_hora_descanso_hasta=${fld:trd_hora_descanso_hasta},
	trd_idioma='${def:locale}',
	trd_usuario_id='${def:user}',
	trd_fecha_registro={d '${def:date}'},
	trd_hora='${def:time}'

WHERE
	smn_tramo_descanso_id=${fld:id}

