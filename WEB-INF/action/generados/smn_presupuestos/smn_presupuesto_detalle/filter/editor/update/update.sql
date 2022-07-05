UPDATE smn_salud.smn_presupuesto_detalle SET
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	prd_servicio=${fld:prd_servicio},
	prd_cantidad=${fld:prd_cantidad},
	prd_monto=${fld:prd_monto},
	prd_idioma='${def:locale}',
	prd_usuario='${def:user}',
	prd_fecha_registro={d '${def:date}'},
	prd_hora='${def:time}'

WHERE
	smn_presupuesto_detalle_id=${fld:id}

