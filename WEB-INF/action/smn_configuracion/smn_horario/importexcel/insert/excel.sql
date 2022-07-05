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
	${seq:nextval@smn_salud.seq_smn_horario},
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
