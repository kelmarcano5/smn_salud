UPDATE smn_salud.smn_ruta_paciente SET
	rta_estatus=${fld:smn_estatus},
	rta_observacion=${fld:rta_observacion}

WHERE
	smn_ruta_id=${fld:id}

