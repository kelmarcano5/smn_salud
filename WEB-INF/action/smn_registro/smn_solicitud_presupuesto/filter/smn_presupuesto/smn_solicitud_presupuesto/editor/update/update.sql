UPDATE smn_salud.smn_solicitud_presupuesto SET
	spr_solicitud=${fld:spr_solicitud},
	smn_auxiliar=${fld:smn_auxiliar},
	smn_contratante_id=${fld:smn_contratante_id},
	smn_patologia_id=${fld:smn_patologia_id},
	spr_dias_hospitalizacion=${fld:spr_dias_hospitalizacion},
	spr_horas_quirofano=${fld:spr_horas_quirofano},
	spr_instrumentales=${fld:spr_instrumentales},
	spr_honorarios=${fld:spr_honorarios},
	spr_estatus=${fld:spr_estatus},
	spr_idioma='${def:locale}',
	spr_usuario='${def:user}',
	spr_fecha_registro={d '${def:date}'},
	spr_hora='${def:time}',	
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	smn_documento_id=${fld:smn_documento_id}

WHERE
	smn_solicitud_presupuesto_id=${fld:id}

