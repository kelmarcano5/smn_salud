INSERT INTO smn_base.smn_auxiliar_clase
(
	smn_auxiliar_clase_id,
	smn_auxiliar_id,
	smn_clase_auxiliar_id,
	acl_fecha_registro
)
VALUES
(
	${seq:nextval@smn_base.seq_smn_auxiliar_clase},
	?,
	?,
	{d '${def:date}'}
)
