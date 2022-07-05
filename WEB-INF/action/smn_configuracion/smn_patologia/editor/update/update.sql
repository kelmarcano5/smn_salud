UPDATE smn_salud.smn_patologia SET
	pat_codigo=${fld:pat_codigo},
	pat_descripcion=${fld:pat_descripcion},
	pat_estatus=${fld:pat_estatus},
	pat_idioma='${def:locale}',
	pat_usuario='${def:user}',
	pat_fecha_registro={d '${def:date}'},
	pat_hora='${def:time}'

WHERE
	smn_patologia_id=${fld:id}

