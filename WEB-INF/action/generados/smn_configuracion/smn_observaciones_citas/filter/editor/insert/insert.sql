INSERT INTO smn_salud.smn_observaciones_citas
(
	smn_observaciones_citas_id,
	obc_codigo,
	obc_descripcion,
	obc_idioma,
	obc_usuario,
	obc_fecha_registro,
	obc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_observaciones_citas},
	${fld:obc_codigo},
	${fld:obc_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
