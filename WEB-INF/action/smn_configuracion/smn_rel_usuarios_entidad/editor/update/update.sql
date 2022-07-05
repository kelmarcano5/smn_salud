UPDATE smn_salud.smn_rel_usuarios_entidad SET
	smn_usuario_rf=${fld:smn_usuario_rf},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_area_servicio_rf=${fld:smn_area_servicio_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf}

WHERE
	smn_rel_usuario_entidad_id=${fld:id}

