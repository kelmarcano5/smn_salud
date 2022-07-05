UPDATE smn_salud.smn_capacidades_unidad SET
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	cap_cant_max_pacientes=${fld:cap_cant_max_pacientes},
	cap_cant_min_pacientes=${fld:cap_cant_min_pacientes},
	cap_idioma='${def:locale}',
	cap_usuario_id='${def:user}',
	cap_fecha_registro={d '${def:date}'},
	cap_hora='${def:time}'

WHERE
	smn_capacidades_id=${fld:id}

