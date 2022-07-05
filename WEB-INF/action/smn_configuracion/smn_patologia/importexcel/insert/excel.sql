INSERT INTO smn_salud.smn_patologia
(
	smn_patologia_id,
	pat_codigo,
	pat_descripcion,
	pat_estatus,
	pat_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_patologia},
	?,
	?,
	?,
	{d '${def:date}'}
)
