UPDATE smn_salud.smn_dispositivos SET
	dis_codigo=${fld:dis_codigo},
	dis_nombre=${fld:dis_nombre},
	dis_tipo=${fld:dis_tipo},
	dis_mac_address=${fld:dis_mac_address},
	smn_usuario_id=${fld:smn_usuario_id},
	smn_entidades_rf=${fld:smn_entidades_rf},
	smn_sucursales_rf=${fld:smn_sucursales_rf},
	smn_areas_servicios_rf=${fld:smn_areas_servicios_rf},
	smn_unidad_servicio_rf=${fld:smn_unidad_servicio_rf},
	dis_idioma='${def:locale}',
	dis_usuario_id='${def:user}',
	dis_fecha_registro={d '${def:date}'},
	dis_hora='${def:time}'

WHERE
	smn_dispositivos_id=${fld:id}

