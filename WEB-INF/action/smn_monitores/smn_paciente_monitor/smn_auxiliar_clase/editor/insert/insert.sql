INSERT INTO smn_base.smn_auxiliar_clase
(
	smn_auxiliar_clase_id,
	smn_auxiliar_id,
	smn_clase_auxiliar_id,
	acl_idioma,
	acl_usuario,
	acl_fecha_registro,
	acl_hora
)
VALUES
(
	${seq:currval@smn_base.seq_smn_auxiliar_clase},
	${fld:smn_auxiliar_id},
	${fld:smn_clase_auxiliar_id},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
