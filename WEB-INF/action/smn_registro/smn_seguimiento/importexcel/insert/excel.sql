INSERT INTO smn_salud.smn_seguimiento
(
	smn_seguimiento_id,
	smn_ingreso_id,
	seg_fecha,
	seg_hora_seg,
	seg_accion,
	seg_observacion,
	seg_estatus,
	seg_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_seguimiento},
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
