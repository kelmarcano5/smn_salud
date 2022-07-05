UPDATE smn_salud.smn_rol SET
	smn_usuario_id=${fld:smn_usuario_id},
	rol_tipo=${fld:rol_tipo},
	smn_corporacion_rf=${fld:smn_corporacion_rf},
	smn_entidad_rf=${fld:smn_entidad_rf},
	smn_sucursal_rf=${fld:smn_sucursal_rf},
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	smn_estructura_organizacional_rf=${fld:smn_estructura_organizacional_rf},
	rol_idioma='${def:locale}',
	rol_usuario_id='${def:user}',
	rol_fecha_registro={d '${def:date}'},
	rol_hora='${def:time}'

WHERE
	smn_rol_id=${fld:id}

