INSERT INTO smn_salud.smn_estatus
(
	smn_estatus_id,
	sta_codigo,
	sta_descripcion,
	sta_cod_siguiente,
	sta_idioma,
	sta_usuario,
	sta_fecha_registro,
	sta_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_estatus},
	${fld:sta_codigo},
	${fld:sta_descripcion},
	${fld:sta_cod_siguiente},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
