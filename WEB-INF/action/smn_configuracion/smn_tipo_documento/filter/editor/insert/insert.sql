INSERT INTO smn_salud.smn_tipo_documento
(
	smn_tipo_documento_id,
	tdc_codigo,
	tdc_nombre,
	tdc_naturaleza,
	tdc_idioma,
	tdc_usuario_id,
	tdc_fecha_registro,
	tdc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_tipo_documento},
	${fld:tdc_codigo},
	${fld:tdc_nombre},
	${fld:tdc_naturaleza},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
