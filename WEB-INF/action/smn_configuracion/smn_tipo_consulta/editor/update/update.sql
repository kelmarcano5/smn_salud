UPDATE smn_salud.smn_tipo_consulta SET
	tcs_codigo=${fld:tcs_codigo},
	tcs_nombre=${fld:tcs_nombre},
	tcs_idioma='${def:locale}',
	tcs_usuario_id='${def:user}',
	tcs_fecha_registro={d '${def:date}'},
	tcs_hora='${def:time}'

WHERE
	smn_tipo_consulta_id=${fld:id}

