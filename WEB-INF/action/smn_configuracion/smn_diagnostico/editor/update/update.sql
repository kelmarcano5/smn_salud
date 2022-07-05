UPDATE smn_salud.smn_diagnostico SET
	dgn_codigo=${fld:dgn_codigo},
	dgn_descripcion=${fld:dgn_descripcion},
	dgn_tipo=${fld:dgn_tipo},
	dgn_idioma='${def:locale}',
	dgn_usuario='${def:user}',
	dgn_fecha_registro={d '${def:date}'},
	dgn_hora='${def:time}'

WHERE
	smn_diagnostico_id=${fld:id}

