INSERT INTO smn_salud.smn_tipo_documento_afiliado
(
	smn_tipo_documento_afiliado_id,
	tdo_codigo,
	tdo_descripcion,
	tdo_idioma,
	tdo_usuario,
	tdo_fecha_registro,
	tdo_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_tipo_documento_afiliado},
	${fld:tdo_codigo2},
	${fld:tdo_descripcion2},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
