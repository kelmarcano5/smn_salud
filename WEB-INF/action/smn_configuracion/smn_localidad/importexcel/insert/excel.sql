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
	${seq:nextval@smn_salud.seq_smn_localidad},
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
