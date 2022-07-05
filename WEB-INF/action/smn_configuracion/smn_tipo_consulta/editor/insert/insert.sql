INSERT INTO smn_salud.smn_tipo_consulta
(
	smn_tipo_consulta_id,
	tcs_codigo,
	tcs_nombre,
	tcs_idioma,
	tcs_usuario_id,
	tcs_fecha_registro,
	tcs_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_tipo_consulta},
	${fld:tcs_codigo},
	${fld:tcs_nombre},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
