INSERT INTO smn_salud.smn_solicitud_presupuesto
(
	smn_solicitud_presupuesto_id,
	spr_solicitud,
	smn_auxiliar,
	smn_contratante_id,
	-- smn_patologia_id,
	spr_dias_hospitalizacion,
	spr_horas_quirofano,
	spr_instrumentales,
	spr_honorarios,
	spr_estatus,
	spr_idioma,
	spr_usuario,
	spr_fecha_registro,
	spr_hora,
	smn_presupuesto_id,
	smn_documento_id
)
VALUES
(
	${seq:currval@smn_salud.seq_smn_solicitud_presupuesto},
	${seq:nextval@smn_salud.seq_solicitud_numero},
	${fld:smn_auxiliar},
	${fld:smn_contratante_id},
	-- ${fld:smn_patologia_id},
	${fld:spr_dias_hospitalizacion},
	${fld:spr_horas_quirofano},
	${fld:spr_instrumentales},
	${fld:spr_honorarios},
	${fld:spr_estatus},
	'${def:locale}',
	'${def:user}',
	{d '${def:date}'},
	'${def:time}',
	${seq:nextval@smn_salud.seq_smn_presupuesto},
	${fld:smn_documento_id}
);

