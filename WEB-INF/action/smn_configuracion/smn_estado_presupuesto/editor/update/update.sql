UPDATE smn_salud.smn_estado_presupuesto SET
	epr_codigo=${fld:epr_codigo},
	epr_descripcion=${fld:epr_descripcion},
	epr_idioma='${def:locale}',
	epr_usuario='${def:user}',
	epr_fecha_registro={d '${def:date}'},
	epr_hora='${def:time}'

WHERE
	smn_estado_presupuesto_id=${fld:id}

