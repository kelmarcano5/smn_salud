INSERT INTO smn_salud.smn_observaciones_ingresos
(
	smn_observaciones_ingresos_id,
	obi_codigo,
	obi_descripcion,
	obi_idioma,
	obi_usuario,
	obi_fecha_registro,
	obi_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_observaciones_ingresos},
	${fld:obi_codigo2},
	${fld:obi_descripcion2},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
