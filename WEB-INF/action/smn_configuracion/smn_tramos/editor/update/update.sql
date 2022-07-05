UPDATE smn_salud.smn_tramos SET
	trm_codigo=${fld:trm_codigo},
	trm_descripcion=${fld:trm_descripcion},
	trm_dia_semana=${fld:trm_dia_semana},
	trm_hora_inicio=${fld:trm_hora_inicio},
	trm_hora_fin=${fld:trm_hora_fin},
	trm_idioma='${def:locale}',
	trm_usuario_id='${def:user}',
	trm_fecha_registro={d '${def:date}'},
	trm_hora='${def:time}'

WHERE
	smn_tramos_id=${fld:id}

