INSERT INTO smn_salud.smn_habitaciones_disponibles
(
	smn_habitaciones_disponibles_id,
	smn_habitaciones_id,
	smn_ingreso_id,
	had_fecha_ingreso,
	had_fecha_egreso,
	had_estatus,
	had_idioma,
	had_usuario,
	had_fecha_registro,
	had_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_habitaciones_disponibles},
	${fld:smn_habitaciones_id},
	${fld:smn_ingreso_id},
	${fld:had_fecha_ingreso},
	${fld:had_fecha_egreso},
	${fld:had_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
