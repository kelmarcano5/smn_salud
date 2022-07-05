INSERT INTO smn_salud.smn_puesto_atencion
(
	smn_puesto_atencion_id,
	put_codigo,
	put_descripcion,
	put_estatus,
	put_idioma,
	put_usuario,
	put_fecha_registro,
	put_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_puesto_atencion},
	${fld:put_codigo},
	${fld:put_descripcion},
	${fld:put_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
