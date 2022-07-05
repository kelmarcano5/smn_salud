UPDATE smn_salud.smn_rel_documentos_servicios SET
	smn_documentos_id=${fld:smn_documentos_id},
	smn_servicios_id=${fld:smn_servicios_id},
	rdt_tipo_generacion=${fld:rdt_tipo_generacion},
	rdt_hora_generacion=${fld:rdt_hora_generacion}

WHERE
	smn_rel_documentos_servicios_id=${fld:id}

