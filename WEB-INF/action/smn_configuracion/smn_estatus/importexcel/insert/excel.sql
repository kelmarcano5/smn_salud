INSERT INTO smn_salud.smn_estatus
(
	smn_estatus_id,
	sta_codigo,
	sta_descripcion,
	sta_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_estatus},
	?,
	?,
	{d '${def:date}'}
)
