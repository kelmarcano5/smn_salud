INSERT INTO smn_salud.smn_habitaciones_disponibles
(
	smn_habitaciones_disponibles_id,
	smn_habitaciones_id,
	smn_ingreso_id,
	had_fecha_ingreso,
	had_fecha_egreso,
	had_estatus,
	had_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_habitaciones_disponibles},
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
