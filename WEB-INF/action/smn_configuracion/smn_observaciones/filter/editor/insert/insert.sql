INSERT INTO smn_salud.smn_observaciones
(
	smn_observaciones_id,
	obs_codigo,
	obs_descripcion,
	obs_tipo,
	obs_idioma,
	obs_usuario,
	obs_fecha_registro,
	obs_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_observaciones},
	${fld:obs_codigo},
	${fld:obs_descripcion},
	${fld:obs_tipo},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
