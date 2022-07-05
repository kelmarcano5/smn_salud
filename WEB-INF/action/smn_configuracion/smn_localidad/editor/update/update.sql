UPDATE smn_salud.smn_localidad SET
	loc_codigo=${fld:loc_codigo},
	loc_descripcion=${fld:loc_descripcion},
	loc_status=${fld:loc_status},
	loc_idioma='${def:locale}',
	loc_usuario_id='${def:user}',
	loc_fecha_registro={d '${def:date}'},
	loc_hora='${def:time}'

WHERE
	smn_localidad_id=${fld:id}

