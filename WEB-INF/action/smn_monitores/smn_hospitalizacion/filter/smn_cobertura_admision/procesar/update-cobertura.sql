UPDATE smn_salud.smn_cobertura_admision SET
	coa_estatus_proceso='GE',
	coa_estatus_financiero='AP'
WHERE
	smn_ingresos_id=${fld:smn_ingresos_id};