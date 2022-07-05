UPDATE smn_salud.smn_observaciones SET
	obs_codigo=${fld:obs_codigo},
	obs_descripcion=${fld:obs_descripcion},
	obs_tipo=${fld:obs_tipo},
	obs_idioma='${def:locale}',
	obs_usuario='${def:user}',
	obs_fecha_registro={d '${def:date}'},
	obs_hora='${def:time}'

WHERE
	smn_observaciones_id=${fld:id}

