INSERT INTO smn_salud.smn_presupuesto_detalle
(
	smn_presupuesto_detalle_id,
	smn_presupuesto_id,
	prd_servicio,
	prd_cantidad,
	prd_monto,
	prd_idioma,
	prd_usuario,
	prd_fecha_registro,
	prd_hora
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_presupuesto_detalle},
	?,
	?,
	?,
	?,
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}'
)
