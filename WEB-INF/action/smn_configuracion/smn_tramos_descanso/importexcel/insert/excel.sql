INSERT INTO smn_salud.smn_tramos_descanso
(
	smn_tramo_descanso_id,
	smn_tramos_id,
	trd_hora_descanso_desde,
	trd_hora_descanso_hasta,
	trd_idioma,
	trd_usuario_id,
	trd_fecha_registro,
	trd_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_tramos_descanso},
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
