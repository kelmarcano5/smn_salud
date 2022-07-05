INSERT INTO smn_salud.smn_tipo_coberturas
(
	smn_tipo_coberturas_id,
	tco_codigo,
	tco_descripcion,
	tco_idioma,
	tco_usuario,
	tco_fecha_registro,
	tco_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_tipo_coberturas},
	${fld:tco_codigo},
	${fld:tco_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
