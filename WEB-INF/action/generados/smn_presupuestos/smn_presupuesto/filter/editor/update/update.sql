UPDATE smn_salud.smn_presupuesto SET
	pre_numero_control=${fld:pre_numero_control},
	pre_fecha=${fld:pre_fecha},
	pre_titular=${fld:pre_titular},
	pre_beneficiario=${fld:pre_beneficiario},
	pre_plan=${fld:pre_plan},
	pre_clase_auxiliar=${fld:pre_clase_auxiliar},
	pre_auxiliar=${fld:pre_auxiliar},
	pre_vigencia_hasta=${fld:pre_vigencia_hasta},
	smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id},
	smn_estado_presupuesto_id=${fld:smn_estado_presupuesto_id},
	pre_idioma='${def:locale}',
	pre_usuario='${def:user}',
	pre_fecha_registro={d '${def:date}'},
	pre_hora='${def:time}'

WHERE
	smn_presupuesto_id=${fld:id}

