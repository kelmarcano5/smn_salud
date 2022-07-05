UPDATE smn_salud.smn_horario SET
	hor_codigo=${fld:hor_codigo},
	hor_descripcion=${fld:hor_descripcion},
	hor_status=${fld:hor_status},
	hor_idioma='${def:locale}',
	hor_usuario_id='${def:user}',
	hor_fecha_registro={d '${def:date}'},
	hor_hora='${def:time}'

WHERE
	smn_horarios_id=${fld:id}

