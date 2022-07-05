INSERT INTO smn_salud.smn_acciones
(
	smn_acciones_id,
	acc_codigo,
	acc_descripcion,
	acc_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_acciones},
	?,
	?,
	{d '${def:date}'}
)
