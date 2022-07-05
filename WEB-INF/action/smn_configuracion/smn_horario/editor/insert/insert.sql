INSERT INTO smn_salud.smn_horario
(
	smn_horarios_id,
	hor_codigo,
	hor_descripcion,
	hor_status,
	hor_idioma,
	hor_usuario_id,
	hor_fecha_registro,
	hor_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_horario},
	${fld:hor_codigo},
	${fld:hor_descripcion},
	${fld:hor_status},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
