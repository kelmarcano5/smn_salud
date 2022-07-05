UPDATE smn_salud.smn_habitaciones SET
	smn_activo_fijo_rf=${fld:smn_activo_fijo_rf},
	hab_codigo=${fld:hab_codigo},
	hab_descripcion=${fld:hab_descripcion},
	hab_estatus=${fld:hab_estatus},
	hab_clase=${fld:hab_clase},
	hab_tipo_servicio=${fld:hab_tipo_servicio},
	hab_idioma='${def:locale}',
	hab_usuario='${def:user}',
	hab_fecha_registro={d '${def:date}'},
	hab_hora='${def:time}',
	hab_naturaleza=${fld:hab_naturaleza},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf}

WHERE
	smn_habitaciones_id=${fld:id}

