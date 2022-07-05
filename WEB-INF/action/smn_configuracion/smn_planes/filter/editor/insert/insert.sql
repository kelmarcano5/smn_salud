INSERT INTO smn_salud.smn_planes
(
	smn_planes_id,
	pla_codigo,
	pla_descripcion,
	pla_vigencia_desde,
	pla_vigencia_hasta,
	pla_inactivo,
	pla_empresa,
	pla_idioma,
	pla_usuario,
	pla_fecha_registro,
	pla_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_planes},
	${fld:pla_codigo},
	${fld:pla_descripcion},
	${fld:pla_vigencia_desde},
	${fld:pla_vigencia_hasta},
	${fld:pla_inactivo},
	${fld:pla_empresa},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
