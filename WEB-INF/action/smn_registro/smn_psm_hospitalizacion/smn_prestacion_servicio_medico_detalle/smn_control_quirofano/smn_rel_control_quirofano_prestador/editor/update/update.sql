UPDATE smn_salud.smn_rel_control_quirofano_prestador SET
	smn_control_quirofano_id=${fld:smn_control_quirofano_id},
	smn_servicios_rf=${fld:smn_servicios_rf},
	smn_componente_rf=${fld:smn_componente_rf},
	smn_grupo_prestador_servicio_rf=${fld:smn_grupo_prestador_servicio_rf},
	smn_prestador_servicio_rf=${fld:smn_prestador_servicio_rf}

WHERE
	smn_rel_control_quirofano_prestador_id=${fld:id}

