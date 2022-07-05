INSERT INTO smn_salud.smn_acciones
(
	smn_acciones_id,
	acc_codigo,
	acc_descripcion,
	acc_idioma,
	acc_usuario,
	acc_fecha_registro,
	acc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_acciones},
	${fld:acc_codigo},
	${fld:acc_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
