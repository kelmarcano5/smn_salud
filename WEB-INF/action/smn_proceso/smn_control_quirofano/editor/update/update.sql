UPDATE smn_salud.smn_control_quirofano SET
	smn_agenda_rf=${fld:smn_agenda_rf},
	smn_presupuesto_id=${fld:smn_presupuesto_id},
	smn_ingreso_id=${fld:smn_ingreso_id},
	smn_prestacion_servicio_cabecera_id=${fld:smn_prestacion_servicio_cabecera_id},
	smn_prestación_servicio_medico_detalle_id=${fld:smn_prestación_servicio_medico_detalle_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	ccq_hora_entrada=${fld:ccq_hora_entrada},
	ccq_hora_salida=${fld:ccq_hora_salida},
	ccq_fecha_quirofano=${fld:ccq_fecha_quirofano},
	smn_habitaciones_id=${fld:smn_habitaciones_id},
	ccq_cantidad_horas=${fld:ccq_cantidad_horas},
	smn_unidad_medida_rf=${fld:smn_unidad_medida_rf},
	ccq_idioma='${def:locale}',
	ccq_usuario='${def:user}',
	ccq_fecha_registro={d '${def:date}'},
	ccq_hora='${def:time}'

WHERE
	smn_control_quirofano_id=${fld:id}

