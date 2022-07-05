UPDATE smn_salud.smn_observaciones_citas SET
	obc_codigo=${fld:obc_codigo},
	obc_descripcion=${fld:obc_descripcion},
	obc_idioma='${def:locale}',
	obc_usuario='${def:user}',
	obc_fecha_registro={d '${def:date}'},
	obc_hora='${def:time}'

WHERE
	smn_observaciones_citas_id=${fld:id}

