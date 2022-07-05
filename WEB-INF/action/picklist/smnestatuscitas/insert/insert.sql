INSERT INTO smn_salud.smn_estatus_citas
(
	smn_estatus_citas_id,
	eci_num_secuencia,
	eci_descripcion,
	eci_aplica,
	eci_idioma,
	eci_usuario,
	eci_fecha_registro,
	eci_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_estatus_citas},
	${fld:eci_num_secuencia2},
	${fld:eci_descripcion2},
	${fld:eci_aplica2},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
