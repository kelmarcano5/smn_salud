INSERT INTO smn_salud.smn_origen
(
	smn_origen_id,
	ori_codigo,
	ori_descripcion,
	ori_tipo,
	ori_idioma,
	ori_usuario,
	ori_fecha_registro,
	ori_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_origen},
	${fld:ori_codigo},
	${fld:ori_descripcion},
	${fld:ori_tipo},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
