INSERT INTO smn_salud.smn_patologia
(
	smn_patologia_id,
	pat_codigo,
	pat_descripcion,
	pat_estatus,
	pat_idioma,
	pat_usuario,
	pat_fecha_registro,
	pat_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_patologia},
	${fld:pat_codigo},
	${fld:pat_descripcion},
	${fld:pat_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
