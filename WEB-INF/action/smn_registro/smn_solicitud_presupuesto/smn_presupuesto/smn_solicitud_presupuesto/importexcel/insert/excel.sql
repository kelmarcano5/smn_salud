INSERT INTO smn_salud.smn_solicitud_presupuesto
(
	smn_solicitud_presupuesto_id,
	spr_solicitud,
	smn_auxiliar,
	smn_contratante_id,
	smn_patologia_id,
	spr_dias_hospitalizacion,
	spr_horas_quirofano,
	spr_instrumentales,
	spr_honorarios,
	spr_estatus,
	spr_fecha_registro
)
VALUES
(
	${seq:nextval@smn_salud.seq_smn_solicitud_presupuesto},
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	?,
	{d '${def:date}'}
)
