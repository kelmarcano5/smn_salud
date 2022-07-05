UPDATE smn_salud.smn_planificacion_de_turno SET
	smn_usuario_id=${fld:smn_usuario_id},
	smn_rol_id=${fld:smn_rol_id},
	ptu_fecha=${fld:ptu_fecha},
	smn_serie_id=${fld:smn_serie_id},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidad_servicio_rf = ${fld:smn_unidad_servicio_rf},
	ptu_estatus=${fld:ptu_estatus},
	ptu_idioma='${def:locale}',
	ptu_usuario='${def:user}',
	ptu_fecha_registro={d '${def:date}'},
	ptu_hora='${def:time}',
	smn_puesto_atencion_id=${fld:smn_puesto_atencion_id}
WHERE
	smn_plan_turno_id=${fld:id}

