INSERT INTO smn_salud.smn_puesto_atencion
(
	smn_puesto_atencion_id,
	put_codigo,
	put_descripcion,
	put_estatus,
	put_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_puesto_atencion},
	?,
	?,
	?,
	{d '${def:date}'}
)
