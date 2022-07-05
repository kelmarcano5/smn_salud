INSERT INTO smn_salud.smn_habitaciones
(
	smn_habitaciones_id,
	smn_activo_fijo_rf,
	hab_codigo,
	hab_descripcion,
	hab_estatus,
	hab_clase,
	hab_tipo_servicio,
	hab_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_habitaciones},
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
