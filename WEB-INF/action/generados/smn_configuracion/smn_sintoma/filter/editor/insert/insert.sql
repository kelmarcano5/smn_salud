INSERT INTO smn_salud.smn_sintoma
(
	smn_sintoma_id,
	stm_codigo,
	stm_descripcion,
	stm_idioma,
	stm_usuario,
	stm_fecha_registro,
	stm_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_sintoma},
	${fld:stm_codigo},
	${fld:stm_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
