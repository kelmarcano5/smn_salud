INSERT INTO smn_salud.smn_tramos
(
	smn_tramos_id,
	trm_codigo,
	trm_descripcion,
	trm_dia_semana,
	trm_hora_inicio,
	trm_hora_fin,
	trm_idioma,
	trm_usuario_id,
	trm_fecha_registro,
	trm_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_tramos},
	${fld:trm_codigo},
	${fld:trm_descripcion},
	${fld:trm_dia_semana},
	${fld:trm_hora_inicio},
	${fld:trm_hora_fin},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
