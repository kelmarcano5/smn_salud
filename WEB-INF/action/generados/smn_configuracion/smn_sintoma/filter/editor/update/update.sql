UPDATE smn_salud.smn_sintoma SET
	stm_codigo=${fld:stm_codigo},
	stm_descripcion=${fld:stm_descripcion},
	stm_idioma='${def:locale}',
	stm_usuario='${def:user}',
	stm_fecha_registro={d '${def:date}'},
	stm_hora='${def:time}'

WHERE
	smn_sintoma_id=${fld:id}

