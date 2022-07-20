UPDATE smn_salud.smn_plan_quirurgico SET
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_habitaciones_id=${fld:smn_habitaciones_id},
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	smn_contratante_id=${fld:smn_contratante_id},
	smn_clase_auxiliar_rf=${fld:smn_clase_auxiliar_rf},
	smn_auxiliar_rf=${fld:smn_auxiliar_rf},
	smn_patologia_rf=${fld:smn_patologia_rf},
	plq_fecha_cirugia=${fld:plq_fecha_cirugia},
	plq_hora_inicial=${fld:plq_hora_inicial},
	plq_hora_final=${fld:plq_hora_final},
	plq_cantidad_horas=${fld:plq_cantidad_horas},
	plq_observaciones=${fld:plq_observaciones},
	plq_estatus=${fld:plq_estatus},
	plq_idioma='${def:locale}',
	plq_usuario='${def:user}',
	plq_fecha_registro={d '${def:date}'},
	plq_hora='${def:time}'

WHERE
	smn_plan_quirurgico_id=${fld:id}

