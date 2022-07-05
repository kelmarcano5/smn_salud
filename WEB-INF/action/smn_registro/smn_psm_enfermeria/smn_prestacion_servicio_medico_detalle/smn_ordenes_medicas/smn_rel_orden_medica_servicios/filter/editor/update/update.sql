UPDATE smn_salud.smn_rel_orden_medica_servicios SET
	smn_ordenes_medicas_id=${fld:smn_ordenes_medicas_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	ros_observacion=${fld:ros_observacion},
	smn_grupo_prestador_rf=${fld:smn_grupo_prestador_rf},
	smn_prestador_servicio_referido_rf=${fld:smn_prestador_servicio_rf}

WHERE
	smn_rel_orden_medica_servicios_id=${fld:id}

