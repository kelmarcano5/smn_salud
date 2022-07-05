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
	${fld:ori_codigo2},
	${fld:ori_descripcion2},
	${fld:ori_tipo2},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
