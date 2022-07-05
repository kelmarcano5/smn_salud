UPDATE smn_salud.smn_cobertura_admision SET
	coa_observacion_inicial=${fld:coa_observacion_inicial},
	coa_fecha_aprobacion=${fld:coa_fecha_aprobacion},
	coa_hora_aprobacion=${fld:coa_hora_aprobacion},
	coa_estatus_proceso='AP'

WHERE
	smn_cobertura_admision_id=${fld:id}

