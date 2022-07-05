INSERT INTO smn_salud.smn_localidad
(
	smn_localidad_id,
	loc_codigo,
	loc_descripcion,
	loc_status,
	loc_idioma,
	loc_usuario_id,
	loc_fecha_registro,
	loc_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_localidad},
	${fld:loc_codigo},
	${fld:loc_descripcion},
	${fld:loc_status},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
