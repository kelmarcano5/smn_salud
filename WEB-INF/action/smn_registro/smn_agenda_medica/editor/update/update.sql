UPDATE smn_salud.smn_agenda_medica SET
	smn_agenda_id=${fld:smn_agenda_id},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidades_servicios_rf=${fld:smn_unidades_servicios_rf},
	smn_grupo_prestador_servicio_rf=${fld:smn_grupo_prestador_servicio_rf},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf},
	smn_especialidad_rf=${fld:smn_especialidad_rf},
	agm_jornada_desde_rf=${fld:agm_jornada_desde_rf},
	agm_frecuencia=${fld:agm_frecuencia},
	agm_cantidad_frecuencia=${fld:agm_cantidad_frecuencia},
	agm_estatus=${fld:agm_estatus},
	agm_idioma='${def:locale}',
	agm_usuario='${def:user}',
	agm_fecha_registro={d '${def:date}'},
	agm_hora='${def:time}',
	smn_habitaciones_id=${fld:smn_habitaciones_id}

WHERE
	smn_agenda_medica_id=${fld:id}

