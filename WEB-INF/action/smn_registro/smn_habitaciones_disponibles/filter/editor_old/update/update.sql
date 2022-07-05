UPDATE smn_salud.smn_habitaciones_disponibles SET
	smn_habitaciones_id=${fld:smn_habitaciones_id},
	smn_ingreso_id=${fld:smn_ingreso_id},
	had_fecha_ingreso=${fld:had_fecha_ingreso},
	had_fecha_egreso=${fld:had_fecha_egreso},
	had_estatus=${fld:had_estatus},
	had_idioma='${def:locale}',
	had_usuario='${def:user}',
	had_fecha_registro={d '${def:date}'},
	had_hora='${def:time}'

WHERE
	smn_habitaciones_disponibles_id=${fld:id}

