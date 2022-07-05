INSERT INTO smn_salud.smn_estado_presupuesto
(
	smn_estado_presupuesto_id,
	epr_codigo,
	epr_descripcion,
	epr_idioma,
	epr_usuario,
	epr_fecha_registro,
	epr_hora
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_estado_presupuesto},
	${fld:epr_codigo},
	${fld:epr_descripcion},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
